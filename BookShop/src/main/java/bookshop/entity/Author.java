package bookshop.entity;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Author")
public class Author {
	@Id
	@Column (name ="ID")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column (name ="AUTHOR_NAME")
	private String authorName;
	
	@Column (name ="AUTHOR_IMAGE")
	private String authorImage;
	
	@Column (name ="CREATE_DATE")
	private Date createDate;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "author",cascade = CascadeType.ALL)
    private Set<Product> products;

	public Author() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Author(Long id, String authorName, String authorImage,Date createDate,Set<Product> products) {
		super();
		this.id = id;
		this.authorName = authorName;
		this.authorImage = authorImage;
		this.createDate = createDate;
		this.products = products;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAuthorImage() {
		return authorImage;
	}

	public void setAuthorImage(String authorImage) {
		this.authorImage = authorImage;
	}
	
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
}



