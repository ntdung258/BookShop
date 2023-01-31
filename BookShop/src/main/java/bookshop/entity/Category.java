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
@Table(name="Category")
public class Category {
	@Id
	@Column (name ="ID")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
		
	@Column(name="CATEGORY_NAME")
	private String categoryName;
	
	@Column (name ="CREATE_DATE")
	private Date createDate;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category",cascade = CascadeType.ALL)
    private Set<Product> products;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Category(Long id, String categoryName,Date createDate,Set<Product> products) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.createDate = createDate;
		this.products = products;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

