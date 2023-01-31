package bookshop.entity;
import java.util.Date;
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
@Table (name="Product")
public class Product {
	@Id
	@Column (name ="ID")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column (name ="BOOK_NAME")
	private String bookName;
	
	@Column (name ="QUANTITY")
	private Integer quantity;
	
	@Column (name ="PRICE")
	private Double price;
	
	@Column (name ="PAGES")
	private String pages;
	
	@Column (name ="LANGUAGE")
	private String language;
	
	@Column (name ="PUBLICATION_DATE")
	private Date publicationDate;
	
	@Column (name ="PUBLISHER")
	private String publisher;
	
	@Column (name ="BOOK_IMAGE")
	private String bookImage;
	
	@Column (name ="CREATE_DATE")
	private Date createDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "AUTHOR_ID", nullable = false)
    private Author author;
    
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    private Category category;
	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Product(Long id, String bookName, Integer quantity, Double price, String pages, String language,
			Date publicationDate, String publisher, String bookImage, Date createDate, Author author,
			Category category) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.quantity = quantity;
		this.price = price;
		this.pages = pages;
		this.language = language;
		this.publicationDate = publicationDate;
		this.publisher = publisher;
		this.bookImage = bookImage;
		this.createDate = createDate;
		this.author = author;
		this.category = category;
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getBookName() {
		return bookName;
	}



	public void setBookName(String bookName) {
		this.bookName = bookName;
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



	public String getPages() {
		return pages;
	}



	public void setPages(String pages) {
		this.pages = pages;
	}



	public String getLanguage() {
		return language;
	}



	public void setLanguage(String language) {
		this.language = language;
	}



	public Date getPublicationDate() {
		return publicationDate;
	}



	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	public String getBookImage() {
		return bookImage;
	}



	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public Author getAuthor() {
		return author;
	}



	public void setAuthor(Author author) {
		this.author = author;
	}



	public Category getCategory() {
		return category;
	}



	public void setCategory(Category category) {
		this.category = category;
	}
		
	
	
}


