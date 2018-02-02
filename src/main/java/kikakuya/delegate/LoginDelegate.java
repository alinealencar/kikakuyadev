/**
 * Class: LoginDelegate
 * Description: Business Logic. It uses the UserService interface for the kikakuya.service layer.
 *	Following the principle of "coding to the interface".
 */
package kikakuya.delegate;

import java.sql.SQLException;

import kikakuya.service.UserService;

public class LoginDelegate {
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public boolean isValidUser(String email, String password) 
			throws SQLException {
		return userService.isValidUser(email, password);
	}
}
