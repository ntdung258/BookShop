package bookshop.dao.impl;

import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookshop.dao.CategoryDAO;
import bookshop.entity.Category;


@Repository
public class CategoryDAOImpl implements CategoryDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> getCategory() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Category ").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Category getCategoryById(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Category category =  (Category) session.createQuery("FROM Category WHERE id = :Id")
					.setParameter("Id", id)
					.uniqueResult();
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean addCategory(Category category) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(category);
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
	public boolean editCategory(Category category) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(category);
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
	public boolean deleteCategory(Long id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCategoryById(id));
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
	public Long countCategory() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT COUNT(*) FROM Category");
			
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Category checkCategory(String categoryName) {
		Session session = sessionFactory.openSession();
		try {
			Category category = (Category) session.createQuery("FROM Category WHERE categoryName = :categoryName")
					.setParameter("categoryName", categoryName)
					.uniqueResult();
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	
	
}
