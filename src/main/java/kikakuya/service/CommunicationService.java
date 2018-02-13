package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.model.User;

public interface CommunicationService {
	public void sendBroadcast(Email email);
	public void sendRSVP(Email email, User user, Event event, List<Guest> guestList);
	public List<Guest> findGuests(Event event) throws SQLException;
	public boolean updateGuest(Guest guest) throws SQLException;
	public boolean insertEmail(Email email, Event event) throws SQLException;
	public Guest findGuestById(int guestId) throws SQLException;
	public Email findEmailById(Event event) throws SQLException;
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException;
	public boolean findEmailByEvent(Event event) throws SQLException;
	//public boolean updateEmailIdGuest(Guest guest) throws SQLException;
}
