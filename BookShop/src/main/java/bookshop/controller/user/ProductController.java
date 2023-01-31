package bookshop.controller.user;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.AuthorService;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;


@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AuthorService authorService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BillService billService;
		
	@GetMapping(value = "/view-productdetail/{id}")
	public String viewProductDetail(Model model, @PathVariable("id") Long id,HttpSession session) {
		try {
			model.addAttribute("activePage","product");
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			Product product = productService.getProductByID(id);
			model.addAttribute("product", product);
			// Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			//Display Category to nav
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
			return "user/product-detail";
		} catch (Exception e) {
			model.addAttribute("activePage","product");
			Product product = productService.getProductByID(id);
			model.addAttribute("product", product);
			// Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			//Display Category to nav
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
			return "user/product-detail";
		}
	}

	// Load sản phẩm ra trang sản phẩm có phân trang
	@GetMapping(value = "/view-product")
	public String viewProduct(Model model, @RequestParam(required = false) Map<String, String> param,HttpSession session) {
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("activePage","product");
			// Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			Integer page = Integer.parseInt(param.getOrDefault("page", "1"));
			List<Product> list = productService.loadProductByPage(page);
			model.addAttribute("products", list);
			model.addAttribute("count", productService.countProduct());
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "/user/product";
		} catch (Exception e) {
			model.addAttribute("activePage","product");
			// Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			Integer page = Integer.parseInt(param.getOrDefault("page", "1"));
			List<Product> list = productService.loadProductByPage(page);
			model.addAttribute("products", list);
			model.addAttribute("count", productService.countProduct());
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "/user/product";
		}
	}

	// Display view product-by-author
	@GetMapping("/view-product-by-author/{id}")
	public String viewProductByAuthor(Model model, @PathVariable("id") Long id,HttpSession session) {
		try {
			model.addAttribute("activePage","author");
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("productsByAuthor", productService.loadProductByAuthor(id));
			// Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			//Load Author by ID
			model.addAttribute("author",authorService.getAuthorById(id));
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "user/product-by-author";
		} catch (Exception e) {
			model.addAttribute("activePage","author");
			model.addAttribute("productsByAuthor", productService.loadProductByAuthor(id));
			// Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			//Load Author by ID
			model.addAttribute("author",authorService.getAuthorById(id));
			List<Product> lstP = new ArrayList<>();
			List<Object[]> lstObj = billService.top3Book();
			for (Object[] objects : lstObj) {
				Product productSell = productService.getProductByID((Long) objects[1]);
				if(productSell!=null) {
					lstP.add(productSell);
				}
			}
			model.addAttribute("top3ProductSell",lstP);
			return "user/product-by-author";
		}

	}
	
}
