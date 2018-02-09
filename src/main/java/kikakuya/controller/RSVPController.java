package kikakuya.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.MessageDelegate;
import kikakuya.delegate.RSVPDelegate;
import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;

public class RSVPController {
	//@Autowired
	private RSVPDelegate rsvpDelegate;

	/**
	* When the page is loaded, this method is run.
	* Create the kikakuya.model object (Vendor) and put it into the kikakuya.model map with the key "vendor".
	* @param kikakuya.model
	* @return
	*/
	@RequestMapping(method = RequestMethod.GET)
	public String viewSendMessage(Model model){
		model.addAttribute("Email", new Email());
		Email email = new Email();
		Guest guest = new Guest();
		User user = new User();
		String msg;
		rsvpDelegate.sendRSVP(guest, email, user);
		return ""; //fill this up once jsp is done
	}
}
