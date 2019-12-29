package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddv.com.serviceManagerBackEnd.dao.UserDAO;
import ddv.com.serviceManagerBackEnd.dto.User;

@Repository("UserDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User getUser(int userId) {
	 try {
		 return sessionFactory.getCurrentSession().get(User.class,Integer.valueOf(userId));
		 
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return null;
	}

	@Override
	public List<User> getUserList() {
		return sessionFactory.getCurrentSession().createQuery("FROM User",User.class).getResultList();
	}

	@Override
	public boolean addNewUser(User user) {
	      try {
	    	  sessionFactory.getCurrentSession().persist(user);
	      }catch(Exception ex) {
	    	  ex.printStackTrace();
	    	  
	      }
	      return false;
	}

	@Override
	public boolean updateUser(User user) {
		try {
			sessionFactory.getCurrentSession().update(user);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteUser(int userId) {
		try {
			 User user = sessionFactory.getCurrentSession().load(User.class,userId);
			sessionFactory.getCurrentSession().delete(user);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

}
