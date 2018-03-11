/**
 * Class: LoginDelegate
 * Description: Business Logic. It uses the UserService interface for the kikakuya.service layer.
 *	Following the principle of "coding to the interface".
 */
package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.Cookie;

import kikakuya.model.Event;
import kikakuya.model.User;
import kikakuya.service.EventService;
import kikakuya.service.UserService;

public class LoginDelegate {
	private UserService userService;
	private EventService eventService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public EventService getEventService() {
		return eventService;
	}

	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	public User isValidUser(String email, String password) 
			throws SQLException {
		return userService.isValidUser(email, password);
	}
	
	public boolean setRememberMe(User user) throws SQLException {
		return userService.setRememberMe(user);
	}
	
	public boolean isRememberMe(Cookie[] cookies) throws Exception {
		return userService.getRememberMe(cookies[0].getValue(), cookies[1].getValue());
	}
	
	public List<Event> getEventsByUser(User user) throws Exception{
		return eventService.listEventsByUser(user);
	}
}
