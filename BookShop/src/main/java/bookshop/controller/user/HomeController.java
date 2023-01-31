package bookshop.controller.user;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bookshop.entity.CustomUserDetails;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;
import bookshop.service.UserService;

@Controller
public class HomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CartService cartService;
	@Autowired
	UserService userService;
	@Autowired
	BillService billService;

	@RequestMapping(value = { "/", "/home" })
	public String viewHome(Model model, HttpSession session) {
		try {
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			User userLogin = userService.checkEmail(user.getEmail());
			session.setAttribute("userLogin", userLogin);
			model.addAttribute("activePage", "home");
			List<Product> listProducts = productService.loadTop10NewUpDate();
			model.addAttribute("listProducts", listProducts);
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product product = productService.getProductByID((Long) objects[1]);
				if(product!=null) {
					lstP.add(product);
				}	
			}
			model.addAttribute("top3ProductSell",lstP);
			
			return "user/index";
		} catch (Exception e) {
			model.addAttribute("activePage", "home");
			List<Product> listProducts = productService.loadTop10NewUpDate();
			model.addAttribute("listProducts", listProducts);
			model.addAttribute("listCategory", categoryService.getCategory());
			
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product product = productService.getProductByID((Long) objects[1]);
				if(product!=null) {
					lstP.add(product);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			
			return "user/index";
		}

	}

}
