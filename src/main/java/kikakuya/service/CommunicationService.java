package kikakuya.service;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;

public interface CommunicationService {
	//public void sendRSVP(Guest guest, Email email, User user);
	public void sendMessage(Guest guest, Email email, User user);
	public void sendRSVP(Email email);
}
