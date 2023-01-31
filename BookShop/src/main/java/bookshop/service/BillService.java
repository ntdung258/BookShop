package bookshop.service;
import java.util.Date;
import java.util.List;
import java.util.Map;

import bookshop.entity.Bill;
import bookshop.entity.BillDetail;


public interface BillService {
	boolean createBill(Bill bill);
	boolean createBillDetail(BillDetail billDetail);
	
	List<Bill> getBillByUser(Long id);
	List<BillDetail> getBillDetailByBillId(Long bill_id);
	Bill getBillById(Long id);
	
	Long getIdBillMaxByUser(Long id);
	List<Object[]> quantityBookSellByCategory();
	List<Object[]> quantityBookSellByCategoryAndDate(Date startDate,Date endDate);
	
	List<Object[]> quantityBookSellByAuthor();
	List<Object[]> quantityBookSellByAuthorAndDate(Date startDate,Date endDate);
	
	List<Object[]> totalPriceByDay();
	List<Object[]> totalPriceByDayAndDate(Date startDate,Date endDate);
	
	List<Object[]> totalPriceByMonth();
	List<Object[]> totalPriceByMonthAndDate(Date startDate,Date endDate);
	
	List<Object[]> totalPriceByYear();
	List<Object[]> totalPriceByYearAndDate(Date startDate,Date endDate);
	
	List<Bill> getBill();
	List<Bill> getBillByStatus(String status);
	List<BillDetail> getBillDetailByIdBill(Long id);
	
	boolean setChangeStatusOrder(Bill bill);
	
	long countBillWaitConfirm();
	long countBillDelivering();
	
	List<Bill> getBillWaitConfirm();
	List<Bill> getBillDelivering();
	List<Bill> getBillCompleted();
	
	List<Object[]> top3Book();
	
	public List<Map<String, Object>> reportBill(Long id);
}

