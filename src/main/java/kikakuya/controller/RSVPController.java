package kikakuya.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kikakuya.delegate.MessageDelegate;
import kikakuya.delegate.RSVPDelegate;
import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
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
			@ModelAttribute("email") Email email){
		
		String redirectTo = "sendMessage";
		User user = (User) request.getSession().getAttribute("user");
		
		//for testing
		Event event = new Event(); 
		event.setEventId(1); 
		event.setLocation("ACC"); 
		event.setEventDate("2018-05-29");
		
		List<Guest> guestList;
		
		try {
			if(!rsvpDelegate.findEmailByEvent(event)){
				guestList = rsvpDelegate.findGuests(event);
				if(guestList.size() > 0){
					if(rsvpDelegate.insertEmail(email, event)){
					//for(int i=0; i<guestList.size(); i++)
						//rsvpDelegate.updateEmailIdGuest(guestList.get(i));
						rsvpDelegate.sendRSVP(email, user, event, guestList);
						request.setAttribute("sendRSVPSuccess", "Success! RSVPs have been successfully sent to all guests.");
						redirectTo = "sendMessage";
					}
				}
			}
			else
				request.setAttribute("sendRSVPError", "Error! You can only send one RSVP per event.");
		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("sendRSVPError", "Error! Message sending failed.");
		}
		
		return redirectTo;	
	}
	
	@RequestMapping(value="/rsvpResponse", method = RequestMethod.GET)
	public String viewResponseForm(@RequestParam("guestId") int guestId, Model model, HttpServletRequest request){
	
		//for testing
				Event event = new Event(); 
				event.setEventId(1); 
				event.setLocation("ACC"); 
				event.setEventDate("2018-05-29");
				event.setEventName("Chace's Birthday");
		try {
			Guest guest = rsvpDelegate.findGuestById(guestId);
			Email email = rsvpDelegate.findEmailById(event);
			model.addAttribute("guest", guest);
			//Email email = rsvpDelegate.findEmailById(1);
			request.setAttribute("guest", guest);
			request.setAttribute("email", email);
			request.setAttribute("guestId", guestId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "rsvpResponse";
	}
	
	@RequestMapping(value="/sendRsvpResponse", method = RequestMethod.POST)
	public String processSendRSVPResponse(HttpServletRequest request, 
			@ModelAttribute("guest") Guest guest, Model model){
		String redirectTo = "rsvpConfirmation";
		List<GuestPlusOne> plusOneList = new ArrayList<GuestPlusOne>();
		plusOneList = guest.getPlusOneList();
		try {
			for(int i=0; i<plusOneList.size(); i++){
				rsvpDelegate.insertPlusOne(plusOneList.get(i), guest);
			}
			if(rsvpDelegate.updateGuest(guest))
				request.setAttribute("respondRSVPSuccess", "Success! You have successfully responded to the RSVP.");
			else
				request.setAttribute("respondRSVPError", "Error! Your response was not sent successfully!");
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("respondRSVPError", "Error!");
		}
		
		return redirectTo;
	}
	
}
