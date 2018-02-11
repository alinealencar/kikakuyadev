package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.Email;

public interface EmailDao {

	public boolean insertEmail(Email email) throws SQLException;
	public Email findEmailById() throws SQLException;
	
}
