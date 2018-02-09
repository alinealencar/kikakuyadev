package kikakuya.delegate;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;
import kikakuya.service.CommunicationService;

public class RSVPDelegate {

	private CommunicationService communicationService;

	public CommunicationService getCommunicationService() {
		return communicationService;
	}

	public void setCommunicationService(CommunicationService communicationService) {
		this.communicationService = communicationService;
	}
	
	public void sendRSVP(Guest guest, Email email, User user){
		communicationService.sendRSVP(guest, email, user);
	}
}
