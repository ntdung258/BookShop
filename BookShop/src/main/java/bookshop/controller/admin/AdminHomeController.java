package bookshop.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import bookshop.entity.CustomUserDetails;
import bookshop.entity.User;
import bookshop.service.AuthorService;
import bookshop.service.BillService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;
import bookshop.service.UserService;

@Controller
@RequestMapping("/admin/home")
public class AdminHomeController {
	@Autowired
	private BillService billService;
	@Autowired
	UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private AuthorService authorService;
	@Autowired
	private CategoryService categoryService;

	@InitBinder
	public void initBinder(WebDataBinder data) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		data.registerCustomEditor(Date.class, new CustomDateEditor(sf, false));
	}

	@GetMapping(value = { "/view-home" })
	public String viewAdminHome(Model model, HttpSession session) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		User userLogin = userService.checkEmail(user.getEmail());
		session.setAttribute("userLogin", userLogin);
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("activePage", "chart-category");
		
		model.addAttribute("countUser", userService.countUser());
		model.addAttribute("countProduct", productService.countProduct());
		model.addAttribute("countAuthor", authorService.countAuthor());
		model.addAttribute("countCategory", categoryService.countCategory());
		
		List<Object[]> listObCate = productService.getTotalQuantityByCategory();
		model.addAttribute("listObCate", listObCate);
		
		List<Object[]> listObAuthor = productService.getTotalQuantityByAuthor();
		model.addAttribute("listObAuthor", listObAuthor);
		return "admin/index";
	}

	// Chart quantity by category
	@GetMapping(value = { "/view-chart-category" })
	public String viewChartByCategory(Model model) {
		List<Object[]> listOb = billService.quantityBookSellByCategory();
		model.addAttribute("listOb", listOb);
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "category");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/statistical/category";
	}

	@GetMapping(value = { "/view-chart-category-by-date" })
	public String viewChartQuantityByCategoryAndDate(Model model, @RequestParam("startDate") Date startDate,
			@RequestParam("endDate") Date endDate) {
		List<Object[]> listObByDate = billService.quantityBookSellByCategoryAndDate(startDate, endDate);
		if(listObByDate.size()==0) {
			model.addAttribute("noData"," No Data");
		}else {
			model.addAttribute("listOb", listObByDate);
		}
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "category");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "admin/statistical/category";
	}

	// Chart quantity by author
	@GetMapping(value = { "/view-chart-author" })
	public String viewChartByAuthor(Model model) {
		List<Object[]> listOb = billService.quantityBookSellByAuthor();
		model.addAttribute("activeSubPage", "author");
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("listOb", listOb);
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/statistical/author";
	}

	@GetMapping(value = { "/view-chart-author-by-date" })
	public String viewChartQuantityByAuthorAndDate(Model model, @RequestParam("startDate") Date startDate,
			@RequestParam("endDate") Date endDate) {
		List<Object[]> listObByDate = billService.quantityBookSellByAuthorAndDate(startDate, endDate);
		if(listObByDate.size()==0) {
			model.addAttribute("noData"," No Data");
		}else {
			model.addAttribute("listOb", listObByDate);
		}
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "author");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return "admin/statistical/author";
	}

	// Chart total price by Day
	@GetMapping(value = { "/view-chart-revenue-by-day" })
	public String viewChartRevenueByDay(Model model) {
		List<Object[]> listOb = billService.totalPriceByDay();
		model.addAttribute("listOb", listOb);
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "revenue-by-day");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/statistical/revenue-by-day";
	}

	@GetMapping(value = { "/view-chart-revenue-by-day-and-date" })
	public String viewChartRevenueByDayAndDate(Model model, @RequestParam("startDate") Date startDate,
			@RequestParam("endDate") Date endDate) {
		List<Object[]> listOb = billService.totalPriceByDayAndDate(startDate, endDate);
		if(listOb.size()==0) {
			model.addAttribute("noData"," No Data");
		}else {
			model.addAttribute("listOb", listOb);
		}
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "revenue-by-day");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return "admin/statistical/revenue-by-day";
	}

	// Chart total price by Month
	@GetMapping(value = { "/view-chart-revenue-by-month" })
	public String viewChartRevenueByMonth(Model model) {
		List<Object[]> listOb = billService.totalPriceByMonth();
		model.addAttribute("listOb", listOb);
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "revenue-by-month");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/statistical/revenue-by-month";
	}

	@GetMapping(value = { "/view-chart-revenue-by-month-and-date" })
	public String viewChartRevenueByMonthAndDate(Model model, @RequestParam("startDate") Date startDate,
			@RequestParam("endDate") Date endDate) {
		List<Object[]> listOb = billService.totalPriceByMonthAndDate(startDate, endDate);
		if(listOb.size()==0) {
			model.addAttribute("noData"," No Data");
		}else {
			model.addAttribute("listOb", listOb);
		}
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "revenue-by-month");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return "admin/statistical/revenue-by-month";
	}

	// Chart total price by Year
	@GetMapping(value = { "/view-chart-revenue-by-year" })
	public String viewChartRevenueByYear(Model model) {
		List<Object[]> listOb = billService.totalPriceByYear();
		model.addAttribute("listOb", listOb);
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "revenue-by-year");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/statistical/revenue-by-year";
	}

	@GetMapping(value = { "/view-chart-revenue-by-year-and-date" })
	public String viewChartRevenueByYearAndDate(Model model, @RequestParam("startDate") Date startDate,
			@RequestParam("endDate") Date endDate) {
		List<Object[]> listOb = billService.totalPriceByYearAndDate(startDate, endDate);
		if(listOb.size()==0) {
			model.addAttribute("noData"," No Data");
		}else {
			model.addAttribute("listOb", listOb);
		}
		model.addAttribute("activePage", "chart-category");
		model.addAttribute("activeSubPage", "revenue-by-year");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return "admin/statistical/revenue-by-year";
	}

}
