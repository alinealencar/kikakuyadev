package kikakuya.delegate;

import java.sql.SQLException;

import kikakuya.service.UserService;

public class SignUpDelegate {
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public boolean insertUser(String name, String email, String password) 
			throws SQLException {
		return userService.insertUser(name, email, password);
	}
}
