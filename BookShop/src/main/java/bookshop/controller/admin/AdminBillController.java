package bookshop.controller.admin;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import bookshop.constant.Constant;
import bookshop.entity.Bill;
import bookshop.entity.BillDetail;
import bookshop.entity.Product;
import bookshop.service.BillService;
import bookshop.service.ProductService;
import bookshop.service.SearchService;
import bookshop.service.UserService;


@Controller
@RequestMapping("/admin/bill")
public class AdminBillController {
	@Autowired
	private BillService billService;
	@Autowired
	private ProductService productService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private UserService userService;
	@Autowired
	private SearchService searchService;
	
	
	@GetMapping(value = { "/view-bill" })
	public String viewAdminBill(Model model) {
		model.addAttribute("bills", billService.getBill());
		model.addAttribute("activePage", "bill");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/bill/view-bill";
	}
	
	@GetMapping(value = { "/view-detail-bill/{id}"})
	public String viewAdminDetailBill(Model model,@PathVariable("id") Long bill_id) {
		model.addAttribute("bill", billService.getBillById(bill_id));
		model.addAttribute("billDetail", billService.getBillDetailByBillId(bill_id));
		model.addAttribute("activePage", "bill");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/bill/view-detail-bill";
	}
	
	@GetMapping(value = { "/update-status-bill/{id}"})
	public String updateAdminStatusBill(Model model,@PathVariable("id") Long bill_id,RedirectAttributes redirectAttributes) {
		Bill bill = billService.getBillById(bill_id);
		if(bill.getStatus().equals("Wait confirmation")) {
			bill.setStatus("Delivering");
			List<BillDetail> lstBD = billService.getBillDetailByBillId(bill_id);
			Bill infoBill = billService.getBillById(bill_id);
			NumberFormat formatter = NumberFormat.getCurrencyInstance();
			//Gửi email xác nhận thông tin đơn hàng
			String text = "<div class='text-center'>\r\n"
					+ "<h2>Information Order</h2>\r\n"
					+ "<h3>Recipient: "+infoBill.getRecipientName()+"</h3>\r\n"
					+ "<h3>Addresss: "+infoBill.getDeliveryAddress()+"</h3>\r\n"
					+ "<h3>Phone: "+infoBill.getPhone()+"</h3>\r\n"
					+ "<h3>Note: "+infoBill.getNote()+"</h3>\r\n"
					+ "<table border='1px'>\r\n"
					+ "  <tr>\r\n"
					+ "    <th>Product Name</th>\r\n"
					+ "    <th>Price</th>\r\n"
					+ "    <th>Quantity</th>\r\n"
					+ "    <th>Total Price</th>\r\n"
					+ "  </tr>";
			
			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");
				for (BillDetail billDetail : lstBD) {
					
				
					text += "<tr>\r\n"
							+ "    <td>"+ billDetail.getBookName() + "</td>\r\n"
							+ "    <td>"+ formatter.format(billDetail.getPrice())+"</td>\r\n"
							+ "    <td>"+ billDetail.getQuantity()+"</td>\r\n"
							+ "    <td>"+ formatter.format(billDetail.getPrice()*billDetail.getQuantity())+"</td>\r\n"
							+ "  </tr>";
				}
				text += "</table>\r\n"
						+ "\r\n"
						+ "<h3>Shipping: "+formatter.format(30000)+"</h3>\r\n"
						+ "<h3>Total: "+formatter.format(infoBill.getTotalPrice()) +"</h3>\r\n"
						+ "</div>";
				message.setContent(text, "text/html;charset=UTF-8");
				helper.setTo(userService.getUserById(infoBill.getUser().getId()).getEmail());
				helper.setSubject("Xác nhận đơn hàng");
				mailSender.send(message);
			} catch (MessagingException e) {
				bill.setStatus("Delivering");
			} 	
			
		}else if(bill.getStatus().equals("Delivering")) {
			bill.setStatus("Order completed");
		}
		boolean bl = billService.setChangeStatusOrder(bill);
		if(bl) {
			redirectAttributes.addFlashAttribute("updateStatusBillSuccess",Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/bill/view-bill";
		}else {
			redirectAttributes.addFlashAttribute("updateStatusBillFail",Constant.UPDATE_STATUS_BILL_FAIL);
			return "redirect:/admin/bill/view-bill";
		}
		
	}
	
	@PostMapping(value = { "/cancel-bill"})
	public String cancelAdminBill(Model model,@RequestParam("id") Long bill_id,
			@RequestParam("reasonCancel") String reasonCancel,RedirectAttributes redirectAttributes) {
		Bill bill = billService.getBillById(bill_id);
		if(bill.getStatus().equals("Wait confirmation") || bill.getStatus().equals("Delivering")) {
			bill.setStatus("Order canceled");
			bill.setReasonCancel(reasonCancel);
			bill.setCancelDate(new Date());
		}else {
			model.addAttribute("errCancel", "You cannot cancel your order");
		}
		boolean bl = billService.setChangeStatusOrder(bill);
		if(bl) {
			redirectAttributes.addFlashAttribute("updateStatusBillSuccess",Constant.SWEET_ALERT_SUCCESS);
			
			//hoàn lại số lượng vào kho
			List<BillDetail> listBillDetails = billService.getBillDetailByIdBill(bill_id);
			for (BillDetail billDetail : listBillDetails) {
				Product  product = productService.getProductByID(billDetail.getBookId());
				product.setQuantity(product.getQuantity()+billDetail.getQuantity());
				productService.updateProduct(product);
			}
			return "redirect:/admin/bill/view-bill";
		}else {
			redirectAttributes.addFlashAttribute("updateStatusBillFail",Constant.UPDATE_STATUS_BILL_FAIL);
			return "redirect:/admin/bill/view-bill";
		}
		
	}
	
	@GetMapping(value = { "/view-bill-wait-confirm" })
	public String viewAdminBillWaitConfirm(Model model) {
		List<Bill> bills = billService.getBillWaitConfirm();
		if(bills.size()==0) {
			model.addAttribute("noBillDataWait",Constant.NO_BILL_DATA_WAIT );
		}else {
			model.addAttribute("bills", bills);
		}
		model.addAttribute("activePage", "bill");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/bill/view-bill";
	}
	
	@GetMapping(value = { "/view-bill-delivering" })
	public String viewAdminBillDelivering(Model model) {
		List<Bill> bills = billService.getBillDelivering();
		if(bills.size()==0) {
			model.addAttribute("noBillDataDelivery",Constant.NO_BILL_DATA_DELIVERY );
		}else {
			model.addAttribute("bills", bills);
		}
		model.addAttribute("activePage", "bill");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/bill/view-bill";
	}
	
	@GetMapping(value = { "/view-bill-success" })
	public String viewAdminBillSuccess(Model model) {
		List<Bill> bills = billService.getBillCompleted();
		if(bills.size()==0) {
			model.addAttribute("noBillDataDelivery",Constant.NO_BILL_DATA_DELIVERY );
		}else {
			model.addAttribute("bills", bills);
		}
		model.addAttribute("activePage", "bill");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/bill/view-bill";
	}
	
	@GetMapping(value = "/report-bill/{id}")
	public String reportBillAdmin(Model model,@PathVariable("id") Long bill_id){
		model.addAttribute("listBill", billService.reportBill(bill_id));
		return "admin/bill/report-bill";
	}
	
	@GetMapping(value = { "/search-bill" })
	public String searchBillAdmin(Model model, @RequestParam("key") String key) {
		List<Bill> listBill = searchService.searchBillByNameOrPhone(key);
		model.addAttribute("activePage", "bill");
		model.addAttribute("bills", listBill);
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("key", key);
		return "admin/bill/view-bill";
	}
	
}
