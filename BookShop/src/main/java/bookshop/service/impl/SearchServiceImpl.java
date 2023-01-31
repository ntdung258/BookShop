package bookshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookshop.dao.SearchDAO;
import bookshop.entity.Author;
import bookshop.entity.Bill;
import bookshop.entity.Category;
import bookshop.entity.Product;
import bookshop.entity.User;
import bookshop.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDAO searchDAO;

	@Override
	public List<Product> searchProductByNameAndAuthor(String name) {
		return searchDAO.searchProductByNameAndAuthor(name);
	}

	@Override
	public List<Product> searchProductByName(String bookName) {
		return searchDAO.searchProductByName(bookName);
	}

	@Override
	public List<User> searchUserByEmailOrName(String key) {
		return searchDAO.searchUserByEmailOrName(key);
	}

	@Override
	public List<Bill> searchBillByNameOrPhone(String key) {
		return searchDAO.searchBillByNameOrPhone(key);
	}

	@Override
	public List<Author> searchAuthorByName(String key) {
		return searchDAO.searchAuthorByName(key);
	}

	@Override
	public List<Category> searchCategoryName(String key) {
		return searchDAO.searchCategoryName(key);
	}
	
}

