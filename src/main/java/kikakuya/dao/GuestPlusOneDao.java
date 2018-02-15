package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;

public interface GuestPlusOneDao {
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException;
	public boolean updatePlusOne(GuestPlusOne plusOne) throws SQLException;
	public List<GuestPlusOne> findPlusOne(Guest guest) throws SQLException;
}
