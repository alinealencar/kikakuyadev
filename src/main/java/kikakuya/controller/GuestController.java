package kikakuya.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.GuestDelegate;
import kikakuya.model.Guest;
import kikakuya.model.User;

@Controller
public class GuestController {
	
	@Autowired
	private GuestDelegate guestDelegate;
	
	//Add guest
	@RequestMapping(value = "/addGuest", method = RequestMethod.GET)
	public String viewGuest(Model model){
		model.addAttribute("guest", new Guest());
		return "guests";
	}

	@RequestMapping(value = "/addGuest", method = RequestMethod.POST)
	public String processAddGuest(@ModelAttribute("guest") User user, Model model){
		return "guests";
	}
	
	//Edit guest
	@RequestMapping(value = "/editGuest", method = RequestMethod.POST)
	public String processEditGuest(@ModelAttribute("guest") User user, Model model){
		return "guests";
	}
	
	//Remove guest
	@RequestMapping(value = "/removeGuest", method = RequestMethod.POST)
	public String processRemoveGuest(@ModelAttribute("guest") User user, Model model){
		return "guests";
	}
	
}
