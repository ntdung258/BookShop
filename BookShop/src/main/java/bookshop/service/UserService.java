package bookshop.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import bookshop.entity.User;


public interface UserService {
	@Autowired
	public boolean register(User user);
	public User checkEmail (String email);
	List<User> getUsers();
	User getUserById(Long id);
	boolean editUser (User user);
	Long countUser();
}
