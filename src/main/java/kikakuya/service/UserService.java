/**
 * Interface: UserService
 * Description: Service Layer. The UserServiceImpl class is responsible for the implementation of this layer.
 */
package kikakuya.service;

import java.sql.SQLException;

import kikakuya.model.User;

public interface UserService {
	public boolean isValidUser(String email, String password) throws SQLException;
	public boolean addUser(String name, String email, String password) throws SQLException;
	public boolean setRememberMe(User user) throws SQLException;
	public boolean getRememberMe(String token, String series) throws SQLException;
}
