package bookshop.dao;

import java.util.List;

import bookshop.entity.Category;

public interface CategoryDAO {
	List<Category> getCategory();
	Category getCategoryById(Long id);
	boolean addCategory(Category category);
	boolean editCategory(Category category);
	boolean deleteCategory(Long id);
	Long countCategory();
	Category checkCategory(String categoryName);
}
