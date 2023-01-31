package bookshop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookshop.dao.CategoryDAO;
import bookshop.entity.Category;
import bookshop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	public List<Category> getCategory() {
		return categoryDAO.getCategory();
	}

	@Override
	public Category getCategoryById(Long id) {
		return categoryDAO.getCategoryById(id);
	}

	@Override
	public boolean addCategory(Category category) {
		return categoryDAO.addCategory(category);
	}

	@Override
	public boolean editCategory(Category category) {
		return categoryDAO.editCategory(category);
	}

	@Override
	public boolean deleteCategory(Long id) {
		return categoryDAO.deleteCategory(id);
	}

	@Override
	public List<Map<String, Object>> reportCategory() {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Category cate : categoryDAO.getCategory()) {
			Map<String, Object> item = new HashMap<String, Object>();
			item.put("id", cate.getId());
			item.put("categoryName", cate.getCategoryName());
			result.add(item);
			}
		return result;
	}

	@Override
	public Long countCategory() {
		return categoryDAO.countCategory();
	}

	@Override
	public Category checkCategory(String categoryName) {
		return categoryDAO.checkCategory(categoryName);
	}
		
}

