package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;

public interface GuestPlusOneDao {

	public List<GuestPlusOne> listPlusOne() throws SQLException;
	public boolean insertPlusOne(GuestPlusOne guestPlusOne) throws SQLException;
}
