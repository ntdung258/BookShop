package bookshop.controller.admin;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bookshop.constant.Constant;
import bookshop.entity.Product;
import bookshop.service.AuthorService;
import bookshop.service.BillService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;
import bookshop.service.SearchService;

@Controller
@RequestMapping(value = "/admin/product")
public class AdminProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private AuthorService authorService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private BillService billService;


	@InitBinder
	public void initBinder(WebDataBinder data) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		data.registerCustomEditor(Date.class, new CustomDateEditor(sf, false));
	}

	@GetMapping(value = { "/view-product" })
	public String viewProductAdmin(Model model, @RequestParam(required = false) Map<String, String> param) {
		Integer page = Integer.parseInt(param.getOrDefault("page", "1"));
		List<Product> list = productService.loadProductByPage(page);
		model.addAttribute("count", productService.countProduct());
		model.addAttribute("products", list);
		model.addAttribute("activePage", "product");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/product/view-product";
	}

	@GetMapping(value = { "/view-add-product" })
	public String viewAddProductAdmin(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("authors", authorService.getAuthors());
		model.addAttribute("categories", categoryService.getCategory());
		model.addAttribute("activePage", "product");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/product/add-product";
	}

	/**
	 * Add Product
	 * 
	 */
	@PostMapping(value = { "/add-product" })
	public String addProductAdmin(Model model, @ModelAttribute("product") Product product, BindingResult result,
			HttpServletRequest request, @RequestParam("imageSource") MultipartFile imageSource,
			@RequestParam("author") Long author_id, @RequestParam("category") Long category_id,RedirectAttributes redirectAttributes) {

		Product addProduct = new Product();
		addProduct.setBookName(product.getBookName());
		addProduct.setAuthor(authorService.getAuthorById(author_id));
		addProduct.setCategory(categoryService.getCategoryById(category_id));
		addProduct.setQuantity(product.getQuantity());
		addProduct.setPrice(product.getPrice());
		addProduct.setPages(product.getPages());
		addProduct.setLanguage(product.getLanguage());
		addProduct.setPublicationDate(product.getPublicationDate());
		addProduct.setPublisher(product.getPublisher());
		addProduct.setCreateDate(new Date());

		String path = request.getServletContext().getRealPath("/resource/images/books/");
		File f = new File(path);

		File destination = new File(f.getAbsolutePath() + "/" +product.getId() +imageSource.getOriginalFilename());
		if (!destination.exists()) {
			try {
				Files.write(destination.toPath(), imageSource.getBytes(), StandardOpenOption.CREATE);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		addProduct.setBookImage(product.getId() +imageSource.getOriginalFilename());
		boolean bl = productService.addProduct(addProduct);
		if(bl) {
			redirectAttributes.addFlashAttribute("addProductSuccess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/product/view-product";
		}else {
			redirectAttributes.addFlashAttribute("addProductFail",Constant.ADD_PRODUCT_FAIL);
			return "redirect:/admin/product/view-add-product";
		}
		
	}
	
	
	@GetMapping(value = { "/view-update-product/{product_id}" })
	public String viewUpdateProductAdmin(Model model,@PathVariable("product_id") Long product_id ) {
		model.addAttribute("product", productService.getProductByID(product_id));
		model.addAttribute("authors", authorService.getAuthors());
		model.addAttribute("categories", categoryService.getCategory());
		model.addAttribute("activePage", "product");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/product/update-product";
	}
	

	/**
	 * Update Product
	 * 
	 */
	@PostMapping(value = { "/update-product" })
	public String updateProductAdmin(Model model, @ModelAttribute("product") Product product, BindingResult result,
			HttpServletRequest request, @RequestParam("imageSource") MultipartFile imageSource,
			@RequestParam("author") Long author_id, @RequestParam("category") Long category_id,
			RedirectAttributes redirectAttributes) {

		Product updateProduct = productService.getProductByID(product.getId());
		updateProduct.setBookName(product.getBookName());
		updateProduct.setAuthor(authorService.getAuthorById(author_id));
		updateProduct.setCategory(categoryService.getCategoryById(category_id));
		updateProduct.setQuantity(product.getQuantity());
		updateProduct.setPrice(product.getPrice());
		updateProduct.setPages(product.getPages());
		updateProduct.setLanguage(product.getLanguage());
		updateProduct.setPublicationDate(product.getPublicationDate());
		updateProduct.setPublisher(product.getPublisher());
		updateProduct.setCreateDate(new Date());

		String path = request.getServletContext().getRealPath("/resource/images/books/");
		File f = new File(path);
		File destination = new File(f.getAbsolutePath() + "/" +product.getId() + imageSource.getOriginalFilename());
		if (!destination.exists()) {
			try {
				Files.write(destination.toPath(), imageSource.getBytes(), StandardOpenOption.CREATE);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(imageSource.getOriginalFilename()==null || imageSource.getOriginalFilename()=="") {
			updateProduct.setBookImage(updateProduct.getBookImage());
		}else {
			updateProduct.setBookImage(product.getId() +imageSource.getOriginalFilename());
		}
		boolean bl = productService.updateProduct(updateProduct);
		if(bl) {
			redirectAttributes.addFlashAttribute("updateProductSuccess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/product/view-product";
		}else {
			redirectAttributes.addFlashAttribute("updateProductFail",Constant.UPDATE_PRODUCT_FAIL);
			return "redirect:/admin/product/view-update-product";
		}
	}
	
	@GetMapping(value = { "/delete-product/{id}" })
	public String deleteProductAdmin(Model model,@PathVariable("id") Long product_id ,final HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		boolean bl = productService.deleteProduct(product_id);
		if(bl) {
			redirectAttributes.addFlashAttribute("deleteSuccess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:"+request.getHeader("Referer");
		}else {
			return "redirect:"+request.getHeader("Referer");
		}
		
	}
	
	@GetMapping(value = { "/search-product" })
	public String searchProductAdmin(Model model,@RequestParam("bookName") String bookName) {
		if(bookName== "" ) {
			return "redirect:/admin/product/view-product";
		}else {
			List<Product> products = searchService.searchProductByName(bookName);
			model.addAttribute("products", products);
			model.addAttribute("activePage", "product");
			model.addAttribute("countWait", billService.countBillWaitConfirm());
			model.addAttribute("countDelivery", billService.countBillDelivering());
			model.addAttribute("bookName",bookName);
			return "admin/product/view-product";
		}
		
	}
	
	@GetMapping(value = "/report-product")
	public String reportProductAdmin(Model model){
		model.addAttribute("listProduct", productService.reportProduct());
		return "admin/product/report-product";
	}
	
}
