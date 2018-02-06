package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Guest;

public interface GuestDao {
	public List<Guest> findGuests() throws SQLException;
	public boolean insertGuest(Guest guest) throws SQLException;
	public boolean updateGuest(Guest guest) throws SQLException;
	public boolean deleteGuest(Guest guest) throws SQLException;
}
