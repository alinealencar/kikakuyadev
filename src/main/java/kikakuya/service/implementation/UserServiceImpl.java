/**
 * Class: UserServiceImpl.
 * Description: Implementation of the UserService interface at the service level.
 * 	The service layer delegates the actual verification and database call to the DAO (Data Access Object) layer.
 */
package kikakuya.service.implementation;

import java.sql.SQLException;

import kikakuya.dao.UserDao;
import kikakuya.model.User;
import kikakuya.service.UserService;
import kikakuya.utilities.HelperUtilities;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public boolean isValidUser(String email, String password) throws SQLException {
		User user = userDao.findByEmail(email);
		password = HelperUtilities.toMd5(password);
		
		return (user.getUserPassword().equals(password));

	}

	public boolean addUser(String name, String email, String password) throws SQLException {
		User user = new User();
		user.setUserName(name);
		user.setEmail(email);
		user.setUserPassword(password);
		
		return userDao.insertUser(user);
	}

	public boolean setRememberMe(User user) throws SQLException {
		return userDao.updateUser(user);
	}

	public boolean getRememberMe(String token, String series) throws SQLException {
		User user = userDao.findBySeries(series);
		if(user != null)
			return user.getToken().equals(token);
		else
			return false;
	}
}
