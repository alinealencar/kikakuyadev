package kikakuya.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.GuestDelegate;
import kikakuya.model.Guest;
import kikakuya.utilities.HelperUtilities;

@Controller
public class GuestController {
	
	@Autowired
	private GuestDelegate guestDelegate;
	
	//Show guest dashboard
	@RequestMapping(value = "/guestsDash", method = RequestMethod.GET)
	public String viewGuestDashboard(Model model){
		model.addAttribute("guest", new Guest());
		return "guests";
	}
	
	//Show guest management
	@RequestMapping(value = "/guestMgmt", method = RequestMethod.GET)
	public String viewGuest(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		// TODO Send all guests related to the event that is currently selected
		int eventId = 1;
		//Get a list of all guests
		try {
			List<Guest> allGuests = guestDelegate.getAllGuests(eventId);
			session.setAttribute("guests", allGuests);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Send the list of all guests to the session scope
		model.addAttribute("guest", new Guest());
		return "guestMgmt";
	}

	//Add guest
	@RequestMapping(value = "/addGuest", method = RequestMethod.POST)
	public String processAddGuest(HttpServletRequest request, @ModelAttribute("guest") Guest guest, Model model){
		try {
			guest.setToken(HelperUtilities.newUUID());
			boolean addSuccessful = guestDelegate.addGuest(guest);
			if(addSuccessful){
				System.out.println("Add guest successful");
				
				//Add success message to the request scope
				request.setAttribute("addGuestSuccess", "add sucessful");
				//Update guest list
				int eventId = 1;
				List<Guest> allGuests = guestDelegate.getAllGuests(eventId);
				request.getSession().setAttribute("guests", allGuests);
			}
			else {
				request.setAttribute("addGuestError", "Error in the add guest");
			}
				
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return "guestMgmt";
	}
	
	//Edit guest
	@RequestMapping(value = "/editGuest", method = RequestMethod.POST)
	public String processEditGuest(HttpServletRequest request, @ModelAttribute("guest") Guest guest, Model model){
		try {
			boolean editSuccessful = guestDelegate.editGuest(guest);
			if(editSuccessful){
				System.out.println("Edit guest successful");
				request.setAttribute("editGuestSuccess", "edit sucessful");
			}
			else {
				request.setAttribute("editGuestError", "Error in the edit guest");
			}
				
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return "guestMgmt";
	}
	
	//Remove guest
	@RequestMapping(value = "/removeGuest", method = RequestMethod.POST)
	public String processRemoveGuest(HttpServletRequest request, @ModelAttribute("guest") int guestId, Model model){
		try {
			boolean deleteSuccessful = guestDelegate.removeGuest(guestId);
			if(deleteSuccessful){
				System.out.println("Remove guest successful");
				request.setAttribute("removeGuestSuccess", "remove sucessful");
			}
			else {
				request.setAttribute("removeGuestError", "Error in the remove guest");
			}
				
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return "guestMgmt";
	}
	
	//Show guest details
	@RequestMapping(value = "/showGuest", method = RequestMethod.POST)
	public String showGuestDetails(HttpServletRequest request, @ModelAttribute("guest") Guest guest, Model model) {
		try {
			//get guestId from the form
			int guestId = Integer.valueOf(request.getParameter("selectedGuest"));
			
			//get guest object by guest id
			Guest selectedGuest = guestDelegate.getSelectedGuest(guestId);
			
			//add the selected guest to the request scope
			request.setAttribute("selectedGuest", selectedGuest);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return "guestMgmt";
	}
}
