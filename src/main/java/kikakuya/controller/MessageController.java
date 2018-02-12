package kikakuya.controller;

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
		
		messageDelegate.sendBroadcast(email);
		request.setAttribute("sendBroadcastSuccess", "Success! Your message has been successfully delivered.");
		
		return redirectTo;
	}
}
