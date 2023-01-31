package bookshop.controller.user;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.UserService;

@Controller
public class ContactController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CartService cartService;
	@Autowired
	UserService userService;
	@Autowired
	BillService billService;
	
	@RequestMapping(value = { "/contact"})
	public String viewHome(Model model,HttpSession session) {
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("activePage", "contact");
			return "user/contact";
			
		} catch (Exception e) {
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("activePage", "contact");
			return "user/contact";		}
			
		}
	
}
