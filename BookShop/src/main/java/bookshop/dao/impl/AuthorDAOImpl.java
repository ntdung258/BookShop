package bookshop.dao.impl;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookshop.dao.AuthorDAO;
import bookshop.entity.Author;



@Repository
public class AuthorDAOImpl implements AuthorDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Author> getAuthors() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Author a ORDER BY a.createDate DESC").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Author getAuthorById(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Author author =  (Author) session.createQuery("FROM Author WHERE id = :Id")
					.setParameter("Id", id)
					.uniqueResult();
			return author;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean addAuthor(Author author) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(author);
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
	public boolean editAuthor(Author author) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(author);
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
	public boolean deletAuthor(Long id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getAuthorById(id));
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
	public Long countAuthor() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT COUNT(*) FROM Author");
			
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Author checkAuthor(String authorName) {
		Session session = sessionFactory.openSession();
		try {
			Author author = (Author) session.createQuery("FROM Author WHERE authorName = :authorName")
					.setParameter("authorName", authorName)
					.uniqueResult();
			return author;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	
}
