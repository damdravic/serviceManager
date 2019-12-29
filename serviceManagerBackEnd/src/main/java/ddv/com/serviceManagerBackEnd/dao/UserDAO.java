package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.User;

public interface UserDAO {
	
	
	
	User getUser (int userId);
	
	List<User> getUserList();
	
	boolean addNewUser(User user);
	
	boolean updateUser(User user);
	
	boolean deleteUser(int userId);
	

}
