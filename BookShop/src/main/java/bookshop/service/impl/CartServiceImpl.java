package bookshop.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bookshop.dao.CartDAO;
import bookshop.entity.Cart;
import bookshop.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;

	@Override
	public void addCart(Cart cart) {
		cartDAO.addCart(cart);
	}

	@Override
	public List<Cart> getCartByUser(Long id) {		
		return cartDAO.getCartByUser(id);
	}

	@Override
	public Cart getCartByProductAndUser(Long product_id, Long user_id) {
		return cartDAO.getCartByProductAndUser(product_id, user_id);
	}

	@Override
	public void updateCart(Cart cart) {
		cartDAO.updateCart(cart);
	}

	
	@Override
	public void deleteItem(Long product_id, Long user_id) {
		cartDAO.deleteItem(product_id, user_id);
	}


	@Override
	public void deleteCart(Long id) {
		cartDAO.deleteCart(id);
	}

	@Override
	public Long totalQuantity(Long id) {
		return  cartDAO.totalQuantity(id);
	}

	@Override
	public Double totalPrice(Long id) {
		return cartDAO.totalPrice(id);
	}

}

