package bookshop.service;
import java.util.List;
import bookshop.entity.Cart;

public interface CartService {
	void addCart(Cart cart);
	List<Cart> getCartByUser(Long id);
	Cart getCartByProductAndUser(Long product_id,Long user_id);
	void updateCart(Cart cart);
	void deleteItem(Long product_id,Long user_id);
	void deleteCart(Long id);
	Long totalQuantity(Long id);
	Double totalPrice(Long id);
}
