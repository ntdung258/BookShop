package bookshop.controller.user;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;
import bookshop.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	private SearchService searchService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BillService billService;
	@Autowired
	private ProductService productService;
	
	@GetMapping(value =  "/view-search" )
	public String viewProductDetail(Model model,@RequestParam("search") String name,HttpSession session) {
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			List<Product> list = searchService.searchProductByNameAndAuthor(name);
			if(list.size()==0) {
				model.addAttribute("noDataSearch", "No results found");
			}else {
				model.addAttribute("products", list);
			}
			//Display Category to nav
			model.addAttribute("listCategory", categoryService.getCategory());
			//Display Category to nav
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
			
			model.addAttribute("name",name);
			return "user/search";
		} catch (Exception e) {
			List<Product> list = searchService.searchProductByNameAndAuthor(name);
			model.addAttribute("products", list);
			//Display Category to nav
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
			model.addAttribute("name",name);
			return "user/search";
		}
	}
}
