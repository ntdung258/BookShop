package bookshop.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bookshop.dao.UserDAO;
import bookshop.entity.User;
import bookshop.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public boolean register(User user) {
		return userDAO.register(user);
	}

	@Override
	public User checkEmail(String email) {	
		return userDAO.checkEmail(email);
	}

	@Override
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Override
	public User getUserById(Long id) {
		return userDAO.getUserById(id);
	}

	@Override
	public boolean editUser(User user) {
		return userDAO.editUser(user);
	}

	@Override
	public Long countUser() {
		return userDAO.countUser();
	}

}

