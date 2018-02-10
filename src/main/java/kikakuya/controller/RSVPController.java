package kikakuya.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.MessageDelegate;
import kikakuya.delegate.RSVPDelegate;
import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;
import kikakuya.model.Vendor;

@Controller
@RequestMapping(value="/sendMessage")
public class RSVPController {
	
	@Autowired
	private RSVPDelegate rsvpDelegate;

	/**
	* When the page is loaded, this method is run.
	* Create the kikakuya.model object (Email) and put it into the kikakuya.model map with the key "email".
	* @param kikakuya.model
	* @return
	*/
	@RequestMapping(method = RequestMethod.GET)
	public String viewSendMessage(Model model){
		model.addAttribute("email", new Email());
		return "sendMessage";
	}
	
	/*@RequestMapping(method = RequestMethod.GET)
	public String viewSendMessage(Model model){
		model.addAttribute("Email", new Email());
		Email email = new Email();
		Guest guest = new Guest();
		User user = new User();
		String msg;
		rsvpDelegate.sendRSVP(guest, email, user);
		return ""; //fill this up once jsp is done
	}*/
	
	@RequestMapping(value="/rsvp", method = RequestMethod.POST)
	public String processSendRSVP(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("email") Email email, Model model){
		
		String redirectTo = "sendMessage";
		
		rsvpDelegate.sendRSVP(email);
		request.setAttribute("sendRSVPSuccess", "Success! RSVPs been successfully sent to all guests.");
		
		return redirectTo;
	}
	
	@RequestMapping(value="/rsvpResponse", method = RequestMethod.GET)
	public String viewResponseForm(Model model){
		model.addAttribute("guest", new Guest());
		return "rsvpResponse";
	}
}
