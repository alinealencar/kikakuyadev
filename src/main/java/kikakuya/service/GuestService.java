package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Guest;

public interface GuestService {
	public boolean addGuest(Guest guest) throws SQLException;
	public boolean deleteGuest(Guest guest) throws SQLException;
	public boolean editGuest(Guest guest) throws SQLException;
	public List<Guest> getAllGuests() throws SQLException;
}
