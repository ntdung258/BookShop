package bookshop.service;
import java.util.List;
import java.util.Map;

import bookshop.entity.Product;

public interface ProductService {
	List<Product> loadProduct();
	Product getProductByID(Long id);
	List<Product> loadProductByIDCategory(Long id);
	List<Product> loadTop10NewUpDate();
	List<Product> loadProductByPage(int page);
	
	List<Product> loadProductByAuthor(Long id);
	boolean addProduct(Product product);
	boolean updateProduct(Product product);
	boolean deleteProduct(Long id);
	
	List<Object[]> getTotalQuantityByCategory();
	List<Object[]> getTotalQuantityByAuthor();
	
	public List<Map<String, Object>> reportProduct();
	
	Long countProduct();
}
