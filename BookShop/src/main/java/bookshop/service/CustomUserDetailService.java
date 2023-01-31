package bookshop.service;

import java.util.Collection;
import java.util.HashSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import bookshop.dao.UserDAO;
import bookshop.entity.CustomUserDetails;
import bookshop.entity.User;



@Service
public class CustomUserDetailService implements UserDetailsService{
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return loadUser(username);
	}

	
	private UserDetails loadUser(String email) {
		User user = userDAO.findByEmail(email);
		
        if (user==null){
            return null;
        }
        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        grantedAuthoritySet.add(new SimpleGrantedAuthority(user.getUserRole()));
           
        return new CustomUserDetails(grantedAuthoritySet, user.getEmail(), user.getFullname(), user.getPassword(), user.getGender(), user.getAddress(), user.getPhone(), user.isStatus(),true,true,true);
	}
}
