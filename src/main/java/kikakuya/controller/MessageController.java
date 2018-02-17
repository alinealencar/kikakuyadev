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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.MessageDelegate;
import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.User;

@Controller
public class MessageController {

	@Autowired
	private MessageDelegate messageDelegate;

	@RequestMapping(value="/broadcast", method = RequestMethod.POST)
	public String processSendBroadcast(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("email") Email email, Model model){
		
		String redirectTo = "sendMessage";
		List<Guest> guestList = new ArrayList<Guest>();
		
		int statusId;
		
		//for testing
		Event event = new Event(); 
		event.setEventId(1);
				
		try {
			List<Guest> allGuests = new ArrayList<Guest>();
			allGuests = messageDelegate.findGuests(event);
					
			if(email.getStatus().equals("all")){
				guestList = messageDelegate.findGuests(event);
			}
			else if(email.getStatus().equals("attending")){
				statusId = 1;
				guestList = messageDelegate.findGuestByStatus(statusId, event.getEventId());
			}
			else if(email.getStatus().equals("absent")){
				statusId = 2;
				guestList = messageDelegate.findGuestByStatus(statusId, event.getEventId());
			}
			else if(email.getStatus().equals("noReply")){
				statusId = 0;
				guestList = messageDelegate.findGuestByStatus(statusId, event.getEventId());
			}
			else{
				for(int i=0; i<email.getRecipients().length; i++){
					Guest guest = new Guest();
					guest = messageDelegate.findGuestById(email.getRecipients()[i]);
					guestList.add(guest);
				}
			}
			messageDelegate.sendBroadcast(email, guestList);
			request.setAttribute("guests", allGuests);
			request.setAttribute("sendBroadcastSuccess", "Success! Your message has been successfully delivered.");
		} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("sendBroadcastError", "Error! Message sending failed.");
			}
		
		return redirectTo;
		}
		
	}

