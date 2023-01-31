package bookshop.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bookshop.dao.SearchDAO;
import bookshop.entity.Author;
import bookshop.entity.Bill;
import bookshop.entity.Category;
import bookshop.entity.Product;
import bookshop.entity.User;

@Repository
public class SearchDAOImpl implements SearchDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> searchProductByNameAndAuthor(String name) {
		Session session = sessionFactory.openSession();
		try {
			if(name==null || name.length()==0)
				name = "%";
			else
				name = "%"+name+"%";
			
			List list = session.createQuery("SELECT p FROM Product p "
					+ "JOIN p.author a "
					+ "WHERE p.bookName LIKE :Name "
					+ "OR a.authorName LIKE : Name ")
					.setParameter("Name", name)
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
	public List<Product> searchProductByName(String bookName) {
		Session session = sessionFactory.openSession();
		try {
			if(bookName==null || bookName.length()==0)
				bookName = "%";
			else
				bookName = "%"+bookName+"%";
			
			List list = session.createQuery("FROM Product WHERE bookName like :BookName")
					.setParameter("BookName", bookName)
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
	public List<User> searchUserByEmailOrName(String key) {
		Session session = sessionFactory.openSession();
		try {
			if(key==null || key.length()==0)
				key = "%";
			else
				key = "%"+key+"%";
			
			List list = session.createQuery("FROM User WHERE email like :Email OR fullname like :FullName")
					.setParameter("Email", key)
					.setParameter("FullName", key)
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
	public List<Bill> searchBillByNameOrPhone(String key) {
		Session session = sessionFactory.openSession();
		try {
			if(key==null || key.length()==0)
				key = "%";
			else
				key = "%"+key+"%";
			
			List list = session.createQuery("FROM Bill WHERE recipientName like :RecipientName OR phone like :Phone ORDER BY createDate DESC")
					.setParameter("RecipientName", key)
					.setParameter("Phone", key)
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
	public List<Author> searchAuthorByName(String key) {
		Session session = sessionFactory.openSession();
		try {
			if(key==null || key.length()==0)
				key = "%";
			else
				key = "%"+key+"%";
			
			List list = session.createQuery("FROM Author WHERE authorName like :AuthorName")
					.setParameter("AuthorName", key)
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
	public List<Category> searchCategoryName(String key) {
		Session session = sessionFactory.openSession();
		try {
			if(key==null || key.length()==0)
				key = "%";
			else
				key = "%"+key+"%";
			
			List list = session.createQuery("FROM Category WHERE categoryName like :CategoryName")
					.setParameter("CategoryName", key)
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	
}
