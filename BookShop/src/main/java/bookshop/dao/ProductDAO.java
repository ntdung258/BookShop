package bookshop.dao;
import java.util.List;
import bookshop.entity.Product;

public interface ProductDAO {
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
	
	Long countProduct();
	
}

