/**
 * Class: LoginDelegate
 * Description: Business Logic. It uses the UserService interface for the kikakuya.service layer.
 *	Following the principle of "coding to the interface".
 */
package kikakuya.delegate;

import java.net.URLDecoder;
import java.sql.SQLException;

import javax.servlet.http.Cookie;

import kikakuya.model.User;
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
	
	public boolean setRememberMe(User user) throws SQLException {
		return userService.setRememberMe(user);
	}
	
	public boolean isRememberMe(Cookie[] cookies) throws Exception {
		return userService.getRememberMe(cookies[0].getValue(), cookies[1].getValue());
	}
}
