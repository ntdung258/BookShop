package bookshop.controller.admin;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import bookshop.constant.Constant;
import bookshop.entity.Category;
import bookshop.service.BillService;
import bookshop.service.CategoryService;
import bookshop.service.SearchService;



@Controller
@RequestMapping("/admin/category")
public class AdminCategoryController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BillService billService;
	@Autowired
	private SearchService searchService;
	
	@GetMapping(value = { "/view-category" })
	public String viewCategoryAdmin(Model model) {
		List<Category> listCategorys = categoryService.getCategory();
		model.addAttribute("listCategorys",listCategorys);
		model.addAttribute("activePage", "category");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/category/view-category";
	}
	
	
	@PostMapping(value = { "/add-category" })
	public String addCategoryAdmin(Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) {
		Category checkCategory = categoryService.checkCategory(request.getParameter("categoryName").trim());
		if(checkCategory== null) {
			Category addCategory = new Category();
			addCategory.setCategoryName(request.getParameter("categoryName").trim());
			addCategory.setCreateDate(new Date());
			boolean bl = categoryService.addCategory(addCategory);
			if(bl) {
				redirectAttributes.addFlashAttribute("addCategorySuccess",Constant.SWEET_ALERT_SUCCESS);
				return "redirect:/admin/category/view-category";
			}else {
				redirectAttributes.addFlashAttribute("addCategoryFail",Constant.ADD_CATEGORY_FAIL);
				return "redirect:/admin/category/view-category";
			}
		}else {
			redirectAttributes.addFlashAttribute("categoryAE","Add new category fail! The category already exists");
			return "redirect:/admin/category/view-category";
		}		
	}
	
	@PostMapping(value = { "/edit-category" })
	public String editCategoryAdmin(Model model,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		
		Category checkCategory = categoryService.checkCategory(request.getParameter("editCategoryName").trim());
		Category editCategory = categoryService.getCategoryById(Long.parseLong(request.getParameter("categoryId").trim()));
		if(checkCategory == null) {
			editCategory.setCategoryName(request.getParameter("editCategoryName").trim());
			editCategory.setCreateDate(new Date());
			boolean bl = categoryService.editCategory(editCategory);
			if(bl) {
				redirectAttributes.addFlashAttribute("updateCategorySuccess",Constant.SWEET_ALERT_SUCCESS);
				return "redirect:/admin/category/view-category";
			}else {
				redirectAttributes.addFlashAttribute("updateCategoryFail",Constant.UPDATE_CATEGORY_FAIL);
				return "redirect:/admin/category/view-category";
			}
		}else if(checkCategory.getId() == Long.parseLong(request.getParameter("categoryId").trim())){
			redirectAttributes.addFlashAttribute("updateCategorySuccess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/category/view-category";
		}else {
			redirectAttributes.addFlashAttribute("categoryAE","Update category fail! The category already exists");
			return "redirect:/admin/category/view-category";
		}
		
	}
	
	@GetMapping(value = { "/delete-category/{id}" })
	public String deleteCategoryAdmin(Model model,@PathVariable("id") Long id ,RedirectAttributes redirectAttributes) {
		boolean bl = categoryService.deleteCategory(id);
		if(bl) {
			redirectAttributes.addFlashAttribute("deleteSucess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/category/view-category";
		}else {
			redirectAttributes.addFlashAttribute("deleteFail","Fail");
			return "redirect:/admin/category/view-category";
		}
	}
	
	@GetMapping(value = "/report-category")
	public String reportCategoryAdmin(Model model){
		model.addAttribute("listCategory", categoryService.reportCategory());
		return "admin/category/report-category";
	}
	
	@GetMapping(value = { "/search-category" })
	public String searchCategoryAdmin(Model model, @RequestParam("key") String key) {
		List<Category> listCategories = searchService.searchCategoryName(key);
		model.addAttribute("listCategorys", listCategories);
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("key", key);
		model.addAttribute("activePage", "category");
		return "admin/category/view-category";
	}
	
}
