package bookshop.dao;

import java.util.List;

import bookshop.entity.Author;
import bookshop.entity.Bill;
import bookshop.entity.Category;
import bookshop.entity.Product;
import bookshop.entity.User;
public interface SearchDAO {
	List<Product> searchProductByNameAndAuthor(String name);
	List<Product> searchProductByName(String bookName);
	List<User> searchUserByEmailOrName(String key);
	List<Bill> searchBillByNameOrPhone(String key);
	List<Author> searchAuthorByName(String key);
	List<Category> searchCategoryName(String key);
}
