package bookshop.controller.user;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;


@Controller
@RequestMapping(value = "/category")
public class CategoryController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BillService billService;
	
	// Display view category
	@GetMapping(value = "/view-category/{id}")
	public String viewCategory(Model model, @PathVariable("id") Long id,HttpSession session) {
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("activePage","category");
			List<Product> listProductByIdCategory = productService.loadProductByIDCategory(id);
			model.addAttribute("listProductByIdCategory", listProductByIdCategory);
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("listCategory", categoryService.getCategory());	
			model.addAttribute("categoryNameById", categoryService.getCategoryById(id));
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "user/category";
		} catch (Exception e) {
			model.addAttribute("activePage","category");
			List<Product> listProductByIdCategory = productService.loadProductByIDCategory(id);
			model.addAttribute("listProductByIdCategory", listProductByIdCategory);
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("listCategory", categoryService.getCategory());	
			model.addAttribute("categoryNameById", categoryService.getCategoryById(id));
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "user/category";
		}

	}
}