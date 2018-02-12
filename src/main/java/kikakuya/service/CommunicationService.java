package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;

public interface CommunicationService {
	public void sendBroadcast(Email email);
	public void sendRSVP(Email email, int userId, List<Guest> guestList);
	public List<Guest> findGuests() throws SQLException;
	public boolean updateGuest(Guest guest) throws SQLException;
	public boolean insertEmail(Email email) throws SQLException;
	public Guest findGuestById(int guestId) throws SQLException;
	public Email findEmailById() throws SQLException;
	//public boolean updateEmailIdGuest(Guest guest) throws SQLException;
}
