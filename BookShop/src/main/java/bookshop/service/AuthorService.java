package bookshop.service;

import java.util.List;
import java.util.Map;

import bookshop.entity.Author;

public interface AuthorService {
	List<Author> getAuthors();
	Author getAuthorById(Long id);
	boolean addAuthor(Author author);
	boolean editAuthor(Author author);
	boolean deletAuthor(Long id);
	Long countAuthor();
	Author checkAuthor(String authorName);
	public List<Map<String, Object>> reportAuthor();
}
