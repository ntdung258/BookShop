package bookshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Bill_Detail")
public class BillDetail {
	@Id
	@Column (name ="ID")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column (name ="BOOK_ID")
	private Long bookId;
	
	@Column (name ="QUANTITY")
	private Integer quantity;
	
	@Column (name ="PRICE")
	private Double price;
	
	@Column (name ="BOOK_NAME")
	private String bookName;
	
	@Column (name ="BOOK_IMAGE")
	private String bookImage;
	
	@Column (name ="CATEGORY_ID")
	private Long categoryId;
	
	@Column (name ="CATEGORY_NAME")
	private String categoryName;
	
	@Column (name ="AUTHOR_ID")
	private Long authorId;
	
	@Column (name ="AUTHOR_NAME")
	private String authorName;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "BILL_ID", nullable = false)
    private Bill bill;
	
	
	public BillDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BillDetail(Long id, Long bookId, Integer quantity, Double price, String bookName, String bookImage,
			Long categoryId, String categoryName, Long authorId, String authorName, Bill bill) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.quantity = quantity;
		this.price = price;
		this.bookName = bookName;
		this.bookImage = bookImage;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.authorId = authorId;
		this.authorName = authorName;
		this.bill = bill;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Long getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}
	
	
}
