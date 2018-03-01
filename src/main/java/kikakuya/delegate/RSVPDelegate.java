package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
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
	
	public void sendRSVP(Email email, User user, Event event, List<Guest> guestList){
		communicationService.sendRSVP(email, user, event, guestList);
	}

	public List<Guest> findGuests(Event event) throws SQLException {
		return communicationService.findGuests(event);
	}

	public boolean insertEmail(Email email, Event event) throws SQLException {
		return communicationService.insertEmail(email, event);
	}

	public Guest findGuestById(int guestId) throws SQLException {
		return communicationService.findGuestById(guestId);
	}
	
	
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException {
		return communicationService.findGuestByStatus(status, eventId);
	}

	public Guest findGuestByToken(String token) throws SQLException {
		return communicationService.findGuestByToken(token);
	}

	public Email findEmailByEvent(Guest guest) throws SQLException {
		return communicationService.findEmailByEvent(guest);
	}

	
	public boolean countEmailByEvent(Event event) throws SQLException {
		return communicationService.countEmailByEvent(event);
	}

	public boolean updateGuest(Guest guest) throws SQLException {
		return communicationService.updateGuest(guest);
	}

	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException {
		return communicationService.insertPlusOne(plusOne, guest);
	}

	public boolean isTokenFound(String token) throws SQLException{
		return communicationService.isTokenFound(token);
	}
	
	public boolean deleteGuestToken(Guest guest) throws SQLException {
		return communicationService.deleteGuestToken(guest);
	}	
	
	
	
}
