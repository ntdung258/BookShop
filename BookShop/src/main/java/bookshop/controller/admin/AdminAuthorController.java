package bookshop.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import bookshop.constant.Constant;
import bookshop.entity.Author;
import bookshop.service.AuthorService;
import bookshop.service.BillService;
import bookshop.service.SearchService;

@Controller
@RequestMapping("/admin/author")
public class AdminAuthorController {

	@Autowired
	private AuthorService authorService;
	@Autowired
	private BillService billService;
	@Autowired
	private SearchService searchService;

	@GetMapping(value = { "/view-author" })
	public String viewAuthorAdmin(Model model) {
		List<Author> listAuthors = authorService.getAuthors();
		model.addAttribute("listAuthors", listAuthors);
		model.addAttribute("addAuthor", new Author());
		model.addAttribute("activePage", "author");
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		return "admin/author/view-author";
	}

	@PostMapping(value = { "/add-author" })
	public String addAuthorAdmin(Model model, @ModelAttribute("addAuthor") Author author, BindingResult result,
			HttpServletRequest request, @RequestParam("imageSource") MultipartFile imageSource,
			RedirectAttributes redirectAttributes) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
		Author checkAuthor = authorService.checkAuthor(request.getParameter("authorName").trim());
		if (checkAuthor == null) {
			Author addAuthor = new Author();
			addAuthor.setAuthorName(request.getParameter("authorName").trim());
			addAuthor.setCreateDate(new Date());
			String path = request.getServletContext().getRealPath("/resource/images/author/");
			File f = new File(path);

			File destination = new File(
					f.getAbsolutePath() + "/" + sdf.format(new Date()) + imageSource.getOriginalFilename());
			if (!destination.exists()) {
				try {
					Files.write(destination.toPath(), imageSource.getBytes(), StandardOpenOption.CREATE);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			addAuthor.setAuthorImage(sdf.format(new Date()) + imageSource.getOriginalFilename());
			boolean bl = authorService.addAuthor(addAuthor);
			if (bl) {
				redirectAttributes.addFlashAttribute("addAuthorSuccess", Constant.SWEET_ALERT_SUCCESS);
				return "redirect:/admin/author/view-author";
			} else {
				redirectAttributes.addFlashAttribute("addAuthorFail", Constant.ADD_AUTHOR_FAIL);
				return "redirect:/admin/author/view-author";
			}
		} else {
			redirectAttributes.addFlashAttribute("authorAE", "Add new author fail! The author already exists");
			return "redirect:/admin/author/view-author";
		}

	}

	@PostMapping(value = { "/edit-author" })
	public String editAuthorAdmin(Model model, HttpServletRequest request,
			@RequestParam("imageSource") MultipartFile imageSource, RedirectAttributes redirectAttributes) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
		Author checkAuthor = authorService.checkAuthor(request.getParameter("authorName").trim());
		if(checkAuthor == null) {
			Author addAuthor = authorService.getAuthorById(Long.parseLong(request.getParameter("authorId").trim()));
			addAuthor.setAuthorName(request.getParameter("authorName").trim());
			addAuthor.setCreateDate(new Date());
			String path = request.getServletContext().getRealPath("/resource/images/author/");
			File f = new File(path);

			File destination = new File(
					f.getAbsolutePath() + "/" + sdf.format(new Date()) + imageSource.getOriginalFilename());
			if (!destination.exists()) {
				try {
					Files.write(destination.toPath(), imageSource.getBytes(), StandardOpenOption.CREATE);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (imageSource.getOriginalFilename() == null || imageSource.getOriginalFilename() == "") {
				addAuthor.setAuthorImage(request.getParameter("authorImage").trim());
			} else {
				addAuthor.setAuthorImage(sdf.format(new Date()) + imageSource.getOriginalFilename());
			}

			boolean bl = authorService.editAuthor(addAuthor);
			if (bl) {
				redirectAttributes.addFlashAttribute("updateAuthorSuccess", Constant.SWEET_ALERT_SUCCESS);
				return "redirect:/admin/author/view-author";
			} else {
				redirectAttributes.addFlashAttribute("updateAuthorFail", Constant.UPDATE_AUTHOR_FAIL);
				return "redirect:/admin/author/view-author";
			}
		}else if(checkAuthor.getId() == Long.parseLong(request.getParameter("authorId").trim())) {
			redirectAttributes.addFlashAttribute("updateAuthorSuccess", Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/author/view-author";
		}else {
			redirectAttributes.addFlashAttribute("authorAE", "Update author fail! The author already exists");
			return "redirect:/admin/author/view-author";
		}
		
	}

	@GetMapping(value = { "/delete-author/{id}" })
	public String deleteAuthorAdmin(Model model, @PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		boolean bl = authorService.deletAuthor(id);
		if (bl) {
			redirectAttributes.addFlashAttribute("deleteSucess", Constant.SWEET_ALERT_SUCCESS);
			return "redirect:/admin/author/view-author";
		} else {
			redirectAttributes.addFlashAttribute("deleteFail", "Fail");
			return "redirect:/admin/author/view-author";
		}
	}
	
	@GetMapping(value = { "/search-author" })
	public String searchAuthorAdmin(Model model, @RequestParam("key") String key) {
		List<Author> listAuthor = searchService.searchAuthorByName(key);
		model.addAttribute("listAuthors", listAuthor);
		model.addAttribute("countWait", billService.countBillWaitConfirm());
		model.addAttribute("countDelivery", billService.countBillDelivering());
		model.addAttribute("key", key);
		model.addAttribute("activePage", "author");
		return "admin/author/view-author";
	}
	
	@GetMapping(value = "/report-author")
	public String reportAuthorAdmin(Model model){
		model.addAttribute("listAuthor", authorService.reportAuthor());
		return "admin/author/report-author";
	}

}
