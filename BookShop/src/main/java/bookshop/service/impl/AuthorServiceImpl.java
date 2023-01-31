package bookshop.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bookshop.dao.AuthorDAO;
import bookshop.entity.Author;
import bookshop.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService{
	@Autowired
	private AuthorDAO authorDAO;

	@Override
	public List<Author> getAuthors() {
		return authorDAO.getAuthors();
	}

	@Override
	public Author getAuthorById(Long id) {
		return authorDAO.getAuthorById(id);
	}

	@Override
	public boolean addAuthor(Author author) {
		return authorDAO.addAuthor(author);
	}

	@Override
	public boolean editAuthor(Author author) {
		return authorDAO.editAuthor(author);
	}

	@Override
	public boolean deletAuthor(Long id) {
		return authorDAO.deletAuthor(id);
	}

	@Override
	public Long countAuthor() {
		return authorDAO.countAuthor();
	}

	@Override
	public Author checkAuthor(String authorName) {
		return authorDAO.checkAuthor(authorName);
	}

	@Override
	public List<Map<String, Object>> reportAuthor() {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Author author : authorDAO.getAuthors()) {
			Map<String, Object> item = new HashMap<String, Object>();
			item.put("id", author.getId());
			item.put("authorName", author.getAuthorName());
			result.add(item);
			}
		return result;
	}
	
	
}
