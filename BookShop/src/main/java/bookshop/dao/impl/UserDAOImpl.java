package bookshop.dao.impl;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookshop.dao.UserDAO;
import bookshop.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean register(User user) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(user);
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
	public User checkEmail(String email) {
		Session session = sessionFactory.openSession();
		try {
			User user = (User) session.createQuery("FROM User WHERE email = :email")
					.setParameter("email", email)
					.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<User> getUsers() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM User")
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
	public User getUserById(Long id) {
		Session session = sessionFactory.openSession();
		try {
			User user =  (User) session.createQuery("FROM User WHERE id = :Id")
					.setParameter("Id", id)
					.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean editUser(User user) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(user);
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
	public User findByEmail(String email) {
		Session session = sessionFactory.openSession();
		try {
			User user = (User) session.createQuery("FROM User WHERE email = :email")
			.setParameter("email", email)
			.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;

	}

	@Override
	public Long countUser() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT COUNT(*) FROM User");
			
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

}
