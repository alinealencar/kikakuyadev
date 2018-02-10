package kikakuya.delegate;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;
import kikakuya.service.CommunicationService;

public class MessageDelegate {
	
	private CommunicationService communicationService;

	public CommunicationService getCommunicationService() {
		return communicationService;
	}

	public void setCommunicationService(CommunicationService communicationService) {
		this.communicationService = communicationService;
	}
	
	/*public void sendBroadcast(Guest guest, Email email, User user){
		communicationService.sendBroadcast(guest, email, user);
	}*/
	
	public void sendBroadcast(Email email){
		communicationService.sendBroadcast(email);
	}
}
