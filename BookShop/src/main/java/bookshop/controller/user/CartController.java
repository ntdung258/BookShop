package bookshop.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import bookshop.constant.Constant;
import bookshop.entity.Cart;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.CartService;
import bookshop.service.ProductService;
import bookshop.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	@Autowired
	UserService userService;

	// Display view cart
	@GetMapping("/view-cart")
	public String viewCart(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null) {
			return "redirect:/account/view-login";
		} else {
			List<Cart> listCart = cartService.getCartByUser(userLogin.getId());
			if (listCart.size() == 0) {
				model.addAttribute("noDataCart", Constant.NO_DATA_CART);
			} else {
				model.addAttribute("cartItem", listCart);
			}
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("total", cartService.totalPrice(userLogin.getId()));

			List<Long> list = new ArrayList<>();
			for (Cart cart : listCart) {
				Product product = productService.getProductByID(cart.getBookId());
				if (product == null) {
					list.add((long) 0);
				} else {
					list.add(product.getId());
				}
				model.addAttribute("list", list);
			}
			return "user/cart";
		}

	}

	/*
	 * Nếu sản phẩm chưa có trong giỏ hàng , thì thêm sản phẩm Sản phẩm đã có trong
	 * giỏ hàng thì thay đổi số lượng
	 * 
	 */

	@GetMapping("/add-to-cart/{id}")
	public String addToCart(Model model, HttpSession session, @PathVariable Long id, final HttpServletRequest request) {
		User userLogin = (User) session.getAttribute("userLogin");
		Cart cart = cartService.getCartByProductAndUser(id, userLogin.getId());
		Product proudct = productService.getProductByID(id);
		if (cart == null) {
			Cart addCart = new Cart();
			addCart.setCreateDate(new Date());
			addCart.setUserId(userLogin.getId());
			addCart.setBookId(proudct.getId());
			addCart.setQuantity(1);
			addCart.setPrice(proudct.getPrice());
			addCart.setBookName(proudct.getBookName());
			addCart.setBookImage(proudct.getBookImage());
			cartService.addCart(addCart);
			return "redirect:" + request.getHeader("Referer");
		} else {
			cart.setQuantity(cart.getQuantity() + 1);
			cartService.updateCart(cart);
			return "redirect:" + request.getHeader("Referer");
		}
	}

	// Update số lượng trong giỏ hàng
	@GetMapping("/update-quantity/{product_id}/{quantity}")
	public String updateCart(@PathVariable Long product_id, @PathVariable int quantity, HttpSession session,
			final HttpServletRequest request) {
		User userLogin = (User) session.getAttribute("userLogin");
		Cart productCart = cartService.getCartByProductAndUser(product_id, userLogin.getId());
		productCart.setQuantity(quantity);
		cartService.updateCart(productCart);
		return "redirect:" + request.getHeader("Referer");
	}

	/*
	 * Nếu quantity giỏ hàng > quantity tồn kho Update quantity giỏ hàng = quantity
	 * tồn kho
	 * 
	 */
	@GetMapping("/delete-product/{product_id}")
	public String deleteProductInCart(@PathVariable Long product_id, HttpSession session,
			final HttpServletRequest request) {
		User userLogin = (User) session.getAttribute("userLogin");
		cartService.deleteItem(product_id, userLogin.getId());
		return "redirect:" + request.getHeader("Referer");
	}

}
