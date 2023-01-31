package bookshop.controller.user;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bookshop.constant.Constant;
import bookshop.entity.Bill;
import bookshop.entity.BillDetail;
import bookshop.entity.Cart;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.ProductService;
import bookshop.service.UserService;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	@Autowired
	private CartService cartService;
	@Autowired
	private BillService billService;
	@Autowired
	private ProductService productService;
	@Autowired
	UserService userService;
	
	// Display view checkout
	@GetMapping("/view-checkout")
	public String viewCheckout(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null) {
			return "redirect:/account/view-login";
		} else {
			List<Cart> listCart = cartService.getCartByUser(userLogin.getId());
			model.addAttribute("cartItem", listCart);
			model.addAttribute("userLogin", userLogin);
			model.addAttribute("bill", new Bill());
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("total", cartService.totalPrice(userLogin.getId()));
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));

			List<Product> list = new ArrayList<Product>();
			for (Cart cart : listCart) {
				Product product = productService.getProductByID(cart.getBookId());
				list.add(product);
			}
			model.addAttribute("list", list);
			return "user/checkout";
		}

	}

	// Create Bill
	@PostMapping("/create-bill")
	public String createBill(Model model, HttpSession session, @ModelAttribute("bill") Bill bill,
			@RequestParam("totalPrice") Double totalPrice,RedirectAttributes redirectAttributes) {
		User userLogin = (User) session.getAttribute("userLogin");
		List<Cart> listCart = cartService.getCartByUser(userLogin.getId());
		/*
		 * Create Bill
		 * 
		 */
		Bill createBill = new Bill();
		createBill.setTotalPrice(totalPrice);
		createBill.setCreateDate(new Date());
		createBill.setRecipientName(bill.getRecipientName());
		createBill.setDeliveryAddress(bill.getDeliveryAddress());
		createBill.setPhone(bill.getPhone());
		createBill.setNote(bill.getNote());
		createBill.setPaymentMethod("Payment on delivery");
		createBill.setUser(userLogin);
		createBill.setStatus("Wait confirmation");
		boolean bl = billService.createBill(createBill);

		if (bl) {
			model.addAttribute("createBillSuccess", "CREATE BILL SUCCESS");
			/* Lấy id hóa đơn lớn nhất theo user */
			Long idBillMax = billService.getIdBillMaxByUser(userLogin.getId());
			if (idBillMax == null) {
				return "redirect:cart/view-cart";
			} else {
				Bill billGetById = billService.getBillById(idBillMax);
				/*
				 * Create BillDetail
				 * 
				 */
				for (Cart cart : listCart) {
					Product product = productService.getProductByID(cart.getBookId());
					BillDetail createBillDetail = new BillDetail();
					createBillDetail.setBookId(cart.getBookId());
					createBillDetail.setQuantity(cart.getQuantity());
					createBillDetail.setPrice(cart.getPrice());
					createBillDetail.setBookName(cart.getBookName());
					createBillDetail.setBookImage(cart.getBookImage());
					createBillDetail.setCategoryId(product.getCategory().getId());
					createBillDetail.setCategoryName(product.getCategory().getCategoryName());
					createBillDetail.setAuthorId(product.getAuthor().getId());
					createBillDetail.setAuthorName(product.getAuthor().getAuthorName());
					createBillDetail.setBill(billGetById);
					billService.createBillDetail(createBillDetail);

					// Update số lượng sau khi đặt hàng
					product.setQuantity(product.getQuantity() - cart.getQuantity());
					productService.updateProduct(product);
				}
			}

		} else {
			model.addAttribute("errCreateBill", "ERR CREATE BILL");
		}
		// Delete Cart sau khi đặt hàng
		cartService.deleteCart(userLogin.getId());
		redirectAttributes.addFlashAttribute("orderSuccess", Constant.ORDER_SUCCESS);
		return "redirect:/cart/view-cart";
	}

	// Update số lượng = số lượng tồn kho
	@GetMapping("/update-iventoty/{product_id}")
	public String updateIventoty(@PathVariable Long product_id, HttpSession session, final HttpServletRequest request) {
		User userLogin = (User) session.getAttribute("userLogin");
		Cart productCart = cartService.getCartByProductAndUser(product_id, userLogin.getId());
		Product product = productService.getProductByID(product_id);
		if (product.getQuantity() == 0) {
			cartService.deleteItem(product_id, userLogin.getId());
			return "redirect:" + request.getHeader("Referer");
		} else {
			productCart.setQuantity(product.getQuantity());
			cartService.updateCart(productCart);
			return "redirect:" + request.getHeader("Referer");
		}

	}
}
