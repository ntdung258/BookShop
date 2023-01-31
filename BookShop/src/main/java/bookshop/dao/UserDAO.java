package bookshop.dao;
import java.util.List;
import bookshop.entity.User;


public interface UserDAO {
	boolean register(User user);
	User checkEmail (String email);
	List<User> getUsers();
	User getUserById(Long id);
	boolean editUser (User user);
	
	User findByEmail(String email);
	Long countUser();
}
