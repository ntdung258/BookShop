package bookshop.controller.user;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.AuthorService;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;


@Controller
@RequestMapping("/author")
public class AuthorController {
	@Autowired
	private AuthorService authorService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BillService billService;
	@Autowired
	private ProductService productService;
	// Display view author
	@GetMapping("/view-author")
	public String viewAuthor(Model model,HttpSession session) {
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("activePage","author");
			model.addAttribute("listAuthors", authorService.getAuthors());
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "user/author";
		} catch (Exception e) {
			model.addAttribute("activePage","author");
			model.addAttribute("listAuthors", authorService.getAuthors());
			model.addAttribute("listCategory", categoryService.getCategory());
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "user/author";
		}
	}
	
}
