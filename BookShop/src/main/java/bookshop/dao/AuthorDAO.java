package bookshop.dao;
import java.util.List;
import bookshop.entity.Author;


public interface AuthorDAO {
	List<Author> getAuthors();
	Author getAuthorById(Long id);
	boolean addAuthor(Author author);
	boolean editAuthor(Author author);
	boolean deletAuthor(Long id);
	Long countAuthor();
	Author checkAuthor(String authorName);
}
