package kikakuya.dao;

import java.sql.SQLException;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;

public interface GuestPlusOneDao {

	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException;
}
