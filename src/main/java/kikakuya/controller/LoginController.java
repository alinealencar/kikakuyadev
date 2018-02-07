package kikakuya.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.LoginDelegate;
import kikakuya.model.User;

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
	public String viewLogin(Model model){
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

		try {
			boolean isValidUser = loginDelegate.isValidUser(user.getEmail(), user.getUserPassword());
			if(isValidUser){
				System.out.println("Login successful. Is Remember Me: " + user.getIsRememberMe());
				//Send the user name to the request scope
				request.setAttribute("userName", user.getUserName());
				
//				if(user.getIsRememberMe() == 1){
//					//Unique identifier
//					Cookie rememberMe = CookieUtilities.createRememberMeCookie("uuid", UUID.randomUUID().toString());
//				}
				//Set the url the page will be redirected to
				redirectTo = "search";
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
		return redirectTo;
	}
}
