package bookshop.dao.impl;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookshop.dao.ProductDAO;
import bookshop.entity.Product;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Product> loadProduct() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Product ORDER BY createDate DESC").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Product getProductByID(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Product product =  (Product) session.createQuery("FROM Product WHERE id = :Id")
					.setParameter("Id", id)
					.uniqueResult();
			return product;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Product> loadProductByIDCategory(Long id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Product WHERE category_id =: categoryID ORDER BY createDate DESC")
					.setParameter("categoryID", id)
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
	public List<Product> loadTop10NewUpDate() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("FROM Product p ORDER BY createDate DESC");
			q.setMaxResults(10);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Product> loadProductByPage(int page) {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("FROM Product ORDER BY createDate DESC");
			
			int max =8;
			q.setMaxResults(max);
			q.setFirstResult((page-1)*max);
			
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Long countProduct() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT COUNT(*) FROM Product");
			
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Product> loadProductByAuthor(Long id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Product WHERE author_id =: authorID ORDER BY createDate DESC")
					.setParameter("authorID", id)
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
	public boolean addProduct(Product product) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(product);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
		
	}

	@Override
	public boolean updateProduct(Product product) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(product);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteProduct(Long id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getProductByID(id));
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Object[]> getTotalQuantityByCategory() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT SUM(p.quantity),c.id,c.categoryName "
					+ "FROM Product p JOIN p.category c "
					+ "GROUP BY category_id,c.id,c.categoryName")
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> getTotalQuantityByAuthor() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT SUM(p.quantity),a.id,a.authorName "
					+ "FROM Product p JOIN p.author a "
					+ "GROUP BY author_id,a.id,a.authorName")
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}


