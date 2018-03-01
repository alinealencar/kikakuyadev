package kikakuya.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.LoginDelegate;
import kikakuya.model.Event;
import kikakuya.model.User;
import kikakuya.utilities.CookieUtilities;
import kikakuya.utilities.HelperUtilities;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	//Autowired annotation tells the application context (the container) to inject
	//an instance of LoginDelegate here.
	@Autowired
	private LoginDelegate loginDelegate;
	
	/**
	 * When the page is loaded, this method is run.
	 * Create the kikakuya.model object (User) and put it into the kikakuya.model map with the key "user".
	 * This creates a binding between the specified object with the form in the view returned by this method (the login form).
	 * @param kikakuya.model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String viewLogin(HttpServletRequest request, Model model){
		model.addAttribute("user", new User());
		return "index";
	}
	
	/**
	 * This method handles the form submission.
	 * The @ModelAttribute annotation makes the kikakuya.model object stored under the key "user"
	 * in the kikakuya.model map available to this method's body.
	 * @see viewSignUp
	 * @param user
	 * @param kikakuya.model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String processLogin(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("user") User user, Model model){

		String redirectTo = "index";
		HttpSession session = request.getSession();
		try {
			User LoginUser = loginDelegate.isValidUser(user.getEmail(), user.getUserPassword());
			if(LoginUser != null){
				//Send the user to the session scope
				session.setAttribute("user", LoginUser);
				//Send the user name to the request scope
				session.setAttribute("userName", LoginUser.getUserName());
				session.setAttribute("userId", LoginUser.getUserId());
				session.setAttribute("userEmail", LoginUser.getEmail());
				
				session.setAttribute("listEvent", loginDelegate.getEventsByUser(LoginUser));
				
				if(request.getParameter("isRememberMe") != null){
					String token = HelperUtilities.newUUID();
					String series = HelperUtilities.newUUID();
					//Unique identifier
					Cookie rememberMeToken = CookieUtilities.createRememberMeCookie("token", token);
					Cookie rememberMeSeries = CookieUtilities.createRememberMeCookie("series", series);
					response.addCookie(rememberMeToken);
					response.addCookie(rememberMeSeries);
					
					//Set user attributes
					user.setToken(token);
					user.setSeries(series);
					
					//Write token and series in the database
					loginDelegate.setRememberMe(user);
				}
				//Set the url the page will be redirected to
				redirectTo = "redirect:/list";
			}
			else {
				System.out.println("Login unsuccessful");
				request.setAttribute("loginError", "Email and/ or password is wrong.");
			}
		} catch (Exception e) {
			//Handle exception raised if the user is not on the database
			if ((e.toString()).equals("java.lang.NullPointerException")){
				System.out.println("Login unsuccessful: user is not registered in the database");
				request.setAttribute("loginError", "Email and/ or password is wrong.");
			}
			else {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("event", new Event());
		return redirectTo;
	}
}
