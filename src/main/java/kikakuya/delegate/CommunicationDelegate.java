package kikakuya.delegate;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.service.CommunicationService;

public class CommunicationDelegate {
	
	private CommunicationService communicationService;

	public CommunicationService getCommunicationService() {
		return communicationService;
	}

	public void setCommunicationService(CommunicationService communicationService) {
		this.communicationService = communicationService;
	}
	
	public void sendEmail(Guest guest, Email email) {
		communicationService.sendEmail(guest, email);
	}
	
}
