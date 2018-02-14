package kikakuya.delegate;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
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
	
	public void sendBroadcast(Email email, List<Guest> guestList){
		communicationService.sendBroadcast(email, guestList);
	}
	
	public List<Guest> findGuests(Event event) throws SQLException {
		return communicationService.findGuests(event);
	}
	
	public Guest findGuestById(int guestId) throws SQLException {
		return communicationService.findGuestById(guestId);
	}

	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException {
		return communicationService.findGuestByStatus(status, eventId);
	}

	public List<Guest> findGuestNoReply(int eventId) throws SQLException {
		return communicationService.findGuestNoReply(eventId);
	}
	
	
	
}
