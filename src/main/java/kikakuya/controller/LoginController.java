package kikakuya.controller;

import java.net.URLEncoder;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import kikakuya.delegate.LoginDelegate;
import kikakuya.model.Event;
import kikakuya.model.User;
import kikakuya.utilities.AuthenticationUtilities;
import kikakuya.utilities.CookieUtilities;
import kikakuya.utilities.HelperUtilities;

@Controller
@RequestMapping(value="/login")
@SessionAttributes("user")
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
//		//If user is logged in, redirect then to the landing page
//		try {
//			Cookie[] rememberMeCookies = AuthenticationUtilities.isRememberMe(request);
//		
//			if(loginDelegate.isRememberMe(rememberMeCookies) || AuthenticationUtilities.isLoggedIn(request.getSession())){
//				return "events";
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
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

		String redirectTo = "/";
		HttpSession session = request.getSession();
		try {
			boolean isValidUser = loginDelegate.isValidUser(user.getEmail(), user.getUserPassword());
			if(isValidUser){
				System.out.println("Login successful. Is Remember Me: " + request.getParameter("isRememberMe"));
				//Send the user name to the request scope
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userEmail", user.getEmail());
				
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
				redirectTo = "event";
			}
			else {
				System.out.println("Login unsuccessful");
				request.setAttribute("loginError", "Email and/ or password is wrong.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//For testing purposes:
		System.out.println("LOGIN");
		System.out.println("email: " + user.getEmail());
		System.out.println("password: " + user.getUserPassword());
		model.addAttribute("event", new Event());
		return redirectTo;
	}
}
