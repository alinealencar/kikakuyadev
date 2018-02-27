package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.model.User;
import kikakuya.model.Vendor;

public interface CommunicationService {
	public void sendBroadcast(Email email, List<Guest> guestList);
	public void sendRSVP(Email email, User user, Event event, List<Guest> guestList);
	public List<Guest> findGuests(Event event) throws SQLException;
	public boolean updateGuest(Guest guest) throws SQLException;
	public boolean insertEmail(Email email, Event event) throws SQLException;
	public Guest findGuestById(int guestId) throws SQLException;
	public Guest findGuestByToken(String token) throws SQLException;
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException;
	public Email findEmailByEvent(Guest guest) throws SQLException;
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException;
	public boolean countEmailByEvent(Event event) throws SQLException;
	public boolean deleteGuestToken(Guest guest) throws SQLException;
	public boolean isTokenFound(String token) throws SQLException;
	
}
