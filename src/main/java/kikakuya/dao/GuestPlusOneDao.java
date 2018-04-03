package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;

public interface GuestPlusOneDao {
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException;
	public boolean updatePlusOne(GuestPlusOne plusOne) throws SQLException;
	public boolean deletePlusOne(int plusOneId) throws SQLException;
	public List<GuestPlusOne> findPlusOne(Guest guest) throws SQLException;
	public int getPlusOnesTotalByCategory(Event event, String category, int isPresent) throws SQLException;
	public int getPlusOnesTotal(Event event) throws SQLException;
}
