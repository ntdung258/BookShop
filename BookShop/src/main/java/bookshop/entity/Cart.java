package bookshop.entity;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Cart")
public class Cart {
	@Id
	@Column (name ="ID")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column (name ="CREATE_DATE")
	private Date createDate;
	
	@Column (name ="[USER_ID]")
	private Long userId;
	
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

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(Long id, Date createDate, Long userId, Long bookId, Integer quantity, Double price, String bookName,
			String bookImage) {
		super();
		this.id = id;
		this.createDate = createDate;
		this.userId = userId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.price = price;
		this.bookName = bookName;
		this.bookImage = bookImage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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
	
	
}
