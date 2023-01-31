package bookshop.entity;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "[User]")
public class User {
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "BIRTHDAY")
	private Date birthday;

	@Column(name = "FULLNAME")
	private String fullname;

	@Column(name = "PHONE")
	private String phone;

	@Column(name = "ADDRESS")
	private String address;
	
	@Column(name = "USER_IMAGE")
	private String userImage;	

	@Column(name = "STATUS")
	private boolean status;
	
	@Column(name = "USER_ROLE")
	private String userRole;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	private Set<Bill> bill;
	
	/*
	 * @OneToMany(mappedBy = "user", fetch = FetchType.EAGER) private Set<User_Role>
	 * user_role;
	 */



	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Long id, String email, String password, String gender, Date birthday, String fullname, String phone,
			String address,String userImage, boolean status,String userRole, Set<Bill> bill) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.userImage = userImage;
		this.status = status;
		this.bill = bill;
		/* this.user_role=user_role; */
		this.userRole = userRole;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Set<Bill> getBill() {
		return bill;
	}

	public void setBill(Set<Bill> bill) {
		this.bill = bill;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	
	

	/*
	 * public Set<User_Role> getUser_role() { return user_role; }
	 * 
	 * public void setUser_role(Set<User_Role> user_role) { this.user_role =
	 * user_role; }
	 */
	
	

}
