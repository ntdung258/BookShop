package bookshop.dao;
import java.util.List;
import bookshop.entity.Cart;

public interface CartDAO {
	void addCart(Cart cart);
	List<Cart> getCartByUser(Long id);
	Cart getCartByProductAndUser(Long product_id,Long user_id);
	void updateCart(Cart cart);
	void deleteItem(Long product_id,Long user_id);
	void deleteCart(Long id);
	Long totalQuantity(Long id);
	Double totalPrice(Long id);
}
