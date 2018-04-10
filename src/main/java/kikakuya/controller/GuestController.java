package kikakuya.controller;

import java.sql.SQLException;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kikakuya.delegate.GuestDelegate;
import kikakuya.model.Appointment;
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
			
			//get present plus one count by category
			int presentPlusOneAdultCount = guestDelegate.countPlusOnesByCategory(event, "Adult", 0);
			int presentPlusOneKidCount = guestDelegate.countPlusOnesByCategory(event, "Kid", 0);
			
			//get absent plus one count by category
			int absentPlusOneAdultCount = guestDelegate.countPlusOnesByCategory(event, "Adult", 2);
			int absentPlusOneKidCount = guestDelegate.countPlusOnesByCategory(event, "Kid", 2);
			
			//get no reply plus one count by category
			int noReplyPlusOneAdultCount = guestDelegate.countPlusOnesByCategory(event, "Adult", 1);
			int noReplyPlusOneKidCount = guestDelegate.countPlusOnesByCategory(event, "Kid", 1);
			
			//get total plus one count
			int totalPlusOnes = guestDelegate.countPlusOnes(event);
			
			//get guest count by rsvp status
			int presentCount = guestDelegate.countGuestsByStatus(event,present);
			int absentCount = guestDelegate.countGuestsByStatus(event,absent);
			int noReplyCount = guestDelegate.countGuestsByStatus(event,noReply);
			
			//total guests including plus ones
			int totalGuestCount = guestCount + totalPlusOnes;
			
			//total present guest count including plus ones
			int totalPresentCount = presentCount + presentPlusOneAdultCount + presentPlusOneKidCount;
			
			//total absent guest count including plus ones
			int totalAbsentCount = absentCount + absentPlusOneAdultCount + absentPlusOneKidCount;
			
			//total no reply guest count including plus ones
			int totalNoReplyCount = noReplyCount + noReplyPlusOneAdultCount + noReplyPlusOneKidCount;
			
			//total adults (all entered guests + adult plus ones)
			int totalAdultCount = totalPresentCount - presentPlusOneKidCount;
			
			request.setAttribute("totalGuests", totalGuestCount);
			request.setAttribute("totalAdult", totalAdultCount);
			request.setAttribute("totalKid", presentPlusOneKidCount);
			request.setAttribute("presentGuests", totalPresentCount);
			request.setAttribute("absentGuests", totalAbsentCount);
			request.setAttribute("noReplyGuests", totalNoReplyCount);
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
			guest.setEventId(event.getEventId());
			boolean addSuccessful = guestDelegate.addGuest(guest);
			if(addSuccessful){				
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
	@ResponseBody
	public Guest processEditPlusOnes(@RequestParam(value="editName[]") String[] editName, @RequestParam(value="editId[]") String[] editId, 
			@RequestParam(value="editMeal[]") String[] editMeal, @RequestParam(value="addAdultName[]") String[] addAdultName, @RequestParam(value="addAdultMeal[]") String[] addAdultMeal,
			@RequestParam(value="addKidName[]") String[] addKidName, @RequestParam(value="addKidMeal[]") String[] addKidMeal,@RequestParam(value="guestId") int guestId) {

		Guest guest = null;
		try {
			//get Guest object
			guest = guestDelegate.getSelectedGuest(guestId);
			
			//Edit guests
			GuestPlusOne plusOne = new GuestPlusOne();
			int numToEdit = editId.length;
			System.out.println("number of plus ones to edit: " + editId.length);
			for(int i = 1; i < numToEdit; i++) {
				plusOne.setGuestPlusOneId(Integer.valueOf(editId[i]));
				plusOne.setFullName(editName[i]);
				plusOne.setMealChoice(editMeal[i]);
				guestDelegate.editPlusOne(plusOne);
			}
			
			//Add adults
			GuestPlusOne plusOneAdd = new GuestPlusOne();
			int numToAdd = addAdultName.length;
			for(int i = 1; i < numToAdd; i++){
				plusOneAdd.setFullName(addAdultName[i]);
				plusOneAdd.setMealChoice(addAdultMeal[i]);
				plusOneAdd.setCategory("Adult");
				guestDelegate.addPlusOne(plusOneAdd, guest);
				
				//add 1 to adultsWith
				guest.setAdultsWith(guest.getAdultsWith() + 1);
				//update adultsWith for the guest in the db
				guestDelegate.editGuestAdultsKidsWith(guest);
			}
			
			//Add kids
			plusOneAdd = new GuestPlusOne();
			numToAdd = addKidName.length;
			for(int i = 1; i < numToAdd; i++){
				plusOneAdd.setFullName(addKidName[i]);
				plusOneAdd.setMealChoice(addKidMeal[i]);
				plusOneAdd.setCategory("Kid");
				guestDelegate.addPlusOne(plusOneAdd, guest);
				
				//add 1 to kidsWith
				guest.setKidsWith(guest.getKidsWith() + 1);
				//update kidsWith for the guest in the db
				guestDelegate.editGuestAdultsKidsWith(guest);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guest;
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
	
	@RequestMapping(value="/getPlusOnes", method = RequestMethod.POST)
	@ResponseBody
	public GuestPlusOneForm getPlusOnes(@ModelAttribute("guestId") int guestId){
		GuestPlusOneForm plusOnesList = new GuestPlusOneForm();
		try {
			Guest guest = guestDelegate.getSelectedGuest(guestId);

			//get plus ones
			plusOnesList.setPlusOnes(guestDelegate.getAllPlusOnes(guest));
			plusOnesList.setGuest(guestDelegate.getSelectedGuest(guestId));
			plusOnesList.setMeals(guestDelegate.getMealOptions(guest.getEventId()));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return plusOnesList;
	}
	
	@RequestMapping(value="/deletePlusOne", method = RequestMethod.POST)
	@ResponseBody
	public Guest deletePlusOne(@RequestParam("plusOneId") int plusOneId){
		Guest guest = null;
		try {
			//get guest plus One
			GuestPlusOne plusOne = guestDelegate.getPlusOneById(plusOneId);
			//get guest
			guest = guestDelegate.getSelectedGuest(plusOne.getGuestGuestId());
			
			boolean deleteSuccessful = guestDelegate.removePlusOne(plusOneId);
			//if delete is successful, decrease either the adultsWith or kidsWith of the guest
			if(deleteSuccessful){
				if(plusOne.getCategory().equals("Adult"))
					guest.setAdultsWith(guest.getAdultsWith() - 1);
				else
					guest.setKidsWith(guest.getKidsWith() - 1);
				
				guestDelegate.editGuestAdultsKidsWith(guest);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guest;
	}
}
