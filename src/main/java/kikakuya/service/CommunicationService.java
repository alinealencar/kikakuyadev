package kikakuya.service;

import kikakuya.model.Email;
import kikakuya.model.Guest;

public interface CommunicationService {
	//public void sendEmail();
	public void sendEmail(Guest guest, Email email);
	//public MimeMessage createEmail(String to, String from,  String subject,String bodyText) throws MessagingException;
	// public Message createMessageWithEmail(MimeMessage emailContent) throws MessagingException, IOException;
	// public Message sendMessage(Gmail service, String userId, MimeMessage emailContent) throws MessagingException, IOException;
}
