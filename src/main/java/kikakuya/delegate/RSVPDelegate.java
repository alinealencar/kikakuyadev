package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;

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
	
	/*public void sendRSVP(Guest guest, Email email, User user){
		communicationService.sendRSVP(guest, email, user);
	}*/
	
	public void sendRSVP(Email email, int userId, List<Guest> guestList){
		communicationService.sendRSVP(email, userId, guestList);
	}

	public List<Guest> findGuests() throws SQLException {
		return communicationService.findGuests();
	}

	public boolean insertEmail(Email email) throws SQLException {
		return communicationService.insertEmail(email);
	}

	public Guest findGuestById(int guestId) throws SQLException {
		return communicationService.findGuestById(guestId);
	}

	public Email findEmailById() throws SQLException {
		return communicationService.findEmailById();
	}	
}
