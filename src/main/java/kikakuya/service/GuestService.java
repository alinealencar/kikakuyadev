package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;

public interface GuestService {
	public boolean addGuest(Guest guest) throws SQLException;
	public boolean deleteGuest(int guestId) throws SQLException;
	public boolean editGuestRsvpInfo(Guest guest) throws SQLException;
	public boolean editPlusOneInfo(GuestPlusOne plusOne) throws SQLException;
	public boolean editGuest(Guest guest) throws SQLException;
	public List<Guest> getAllGuests(Event event) throws SQLException;
	public Guest getGuestById(int guestId) throws SQLException;
	public List<GuestPlusOne> gelAllPlusOnes(Guest guest) throws SQLException;
}
