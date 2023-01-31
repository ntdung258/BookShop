package bookshop.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Bill")
public class Bill {
	@Id
	@Column (name ="ID")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column (name ="TOTAL_PRICE")
	private Double totalPrice;
	
	@Column (name ="CREATE_DATE")
	private Date createDate;
	
	@Column (name ="RECIPIENT_NAME")
	private String recipientName;
	
	@Column (name ="DELIVERY_ADDRESS")
	private String deliveryAddress;
	
	@Column (name ="PHONE")
	private String phone;
	
	@Column (name ="NOTE")
	private String note;
	
	@Column (name ="PAYMENT_METHOD")
	private String paymentMethod;
	
	@Column (name ="STATUS")
	private String status;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    private User user;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bill")
    private Set<BillDetail> billDetails;
	
	@Column(name="REASON_CANCEL")
	private String reasonCancel;
	
	@Column(name="CANCEL_DATE")
	private Date cancelDate;


	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bill(Long id, Double totalPrice, Date createDate, String recipientName, String deliveryAddress, String phone,
			String note, String paymentMethod, String status, User user, Set<BillDetail> billDetails,String reasonCancel,Date cancelDate) {
		super();
		this.id = id;
		this.totalPrice = totalPrice;
		this.createDate = createDate;
		this.recipientName = recipientName;
		this.deliveryAddress = deliveryAddress;
		this.phone = phone;
		this.note = note;
		this.paymentMethod = paymentMethod;
		this.status = status;
		this.user = user;
		this.billDetails = billDetails;
		this.reasonCancel= reasonCancel;
		this.cancelDate = cancelDate;
	}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Double getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getRecipientName() {
		return recipientName;
	}


	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}


	public String getDeliveryAddress() {
		return deliveryAddress;
	}


	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Set<BillDetail> getBillDetails() {
		return billDetails;
	}


	public void setBillDetails(Set<BillDetail> billDetails) {
		this.billDetails = billDetails;
	}

	public String getReasonCancel() {
		return reasonCancel;
	}

	public void setReasonCancel(String reasonCancel) {
		this.reasonCancel = reasonCancel;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}
	
	
	
}
