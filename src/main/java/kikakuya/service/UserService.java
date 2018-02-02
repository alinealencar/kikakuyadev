/**
 * Interface: UserService
 * Description: Service Layer. The UserServiceImpl class is responsible for the implementation of this layer.
 */
package kikakuya.service;

import java.sql.SQLException;

public interface UserService {
	public boolean isValidUser(String email, String password) throws SQLException;
	public boolean insertUser(String name, String email, String password) throws SQLException;
}
