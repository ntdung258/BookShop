package bookshop.dao.impl;
import java.util.List;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookshop.dao.CartDAO;
import bookshop.entity.Cart;

@Repository
@Transactional
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public void addCart(Cart cart) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(cart);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}

	}

	

	@Override
	public List<Cart> getCartByUser(Long id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Cart WHERE userId = :ID")
					.setParameter("ID", id)
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;

	}

	@Override
	public Cart getCartByProductAndUser(Long product_id, Long user_id) {
		Session session = sessionFactory.openSession();
		try {
			Cart cart =  (Cart) session.createQuery("FROM Cart WHERE bookId = :ID_PRODUCT AND userId =:ID_USER")
					.setParameter("ID_PRODUCT", product_id)
					.setParameter("ID_USER", user_id)
					.uniqueResult();
			return cart;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;

	}

	@Override
	public void updateCart(Cart cart) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(cart);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}

	}



	@Override
	public void deleteItem(Long product_id,Long user_id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCartByProductAndUser(product_id, user_id));
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
	}


	@Override
	public void deleteCart(Long id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("DELETE FROM Cart WHERE userId =:ID").setParameter("ID", id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
	}



	@Override
	public Long totalQuantity(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Long totalQuantity =  (Long) session.createQuery("SELECT SUM(c.quantity) FROM Cart c WHERE c.userId =:ID_USER")
					.setParameter("ID_USER", id)
					.uniqueResult();
			return totalQuantity;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}



	@Override
	public Double totalPrice(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Double totalQuantity =  (Double) session.createQuery("SELECT SUM(c.quantity * c.price) FROM Cart c WHERE c.userId =:ID_USER")
					.setParameter("ID_USER", id)
					.uniqueResult();
			return totalQuantity;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
}
