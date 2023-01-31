package bookshop.entity;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Collection<? extends GrantedAuthority> authorities;
	private String email;
	private String fullName;
	private String password;
	private String gender;
	private String address;
	private String phone;
	private Boolean status;
	private Boolean accountNonExpired;
	private Boolean accountNonLocked;
	private boolean credentialsNonExpired;

	public CustomUserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomUserDetails(Collection<? extends GrantedAuthority> authorities, String email, String fullname,
			String password, String gender, String address, String phone, Boolean status,
			Boolean accountNonExpired, Boolean accountNonLocked, boolean credentialsNonExpired) {
		super();
		this.authorities = authorities;
		this.email = email;
		this.fullName = fullname;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.status = status;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Boolean getAccountNonExpired() {
		return accountNonExpired;
		}

		public void setAccountNonExpired(Boolean accountNonExpired) {
			this.accountNonExpired = accountNonExpired;
		}

		public Boolean getAccountNonLocked() {
			return accountNonLocked;
		}

		public void setAccountNonLocked(Boolean accountNonLocked) {
			this.accountNonLocked = accountNonLocked;
		}

		public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
			this.authorities = authorities;
		}

		public void setPassword(String password) {
			this.password = password;
		}


		public void setCredentialsNonExpired(boolean credentialsNonExpired) {
			this.credentialsNonExpired = credentialsNonExpired;
		}

		@Override
		public Collection<? extends GrantedAuthority> getAuthorities() {
			return authorities;
		}

		@Override
		public String getPassword() {
			return password;
		}

		@Override
		public String getUsername() {
			return email;
		}

		@Override
		public boolean isAccountNonExpired() {
			return accountNonExpired;
		}

		@Override
		public boolean isAccountNonLocked() {
			return accountNonLocked;
		}
		@Override
		public boolean isCredentialsNonExpired() {
			return credentialsNonExpired;
		}

		@Override
		public boolean isEnabled() {
			return status;
		}

	}
