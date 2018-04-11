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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kikakuya.delegate.GuestDelegate;
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
		
		Event event = (Event) request.getSession().getAttribute("event");
				
		model.addAttribute("email", new Email());
		List<Guest> guestList = new ArrayList<Guest>();
		try {
			guestList = rsvpDelegate.findGuests(event);
			request.setAttribute("guests", guestList);
			request.setAttribute("eventDate", event.getEventDate());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "sendMessage";
	}
	
	@RequestMapping(value="/rsvp", method = RequestMethod.POST)
	public String processSendRSVP(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAtt,
			@ModelAttribute("email") Email email){
		
		//String redirectTo = "sendMessage";
		int noReply = 1;
		User user = (User) request.getSession().getAttribute("user");
		
		Event event = (Event) request.getSession().getAttribute("event");
		
		List<Guest> guestList;
		
		
		try {
			guestList = rsvpDelegate.findGuestByStatus(noReply,event.getEventId());
			if(!rsvpDelegate.countEmailByEvent(event)){
				if(guestList.size() > 0){
					if(rsvpDelegate.insertEmail(email, event)){
						rsvpDelegate.sendRSVP(email, user, event, guestList);
						redirectAtt.addFlashAttribute("sendRSVPSuccess", "RSVPs have been successfully sent.");
						//redirectTo = "sendMessage";
					}
				}
				else {
					System.out.println("error in send rsvp");
					redirectAtt.addFlashAttribute("sendRSVPError", "Error! No guests found.");
				}
			}
			else{
				redirectAtt.addFlashAttribute("sendRSVPError", "Error! You can only send one RSVP per event.");
				request.setAttribute("guests", guestList);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("sendRSVPError", "Error! Message sending failed.");
		}
		return "redirect:/sendMessage";
	}
	
	@RequestMapping(value="/rsvpResponse", method = RequestMethod.GET)
	public String viewResponseForm(@RequestParam("token") String token, Model model, HttpServletRequest request){
		List<GuestPlusOne> adults = new ArrayList<>();
		List<GuestPlusOne> kids = new ArrayList<>();
		String redirectTo = "rsvpResponse";
		Event event = (Event) request.getSession().getAttribute("event");
		try {
			//find guest by token
			if(rsvpDelegate.isTokenFound(token)){
				Guest guest = rsvpDelegate.findGuestByToken(token);
				Email email = rsvpDelegate.findEmailByEvent(guest);
				//get all user-entered plus ones for guest
				adults = rsvpDelegate.findPlusOneByToken(token, "Adult");
				kids = rsvpDelegate.findPlusOneByToken(token, "Kid");
				
				if(adults.size() > 0){
					request.setAttribute("adults", adults);
				}
				
				if(kids.size() > 0){
					request.setAttribute("kids", kids);
				}
				
				model.addAttribute("guest", guest);
				request.setAttribute("guest", guest);
				request.setAttribute("email", email);
				request.setAttribute("token", token);
			}
			else{
				request.setAttribute("respondRSVPError", "You already replied to the RSVP.");
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
		
		Event event = (Event) request.getSession().getAttribute("event");
				
		try {
			Email email = rsvpDelegate.findEmailByEvent(guest);
			
			//update isPresent and meal choice
			if(rsvpDelegate.updateGuest(guest)){
				//delete token
				if(rsvpDelegate.deleteGuestToken(guest)){
					//check if there are user-entered plus ones, if yes delete
					if(rsvpDelegate.countPlusOnesByGuest(guest.getGuestId()) > 0 && guest.getIsPresent() == 0){
						if(!rsvpDelegate.removePlusOneByGuest(guest.getGuestId()))
							request.setAttribute("respondRSVPError", "Error! Your response was not sent successfully!");
					}
					//insert plus ones
					for(int i=0; i<plusOneList.size(); i++){
						if(!plusOneList.get(i).getFullName().trim().isEmpty())
							rsvpDelegate.insertPlusOne(plusOneList.get(i), guest);
						else
							continue;
					}
					request.setAttribute("respondRSVPSuccess", "Your RSVP response was successfully sent.");
				}
			}
			else{
				request.setAttribute("guest", guest);
				request.setAttribute("email", email);
				request.setAttribute("token", guest.getToken());
				request.setAttribute("respondRSVPError", "Error! Your response was not sent successfully!");
				redirectTo = "rsvpResponse";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("respondRSVPError", "Error!");
		}
		
		return redirectTo;
	}
	
}
