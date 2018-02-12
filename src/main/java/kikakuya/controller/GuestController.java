package kikakuya.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.GuestDelegate;
import kikakuya.model.Guest;

@Controller
public class GuestController {
	
	@Autowired
	private GuestDelegate guestDelegate;
	
	@RequestMapping(value = "/guests", method = RequestMethod.GET)
	public String viewGuest1(Model model){
		model.addAttribute("guest", new Guest());
		return "guests";
	}
	
	//Add guest
	@RequestMapping(value = "/addGuest", method = RequestMethod.GET)
	public String viewGuest(Model model){
		model.addAttribute("guest", new Guest());
		return "guests";
	}

	@RequestMapping(value = "/addGuest", method = RequestMethod.POST)
	public String processAddGuest(HttpServletRequest request, @ModelAttribute("guest") Guest guest, Model model){
		try {
			boolean addSuccessful = guestDelegate.addGuest(guest);
			if(addSuccessful){
				System.out.println("Add guest successful");
				request.setAttribute("addGuestSuccess", "add sucessful");
			}
			else {
				request.setAttribute("addGuestError", "Error in the add guest");
			}
				
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return "guests";
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
		
		return "guests";
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
		
		return "guests";
	}
}
