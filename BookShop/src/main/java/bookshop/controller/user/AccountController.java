package bookshop.controller.user;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
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
import bookshop.entity.Bill;
import bookshop.entity.BillDetail;
import bookshop.entity.CustomUserDetails;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.BillService;
import bookshop.service.CartService;
import bookshop.service.CategoryService;
import bookshop.service.ProductService;
import bookshop.service.UserService;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	UserService userService;
	@Autowired
	BillService billService;
	@Autowired
	CartService cartService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;

	@InitBinder
	public void initBinder(WebDataBinder data) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		data.registerCustomEditor(Date.class, new CustomDateEditor(sf, false));
	}

	// Display view register
	@GetMapping("/view-register")
	public String viewRegister(Model model) {
		model.addAttribute("listCategory", categoryService.getCategory());
		model.addAttribute("user", new User());
		return "user/register";
	}

	// Register user
	@PostMapping("/register")
	public String Register(Model model, @ModelAttribute("user") User user) {
		if (userService.checkEmail(user.getEmail()) != null) {
			model.addAttribute("errorEmail", Constant.ERROR_EMAIL);
			return "user/register";
		} else {
			User u = new User();
			u.setEmail(user.getEmail());
			u.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
			u.setGender(user.getGender());
			u.setBirthday(new Date(user.getBirthday().getTime()));
			u.setFullname(user.getFullname());
			u.setPhone(user.getPhone());
			u.setAddress(user.getAddress());
			u.setUserImage(null);
			u.setStatus(true);
			u.setUserRole("ROLE_USER");
			boolean bl = userService.register(u);
			if (bl) {
				model.addAttribute("succsessRegister", Constant.SUCCESS_REGISTER);
				return "user/register";
			} else {
				model.addAttribute("errorRegister", Constant.ERROR_REGISTER);
				model.addAttribute("user", user);
				return "user/register";
			}
		}
	}

	// Display view login
	@GetMapping("/view-login")
	public String viewLogin(Model model, @RequestParam(value = "error", required = false) String error) {
		model.addAttribute("user", new User());
		if (error != null) {
			model.addAttribute("errorLogin", Constant.ERROR_LOGIN);
		}
		return "user/login";
	}

	// Login
	@PostMapping("/login")
	public String login(Model model, @ModelAttribute("user") User user, HttpSession session) {
		User userLogin = userService.checkEmail(user.getEmail());
		if (userLogin == null) {
			model.addAttribute("errorLogin", Constant.ERROR_LOGIN);
			return "user/login";
		} else {
			if (userLogin.isStatus() == false) {
				model.addAttribute("lockedAccount", Constant.lOCKED_ACCOUNT);
				return "user/login";
			} else if (BCrypt.checkpw(user.getPassword(), userLogin.getPassword()) && userLogin.isStatus() == true) {
				session.setAttribute("userLogin", userLogin);
				return "redirect:/home";
			} else {
				model.addAttribute("errorLogin", Constant.ERROR_LOGIN);
				return "user/login";
			}
		}

	}

	/*
	 * // Logout
	 * 
	 * @GetMapping("/logout") public String logout(final HttpServletRequest request,
	 * HttpSession session) { session.removeAttribute("userLogin"); return
	 * "redirect:/home"; }
	 */

	// Display view account
	@GetMapping("/view-account")
	public String viewAccount(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		model.addAttribute("user", userLogin);
		model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
		model.addAttribute("listCategory", categoryService.getCategory());
		model.addAttribute("activePage", "view-account");
		return "/user/account/information-account";
	}

	// Display view order-history

	@GetMapping("/view-order-history")
	public String viewOrderHistory(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		List<Bill> listBillByUser = billService.getBillByUser(userLogin.getId());
		if (listBillByUser.size() == 0) {
			model.addAttribute("noDataBill", Constant.NO_DATA_ORDER);
		} else {
			model.addAttribute("listBillByUser", listBillByUser);
		}
		model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
		model.addAttribute("listCategory", categoryService.getCategory());
		model.addAttribute("activePage", "view-order-history");
		return "/user/account/order-history";
	}

	// Display view order-history
	@GetMapping("/view-order-detail-history/{id}")
	public String viewOrderDtailHistory(Model model, HttpSession session, @PathVariable("id") Long bill_id) {
		User userLogin = (User) session.getAttribute("userLogin");
		model.addAttribute("billDetail", billService.getBillDetailByBillId(bill_id));
		model.addAttribute("bill", billService.getBillById(bill_id));
		model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
		model.addAttribute("listCategory", categoryService.getCategory());
		model.addAttribute("activePage", "view-order-history");
		return "/user/account/order-detail-history";

	}

	// Cancel order
	@PostMapping(value = { "/cancel-bill" })
	public String cancelBill(Model model, @RequestParam("id") Long bill_id,
			@RequestParam("reasonCancel") String reasonCancel) {
		Bill bill = billService.getBillById(bill_id);
		if (bill.getStatus().equals("Wait confirmation")) {
			bill.setStatus("Order canceled");
			bill.setReasonCancel(reasonCancel);
			bill.setCancelDate(new Date());
		} else {
			model.addAttribute("errCancel", "You cannot cancel your order");
		}
		billService.setChangeStatusOrder(bill);

		// hoàn lại số lượng vào kho
		List<BillDetail> listBillDetails = billService.getBillDetailByIdBill(bill_id);
		for (BillDetail billDetail : listBillDetails) {
			Product product = productService.getProductByID(billDetail.getBookId());
			product.setQuantity(product.getQuantity() + billDetail.getQuantity());
			productService.updateProduct(product);
		}
		return "redirect:/account/view-order-history";
	}

	// Edit User
	@PostMapping(value = { "/update-account" })
	public String updateUser(Model model, @ModelAttribute("user") User user,HttpSession session,HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		User editUser = userService.getUserById(user.getId());
		editUser.setFullname(user.getFullname());
		editUser.setPhone(user.getPhone());
		editUser.setGender(user.getGender());
		editUser.setBirthday(user.getBirthday());
		editUser.setAddress(user.getAddress());
		boolean bl = userService.editUser(editUser);
		if(bl) {
			session.removeAttribute("userLogin");
			CustomUserDetails userBeforeEdit = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			User userLogin2 = userService.checkEmail(userBeforeEdit.getEmail());
			session.setAttribute("userLogin", userLogin2);
			redirectAttributes.addFlashAttribute("updateAccountSuccess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:"+request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
	}

	// Upload image
	@PostMapping(value = { "/edit-avatar" })
	public String editAvatar(Model model, @ModelAttribute("user") User user, BindingResult result,
			HttpServletRequest request, @RequestParam("imageSource") MultipartFile imageSource,HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		User editUser = userService.getUserById(userLogin.getId());
		String path = request.getServletContext().getRealPath("/resource/images/users/");
		File f = new File(path);
		File destination = new File(f.getAbsolutePath() + "/" + userLogin.getId() + imageSource.getOriginalFilename());
		if (!destination.exists()) {
			try {
				Files.write(destination.toPath(), imageSource.getBytes(), StandardOpenOption.CREATE);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (imageSource.getOriginalFilename() == null || imageSource.getOriginalFilename() == "") {
			editUser.setUserImage(editUser.getUserImage());
		} else {
			editUser.setUserImage(userLogin.getId() + imageSource.getOriginalFilename());
		}

		boolean bl = userService.editUser(editUser);
		if(bl) {
			session.removeAttribute("userLogin");
			CustomUserDetails userBeforeEdit = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			User userLogin2 = userService.checkEmail(userBeforeEdit.getEmail());
			session.setAttribute("userLogin", userLogin2);
			return "redirect:"+request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
		
	}

	@GetMapping(value = { "/check-password/{email}/{password}" })
	public String checkPassword(Model model, @PathVariable("email") String email,
			@PathVariable("password") String password) {
		User userLogin = userService.checkEmail(email);
		if (BCrypt.checkpw(password, userLogin.getPassword())) {
			return "redirect:/account/view-change-password";
		} else {
			return null;
		}
	}

	@GetMapping(value = { "/view-change-password" })
	public String viewChangePassword(Model model, HttpSession session) {
		try {
			User userLogin = (User) session.getAttribute("userLogin");
			model.addAttribute("listCategory", categoryService.getCategory());
			model.addAttribute("totalQuantity", cartService.totalQuantity(userLogin.getId()));
			model.addAttribute("user", new User());
			model.addAttribute("activePage", "view-change-password");
			return "user/account/change-password";
		} catch (Exception e) {
			model.addAttribute("user", new User());
			model.addAttribute("activePage", "view-change-password");
			return "user/account/change-password";
		}

	}

	@PostMapping(value = { "/change-password" })
	public String changePassword(Model model, @ModelAttribute("user") User user, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		User changePassword = userService.checkEmail(userLogin.getEmail());
		changePassword.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		userService.editUser(changePassword);

		return "redirect:/j_spring_security_logout";
	}

}
