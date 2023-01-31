package bookshop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bookshop.dao.BillDAO;
import bookshop.entity.Bill;
import bookshop.entity.BillDetail;
import bookshop.service.BillService;

@Service
public class BillServiceImpl implements BillService {
	@Autowired
	private BillDAO billDAO;

	@Override
	public boolean createBill(Bill bill) {
		return billDAO.createBill(bill);
	}

	@Override
	public boolean createBillDetail(BillDetail billDetail) {
		return billDAO.createBillDetail(billDetail);
	}

	@Override
	public List<Bill> getBillByUser(Long id) {
		return billDAO.getBillByUser(id);
	}

	@Override
	public List<BillDetail> getBillDetailByBillId(Long id) {
		return billDAO.getBillDetailByBillId(id);
	}

	@Override
	public Long getIdBillMaxByUser(Long id) {
		return billDAO.getIdBillMaxByUser(id);
	}

	@Override
	public Bill getBillById(Long id) {
		return billDAO.getBillById(id);
	}

	@Override
	public List<Object[]> quantityBookSellByCategory() {
		return billDAO.quantityBookSellByCategory();
	}

	@Override
	public List<Object[]> quantityBookSellByCategoryAndDate(Date startDate, Date endDate) {
		return billDAO.quantityBookSellByCategoryAndDate(startDate, endDate);
	}

	@Override
	public List<Object[]> quantityBookSellByAuthor() {
		return billDAO.quantityBookSellByAuthor();
	}

	@Override
	public List<Object[]> quantityBookSellByAuthorAndDate(Date startDate, Date endDate) {
		return billDAO.quantityBookSellByAuthorAndDate(startDate, endDate);
	}

	@Override
	public List<Bill> getBill() {
		return billDAO.getBill();
	}

	@Override
	public List<Bill> getBillByStatus(String status) {
		return billDAO.getBillByStatus(status);
	}

	@Override
	public List<BillDetail> getBillDetailByIdBill(Long id) {
		return billDAO.getBillDetailByIdBill(id);
	}

	@Override
	public boolean setChangeStatusOrder(Bill bill) {
		return billDAO.setChangeStatusOrder(bill);
	}

	@Override
	public List<Object[]> totalPriceByDay() {
		return billDAO.totalPriceByDay();
	}

	@Override
	public List<Object[]> totalPriceByDayAndDate(Date startDate, Date endDate) {
		return billDAO.totalPriceByDayAndDate(startDate, endDate);
	}

	@Override
	public List<Object[]> totalPriceByMonth() {
		return billDAO.totalPriceByMonth();
	}

	@Override
	public List<Object[]> totalPriceByMonthAndDate(Date startDate, Date endDate) {
		return billDAO.totalPriceByMonthAndDate(startDate, endDate);
	}

	@Override
	public List<Object[]> totalPriceByYear() {
		return billDAO.totalPriceByYear();
	}

	@Override
	public List<Object[]> totalPriceByYearAndDate(Date startDate, Date endDate) {
		return billDAO.totalPriceByYearAndDate(startDate, endDate);
	}

	@Override
	public long countBillWaitConfirm() {
		return billDAO.countBillWaitConfirm();
	}

	@Override
	public long countBillDelivering() {
		return billDAO.countBillDelivering();
	}

	@Override
	public List<Bill> getBillWaitConfirm() {
		return billDAO.getBillWaitConfirm();
	}

	@Override
	public List<Bill> getBillDelivering() {
		return billDAO.getBillDelivering();
	}

	@Override
	public List<Object[]> top3Book() {
		return billDAO.top3Book();
	}

	@Override
	public List<Map<String, Object>> reportBill(Long id) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Bill b = billDAO.getBillById(id);
		
		for (BillDetail bd : billDAO.getBillDetailByBillId(id)) {
			Map<String, Object> item = new HashMap<String, Object>();
			item.put("recipientName", b.getRecipientName());
			item.put("phone", b.getPhone());
			item.put("address", b.getDeliveryAddress());
			item.put("total", b.getTotalPrice());
			item.put("bookName", bd.getBookName());
			item.put("price", bd.getPrice());
			item.put("quantity", bd.getQuantity());
			item.put("totalPrice", bd.getQuantity() * bd.getPrice());
			result.add(item);
		}
		return result;
	}

	@Override
	public List<Bill> getBillCompleted() {
		return billDAO.getBillCompleted();
	}

}
