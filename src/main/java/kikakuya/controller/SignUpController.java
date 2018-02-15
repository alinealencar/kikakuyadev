package kikakuya.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.SignUpDelegate;
import kikakuya.model.Event;
import kikakuya.model.User;

@Controller
@RequestMapping(value = {"/", "/signup"})
public class SignUpController {

	@Autowired
	private SignUpDelegate signUpDelegate;
	
	/**
	 * When the page is loaded, this method is run.
	 * Create the kikakuya.model object (User) and put it into the kikakuya.model map with the key "user".
	 * This creates a binding between the specified object with the form in the view returned by this method (the sign up form).
	 * @param kikakuya.model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String viewSignUp(Model model){
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
	public String processSignUp(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user") User user, Model model){
		String redirectTo = "index";

		System.out.println("NAME: " + user.getUserName());
		try {
			boolean isValidUser = signUpDelegate.insertUser(user.getUserName(), user.getEmail(), user.getUserPassword());
			if(isValidUser){
				System.out.println("SignUp successful");
				//Send the user name to the request scope
				request.setAttribute("userName", user.getUserName());
				request.setAttribute("signUpSuccess", "Sign Up Successful. Please log in to start using Kikakuya.");
				//Set the url the page will be redirected to
				redirectTo = "index";
			}
			else {
				System.out.println("SignUp unsuccessful");
				request.setAttribute("signUpError", "Error in the sign up");
			}
		} catch (Exception e) {
			if(e.getMessage().indexOf("for key 'email'") != -1){
				request.setAttribute("signUpError", "This email is already registered. Please log in.");
			}
			else {
				e.printStackTrace();
			}
		}
		
		//For testing purposes:
//		System.out.println("SIGNUP");
//		System.out.println("name: " + user.getUserName());
//		System.out.println("email: " + user.getEmail());
//		System.out.println("password: " + user.getUserPassword());
		
		model.addAttribute("event", new Event());
//		System.out.println("");
		return redirectTo;

	}
}
