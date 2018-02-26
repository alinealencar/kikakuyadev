package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;

public interface EmailDao {

	public boolean insertEmail(Email email, Event event) throws SQLException;
	public Email findEmailByEvent(Guest guest) throws SQLException;
	public boolean countEmailByEvent(Event event) throws SQLException;
	
}
