package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Guest;

public interface GuestDao {
	public List<Guest> findGuests(Event event) throws SQLException;
	public boolean insertGuest(Guest guest) throws SQLException;
	public boolean updateGuest(Guest guest) throws SQLException;
	public boolean deleteGuest(int guestId) throws SQLException;
	public Guest findGuestById(int guestId) throws SQLException;
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException;
	public List<Guest> findGuestNoReply(int eventId) throws SQLException;
}
