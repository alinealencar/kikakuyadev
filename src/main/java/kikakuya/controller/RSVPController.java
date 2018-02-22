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
	public String viewSendMessage(Model model, HttpServletRequest request){
		//for testing
		Event event = new Event(); 
		event.setEventId(1); 
				
		model.addAttribute("email", new Email());
		List<Guest> guestList = new ArrayList<Guest>();
		try {
			guestList = rsvpDelegate.findGuests(event);
			request.setAttribute("guests", guestList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
		event.setEventName("Chace's Birthday");
		
		List<Guest> guestList;
		
		
		try {
			guestList = rsvpDelegate.findGuests(event);
			if(!rsvpDelegate.countEmailByEvent(event)){
				if(guestList.size() > 0){
					if(rsvpDelegate.insertEmail(email, event)){
						rsvpDelegate.sendRSVP(email, user, event, guestList);
						request.setAttribute("sendRSVPSuccess", "Success! RSVPs have been successfully sent to all guests.");
						redirectTo = "sendMessage";
					}
				}
				else
					request.setAttribute("sendRSVPError", "Error! No guests found.");
			}
			else{
				request.setAttribute("sendRSVPError", "Error! You can only send one RSVP per event.");
				request.setAttribute("guests", guestList);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("sendRSVPError", "Error! Message sending failed.");
		}
		return redirectTo;	
	}
	
	/*@RequestMapping(value="/resendRsvp", method = RequestMethod.POST)
	public String processResendRSVP(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("email") Email email){
		
		String redirectTo = "sendMessage";
		User user = (User) request.getSession().getAttribute("user");
		
		//for testing
		Event event = new Event(); 
		event.setEventId(1); 
		event.setLocation("ACC"); 
		event.setEventDate("2018-05-29");
		event.setEventName("Chace's Birthday");
		
		try {
			rsvpDelegate.sendRSVP(email, user, event, guest);
			request.setAttribute("sendRSVPSuccess", "Success! RSVPs have been successfully sent to all guests.");
			redirectTo = "sendMessage";
		
		}catch (Exception e){
			e.printStackTrace();
		}
		return redirectTo;
	}*/
	
	@RequestMapping(value="/rsvpResponse", method = RequestMethod.GET)
	public String viewResponseForm(@RequestParam("token") String token, Model model, HttpServletRequest request){
	
		//for testing
		Event event = new Event(); 
		event.setEventId(1); 
		event.setLocation("ACC"); 
		event.setEventDate("2018-05-29");
		event.setEventName("Chace's Birthday");
		
		String redirectTo = "rsvpResponse";
		try {
			if(rsvpDelegate.isTokenFound(token)){
				Guest guest = rsvpDelegate.findGuestByToken(token);
				Email email = rsvpDelegate.findEmailByEvent(event);
				
				model.addAttribute("guest", guest);
				request.setAttribute("guest", guest);
				request.setAttribute("email", email);
				request.setAttribute("token", token);
			}
			else{
				request.setAttribute("respondRSVPError", "You have already replied to the RSVP.");
				redirectTo = "rsvpConfirmation";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return redirectTo;
	}
	
	@RequestMapping(value="/sendRsvpResponse", method = RequestMethod.POST)
	public String processSendRSVPResponse(HttpServletRequest request, 
			@ModelAttribute("guest") Guest guest){
		String redirectTo = "rsvpConfirmation";
		List<GuestPlusOne> plusOneList = new ArrayList<GuestPlusOne>();
		plusOneList = guest.getPlusOneList();
		
		//for testing
		Event event = new Event(); 
		event.setEventId(1); 
		event.setLocation("ACC"); 
		event.setEventDate("2018-05-29");
		event.setEventName("Chace's Birthday");
				
		try {
			Email email = rsvpDelegate.findEmailByEvent(event);
			
			for(int i=0; i<plusOneList.size(); i++){
				if(plusOneList.get(i).getFullName() != null && !plusOneList.get(i).getMealChoice().equals(""))
					rsvpDelegate.insertPlusOne(plusOneList.get(i), guest);
				else
					continue;
			}
			if(rsvpDelegate.updateGuest(guest)){
				if(rsvpDelegate.deleteGuestToken(guest))
					request.setAttribute("respondRSVPSuccess", "Success! You have successfully responded to the RSVP.");
			}
			else{
				request.setAttribute("guest", guest);
				request.setAttribute("email", email);
				request.setAttribute("token", guest.getToken());
				request.setAttribute("respondRSVPError", "Error! Your response was not sent successfully!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("respondRSVPError", "Error!");
		}
		
		return redirectTo;
	}
	
}
