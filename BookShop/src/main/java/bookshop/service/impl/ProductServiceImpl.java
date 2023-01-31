package bookshop.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bookshop.dao.ProductDAO;
import bookshop.entity.Product;
import bookshop.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> loadProduct() {	
		return productDAO.loadProduct();
	}

	@Override
	public Product getProductByID(Long id) {
		return productDAO.getProductByID(id);
	}

	@Override
	public List<Product> loadProductByIDCategory(Long id) {
		return productDAO.loadProductByIDCategory(id);
	}

	@Override
	public List<Product> loadTop10NewUpDate() {
		return productDAO.loadTop10NewUpDate();
	}

	@Override
	public List<Product> loadProductByPage(int page) {
		return productDAO.loadProductByPage(page);
	}

	@Override
	public Long countProduct() {
		return productDAO.countProduct();
	}

	@Override
	public List<Product> loadProductByAuthor(Long id) {
		return productDAO.loadProductByAuthor(id);
	}

	@Override
	public boolean addProduct(Product product) {
		return productDAO.addProduct(product);
	}

	@Override
	public boolean updateProduct(Product product) {
		return productDAO.updateProduct(product);
	}

	@Override
	public boolean deleteProduct(Long id) {
		return productDAO.deleteProduct(id);
	}

	@Override
	public List<Object[]> getTotalQuantityByCategory() {
		return productDAO.getTotalQuantityByCategory();
	}

	@Override
	public List<Object[]> getTotalQuantityByAuthor() {
		return productDAO.getTotalQuantityByAuthor();
	}

	@Override
	public List<Map<String, Object>> reportProduct() {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Product p : productDAO.loadProduct()) {
			Map<String, Object> item = new HashMap<String, Object>();
			item.put("id", p.getId());
			item.put("bookName", p.getBookName());
			item.put("price", p.getPrice());
			item.put("quantity", p.getQuantity());
			item.put("category", p.getCategory().getCategoryName());
			result.add(item);
			}
		return result;
	}

}

