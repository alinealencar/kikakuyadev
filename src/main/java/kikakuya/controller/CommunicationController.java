package kikakuya.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.CommunicationDelegate;
import kikakuya.model.Email;
import kikakuya.model.Guest;

@Controller
@RequestMapping(value="/send")
public class CommunicationController {

	//@Autowired
	private CommunicationDelegate communicationDelegate;

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
		communicationDelegate.sendEmail(guest, email);
		return ""; //fill this up once jsp is done
	}
}
