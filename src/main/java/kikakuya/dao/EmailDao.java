package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.Email;
import kikakuya.model.Event;

public interface EmailDao {

	public boolean insertEmail(Email email, Event event) throws SQLException;
	public Email findEmailById(Event event) throws SQLException;
	public boolean findEmailByEvent(Event event) throws SQLException;
	
}
