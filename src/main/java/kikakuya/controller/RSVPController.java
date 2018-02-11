package kikakuya.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kikakuya.delegate.MessageDelegate;
import kikakuya.delegate.RSVPDelegate;
import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;
import kikakuya.model.Vendor;

@Controller
//@RequestMapping(value="/sendMessage")
public class RSVPController {
	
	@Autowired
	private RSVPDelegate rsvpDelegate;

	/**
	* When the page is loaded, this method is run.
	* Create the kikakuya.model object (Email) and put it into the kikakuya.model map with the key "email".
	* @param kikakuya.model
	* @return
	*/
	@RequestMapping(value="/sendMessage", method = RequestMethod.GET)
	public String viewSendMessage(Model model){
		model.addAttribute("email", new Email());
		return "sendMessage";
	}
	
	@RequestMapping(value="/rsvp", method = RequestMethod.POST)
	public String processSendRSVP(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("email") Email email, Model model){
		
		String redirectTo = "sendMessage";
		
		List<Guest> guestList;
		try {
			guestList = rsvpDelegate.findGuests();
			rsvpDelegate.insertEmail(email);
			rsvpDelegate.sendRSVP(email, guestList);
			request.setAttribute("sendRSVPSuccess", "Success! RSVPs been successfully sent to all guests.");
			redirectTo = "sendMessage";
		
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("sendRSVPError", "Error! Message sending failed.");
		}
		
		return redirectTo;	
	}
	
	@RequestMapping(value="/rsvpResponse", method = RequestMethod.GET)
	public String viewResponseForm(@RequestParam("guestId") int guestId, Model model, HttpServletRequest request){
		//model.addAttribute("guest", new Guest());
		try {
			Guest guest = rsvpDelegate.findGuestById(guestId);
			request.setAttribute("guest", guest);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "rsvpResponse";
	}
}
