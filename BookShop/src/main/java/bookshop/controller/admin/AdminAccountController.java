package bookshop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bookshop.constant.Constant;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.SearchService;
import bookshop.service.UserService;

@Controller
@RequestMapping("/admin/account")
public class AdminAccountController {
	@Autowired
	private UserService userService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private BillService billService;

	@GetMapping("/view-account")
	public String viewAccountAdmin(Model model) {
		List<User> listUser = userService.getUsers();
		model.addAttribute("listUser", listUser);
		model.addAttribute("activePage", "account");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/account/view-account";
	}

	@GetMapping("/view-update-account/{id}")
	public String viewUpdateAccountAdmin(Model model, @PathVariable("id") Long user_id) {
		model.addAttribute("user", userService.getUserById(user_id));
		model.addAttribute("activePage", "account");
		model.addAttribute("activePage", "account");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/account/update-account";
	}

	@PostMapping(value = { "/update-account" })
	public String updateAccountAdmin(Model model, @ModelAttribute("user") User user,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		User updateUser = userService.getUserById(user.getId());
		if(updateUser.getUserRole() .equals("ROLE_ADMIN")) {
			redirectAttributes.addFlashAttribute("updateAccountFail","You can't edit Admin");			
			return "redirect:"+request.getHeader("Referer");
		}else {
			updateUser.setStatus(user.isStatus());
			updateUser.setUserRole(user.getUserRole());
			userService.editUser(updateUser);
			redirectAttributes.addFlashAttribute("success",Constant.SWEET_ALERT_SUCCESS);		
			return "redirect:/admin/account/view-account";
		}
		
	}

	@GetMapping(value = { "/search-account" })
	public String searchAccountAdmin(Model model, @RequestParam("key") String key) {
		List<User> listUser = searchService.searchUserByEmailOrName(key);
		model.addAttribute("listUser", listUser);
		model.addAttribute("activePage", "account");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("key", key);
		return "admin/account/view-account";
	}

}
