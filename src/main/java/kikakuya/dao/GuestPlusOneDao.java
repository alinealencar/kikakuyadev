package kikakuya.dao;

import java.sql.SQLException;
import kikakuya.model.Guest;

public interface GuestPlusOneDao {

	public boolean insertPlusOne(Guest guest) throws SQLException;
}
