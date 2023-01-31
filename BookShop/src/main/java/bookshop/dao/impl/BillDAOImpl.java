package bookshop.dao.impl;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookshop.dao.BillDAO;
import bookshop.entity.Bill;
import bookshop.entity.BillDetail;

@Repository
public class BillDAOImpl implements BillDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean createBill(Bill bill) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(bill);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Bill> getBillByUser(Long id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Bill b WHERE user_id =:ID ORDER BY b.id DESC").setParameter("ID", id).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean createBillDetail(BillDetail billDetail) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(billDetail);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<BillDetail> getBillDetailByBillId(Long id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM BillDetail WHERE bill_id =:ID").setParameter("ID", id).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Long getIdBillMaxByUser(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT MAX(b.id) FROM Bill b WHERE user_id =:ID")
					.setParameter("ID", id);
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Bill getBillById(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Bill bill = (Bill) session.createQuery("FROM Bill WHERE id =:ID")
					.setParameter("ID", id)
					.uniqueResult();
			return bill;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> quantityBookSellByCategory() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT SUM(bd.quantity),bd.categoryId,bd.categoryName "
					+ "FROM BillDetail bd JOIN bd.bill "
					+ "WHERE bd.bill.status ='Order completed' "
					+ "GROUP BY bd.categoryId,bd.categoryName")
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
	public List<Object[]> quantityBookSellByCategoryAndDate(Date startDate, Date endDate) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT SUM(bd.quantity),bd.categoryId,bd.categoryName "
					+ "FROM BillDetail bd JOIN bd.bill "
					+ "WHERE (bd.bill.status ='Order completed') "
					+ "AND (bd.bill.createDate BETWEEN :START_DATE AND :END_DATE) "
					+ "GROUP BY bd.categoryId,bd.categoryName")
					.setParameter("START_DATE", startDate)
					.setParameter("END_DATE", endDate)
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
	public List<Object[]> quantityBookSellByAuthor() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT SUM(bd.quantity),bd.authorId,bd.authorName "
					+ "FROM BillDetail bd JOIN bd.bill "
					+ "WHERE bd.bill.status ='Order completed' "
					+ "GROUP BY bd.authorId,bd.authorName")
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
	public List<Object[]> quantityBookSellByAuthorAndDate(Date startDate, Date endDate) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT SUM(bd.quantity),bd.authorId,bd.authorName "
					+ "FROM BillDetail bd JOIN bd.bill "
					+ "WHERE bd.bill.status ='Order completed' AND bd.bill.createDate BETWEEN :START_DATE AND :END_DATE "
					+ "GROUP BY bd.authorId,bd.authorName")
					.setParameter("START_DATE", startDate)
					.setParameter("END_DATE", endDate)
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
	public List<Bill> getBill() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Bill ORDER BY createDate DESC")
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
	public List<Bill> getBillByStatus(String status) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Bill WHERE Status=:STATUS ORDER BY createDate DESC")
					.setParameter("STATUS", status)
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
	public List<BillDetail> getBillDetailByIdBill(Long id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM BillDetail WHERE bill_id=:ID")
					.setParameter("ID", id)
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
	public boolean setChangeStatusOrder(Bill bill) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(bill);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Object[]> totalPriceByDay() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT "
					+ "DAY(b.createDate),"
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate),"
					+ "SUM(b.totalPrice) "
					+ "FROM Bill b "
					+ "WHERE b.status ='Order completed' "
					+ "GROUP BY "
					+ "DAY(b.createDate),"
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate) "
					+ "ORDER BY YEAR(b.createDate) DESC ,"
					+ "MONTH(b.createDate) DESC ,"
					+ "DAY(b.createDate) DESC ");
			q.setMaxResults(7);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> totalPriceByDayAndDate(Date startDate, Date endDate) {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT "
					+ "DAY(b.createDate),"
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate),"
					+ "SUM(b.totalPrice) "
					+ "FROM Bill b "
					+ "WHERE (b.status ='Order completed') "
					+ "AND (b.createDate BETWEEN :START_DATE AND :END_DATE) "
					+ "GROUP BY "
					+ "DAY(b.createDate),"
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate) "
					+ "ORDER BY YEAR(b.createDate) DESC ,"
					+ "MONTH(b.createDate) DESC ,"
					+ "DAY(b.createDate) DESC ")
					.setParameter("START_DATE", startDate)
					.setParameter("END_DATE", endDate);
			q.setMaxResults(7);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> totalPriceByMonth() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT "
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate),"
					+ "SUM(b.totalPrice) "
					+ "FROM Bill b "
					+ "WHERE b.status ='Order completed' "
					+ "GROUP BY "
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate) "
					+ "ORDER BY YEAR(b.createDate) DESC ,"
					+ "MONTH(b.createDate) DESC ");
			q.setMaxResults(7);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> totalPriceByMonthAndDate(Date startDate, Date endDate) {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT "
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate),"
					+ "SUM(b.totalPrice) "
					+ "FROM Bill b "
					+ "WHERE (b.status ='Order completed') "
					+ "AND (b.createDate BETWEEN :START_DATE AND :END_DATE) "
					+ "GROUP BY "
					+ "MONTH(b.createDate),"
					+ "YEAR(b.createDate) "
					+ "ORDER BY YEAR(b.createDate) DESC ,"
					+ "MONTH(b.createDate) DESC ")
					.setParameter("START_DATE", startDate)
					.setParameter("END_DATE", endDate);
			q.setMaxResults(7);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> totalPriceByYear() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT "
					+ "YEAR(b.createDate),"
					+ "SUM(b.totalPrice) "
					+ "FROM Bill b "
					+ "WHERE b.status ='Order completed' "
					+ "GROUP BY "
					+ "YEAR(b.createDate) "
					+ "ORDER BY YEAR(b.createDate) DESC ");
			q.setMaxResults(7);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> totalPriceByYearAndDate(Date startDate, Date endDate) {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT "
					+ "YEAR(b.createDate),"
					+ "SUM(b.totalPrice) "
					+ "FROM Bill b "
					+ "WHERE (b.status ='Order completed') "
					+ "AND (b.createDate BETWEEN :START_DATE AND :END_DATE) "
					+ "GROUP BY "
					+ "YEAR(b.createDate) "
					+ "ORDER BY YEAR(b.createDate) DESC ")
					.setParameter("START_DATE", startDate)
					.setParameter("END_DATE", endDate);
			q.setMaxResults(7);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public long countBillWaitConfirm() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT COUNT(*) FROM Bill WHERE status = 'Wait confirmation' ");
			
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}

	@Override
	public long countBillDelivering() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT COUNT(*) FROM Bill WHERE status = 'Delivering' ");
			
			return Long.parseLong(q.getSingleResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}

	@Override
	public List<Bill> getBillWaitConfirm() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Bill b WHERE b.status = 'Wait confirmation'")
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
	public List<Bill> getBillDelivering() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Bill b WHERE b.status = 'Delivering' ")
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
	public List<Object[]> top3Book() {
		Session session = sessionFactory.openSession();
		try {
			Query q = session.createQuery("SELECT SUM(bd.quantity),bd.bookId "
					+ "FROM BillDetail bd JOIN bd.bill "
					+ "WHERE bd.bill.status ='Order completed' "
					+ "GROUP BY bd.bookId "
					+ "ORDER BY SUM(bd.quantity) DESC");
			q.setMaxResults(3);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;

	}

	@Override
	public List<Bill> getBillCompleted() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Bill b WHERE b.status = 'Order completed'")
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
