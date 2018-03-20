package kikakuya.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.model.User;
import kikakuya.utilities.CookieUtilities;

@Controller
@RequestMapping(value="/logout")
public class LogoutController {
	
	@RequestMapping(method = RequestMethod.POST)
	public String viewLogin(HttpServletRequest request, HttpServletResponse response, Model model){
		HttpSession session = request.getSession(false);
		response.setContentType("text/html");
		
		Cookie uuid = CookieUtilities.eraseCookie("token");
		Cookie user = CookieUtilities.eraseCookie("series");
		response.addCookie(uuid);
		response.addCookie(user);
		
		if(session != null) {
			session.invalidate();
		}
		model.addAttribute("user", new User());
		return "redirect:/";
	}
}
