package bookshop.service;

import java.util.List;
import java.util.Map;

import bookshop.entity.Category;

public interface CategoryService {
	List<Category> getCategory();
	Category getCategoryById(Long id);
	boolean addCategory(Category category);
	boolean editCategory(Category category);
	boolean deleteCategory(Long id);
	
	
	public List<Map<String, Object>> reportCategory();
	Long countCategory();
	Category checkCategory(String categoryName);
}
