package kikakuya.controller;

import java.sql.SQLException;
import java.util.ArrayList;
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
import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.model.GuestPlusOneForm;
import kikakuya.utilities.HelperUtilities;

@Controller
public class GuestController {
	
	@Autowired
	private GuestDelegate guestDelegate;
	
	//Show guest dashboard
	@RequestMapping(value = "/guestsDash", method = RequestMethod.GET)
	public String viewGuestDashboard(Model model, HttpServletRequest request){
		int present = 0; 
		int absent = 2; 
		int noReply = 1;
		
		Event event = (Event) request.getSession().getAttribute("event");
		
		model.addAttribute("guest", new Guest());
		model.addAttribute("plusOnes", new GuestPlusOneForm());
		
		try {
			//get total guest count
			int guestCount = guestDelegate.countGuests(event);
			//get plus one count by category
			int plusOneAdultCount = guestDelegate.countPlusOnesByCategory(event, "Adult");
			int plusOneKidCount = guestDelegate.countPlusOnesByCategory(event, "Kid");
			//get guest count by rsvp status
			int presentCount = guestDelegate.countGuestsByStatus(event,present);
			int absentCount = guestDelegate.countGuestsByStatus(event,absent);
			int noReplyCount = guestDelegate.countGuestsByStatus(event,noReply);
			//total guests including plus ones
			int totalGuestCount = guestCount + plusOneAdultCount + plusOneKidCount;
			//total present guest count including plus ones
			int totalPresentCount = presentCount + plusOneAdultCount + plusOneKidCount;
			//total adults (all entered guests + adult plus ones)
			int totalAdultCount = totalPresentCount - plusOneKidCount;
			
			request.setAttribute("totalGuests", totalGuestCount);
			request.setAttribute("totalAdult", totalAdultCount);
			request.setAttribute("totalKid", plusOneKidCount);
			request.setAttribute("presentGuests", totalPresentCount);
			request.setAttribute("absentGuests", absentCount);
			request.setAttribute("noReplyGuests", noReplyCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "guests";
	}
	
	//Show guest management
	@RequestMapping(value = "/guestMgmt", method = RequestMethod.GET)
	public String viewGuest(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		Event event = (Event) request.getSession(false).getAttribute("event");
		//Get a list of all guests
		try {
			List<Guest> allGuests = guestDelegate.getAllGuests(event.getEventId());
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
			Event event = (Event) request.getSession(false).getAttribute("event");
			System.out.println("EVENT ID: " + event.getEventId());
			guest.setEventId(event.getEventId());
			boolean addSuccessful = guestDelegate.addGuest(guest);
			if(addSuccessful){
				System.out.println("Add guest successful");
				
				//Add success message to the request scope
				request.setAttribute("addGuestSuccess", "add sucessful");
				//Update guest list
				List<Guest> allGuests = guestDelegate.getAllGuests(event.getEventId());
				request.getSession().setAttribute("guests", allGuests);
			}
			else {
				request.setAttribute("addGuestError", "Error in the add guest");
			}
				
		} catch(Exception e){
			if(e.getMessage().indexOf("for key 'email'") != -1){
				request.setAttribute("addGuestError", "This guest is already registered.");
			}
			else {
				e.printStackTrace();
			}
		}
		
		return "guestMgmt";
	}
	
	//Edit guest
	@RequestMapping(value = "/editGuest", method = RequestMethod.POST)
	public String processEditGuest(HttpServletRequest request, @ModelAttribute("guest") Guest guest, Model model){
		try {
			boolean editGuestSuccessful = guestDelegate.editGuest(guest);
			if(editGuestSuccessful){
				System.out.println("Edit guest successful");
				request.setAttribute("editGuestSuccess", "edit sucessful");
			}
			else {
				System.out.println("Edit guest failed");
				request.setAttribute("editGuestError", "Error in the edit guest");
			}
				
		} catch(Exception e){
			e.printStackTrace();
		}
		
		viewGuest(request, model);
		return "guestMgmt";
	}
	
	//Edit plus ones
	@RequestMapping(value="/editPlusOnes", method = RequestMethod.POST)
	public String processEditPlusOnes(HttpServletRequest request, @ModelAttribute("guest") Guest guest, @ModelAttribute("plusOnesForm") GuestPlusOneForm plusOnesList, Model model) {
		List<GuestPlusOne> plusOnes = plusOnesList.getPlusOnes();
		
		for(GuestPlusOne plusOne : plusOnes){
			try {
				guestDelegate.editPlusOne(plusOne);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return "guestMgmt";
	}
	
	//Remove guest
	@RequestMapping(value = "/deleteGuest", method = RequestMethod.POST)
	public String processRemoveGuest(HttpServletRequest request, @ModelAttribute Guest guest, Model model){
		try {
			int guestId = Integer.parseInt((request.getParameter("token")));
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
		
		viewGuest(request, model);
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
			
			//get plus ones
			GuestPlusOneForm plusOnesList = new GuestPlusOneForm();
			plusOnesList.setPlusOnes(guestDelegate.getAllPlusOnes(selectedGuest));
			
			//get email with meal choices
			List<String> meals = guestDelegate.getMealOptions(selectedGuest.getEventId());
			
			//add the selected guest to the request scope
			request.setAttribute("selectedGuest", selectedGuest);
			request.setAttribute("plusOnesList", plusOnesList);
			request.setAttribute("meals", meals);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return "guestMgmt";
	}
}
