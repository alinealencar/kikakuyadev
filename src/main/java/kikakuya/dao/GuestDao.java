package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Guest;

public interface GuestDao {
	public List<Guest> findGuests(Event event) throws SQLException;
	public boolean insertGuest(Guest guest) throws SQLException;
	public boolean updateGuestRsvpInfo(Guest guest) throws SQLException;
	public boolean updateGuestInfo(Guest guest) throws SQLException;
	public boolean updateGuestAdultsKidsWith(Guest guest) throws SQLException;
	public boolean deleteGuest(int guestId) throws SQLException;
	public Guest findGuestById(int guestId) throws SQLException;
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException;
	public Guest findGuestByToken(String token) throws SQLException;
	public boolean deleteGuestToken(Guest guest) throws SQLException;
	public boolean isTokenFound(String token) throws SQLException;
	public int countGuests(Event event) throws SQLException;
	public int countGuestsByStatus(Event event, int status) throws SQLException;
}
