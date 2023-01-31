/*
 * package bookshop.entity;
 * 
 * import java.util.Set; import javax.persistence.Column; import
 * javax.persistence.Entity; import javax.persistence.GeneratedValue; import
 * javax.persistence.GenerationType; import javax.persistence.Id; import
 * javax.persistence.OneToMany; import javax.persistence.Table;
 * 
 * @Entity
 * 
 * @Table(name = "ROLE") public class Role {
 * 
 * @Id
 * 
 * @Column(name = "ID")
 * 
 * @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id;
 * 
 * @Column(name = "NAME") private String name;
 * 
 * @OneToMany(mappedBy = "role") private Set<User_Role> user_role;
 * 
 * public Role() { super(); // TODO Auto-generated constructor stub }
 * 
 * public Role(Long id, String name, Set<User_Role> user_role) { super();
 * this.id = id; this.name = name; this.user_role = user_role; }
 * 
 * public Long getId() { return id; }
 * 
 * public void setId(Long id) { this.id = id; }
 * 
 * public String getName() { return name; }
 * 
 * public void setName(String name) { this.name = name; }
 * 
 * public Set<User_Role> getUser_role() { return user_role; }
 * 
 * public void setUser_role(Set<User_Role> user_role) { this.user_role =
 * user_role; }
 * 
 * 
 * 
 * }
 */