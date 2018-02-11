package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;

public interface CommunicationService {
	//public void sendRSVP(Guest guest, Email email, User user);
	//public void sendMessage(Guest guest, Email email, User user);
	public void sendBroadcast(Email email);
	public void sendRSVP(Email email, List<Guest> guestList);
	public List<Guest> findGuests() throws SQLException;
	public boolean insertEmail(Email email) throws SQLException;
}
