package kikakuya.service.implementation;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.api.client.util.Base64;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.service.CommunicationService;

public class CommunicationServiceImpl implements CommunicationService{

	public void sendEmail(Guest guest, Email email) {
		String subject = "Kikakuya RSVP";
		String from = "kikakuyadev@gmail.com"; //add email address
		String to = "mavillacete@gmail.com"; //add recipient
		String message = "test";
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

		try { 
			Properties props = System.getProperties();
		     props.setProperty("mail.smtp.host", "smtp.gmail.com");
		     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		     props.setProperty("mail.smtp.socketFactory.fallback", "false");
		     props.setProperty("mail.smtp.port", "465");
		     props.setProperty("mail.smtp.socketFactory.port", "465");
		     props.put("mail.smtp.auth", "true");
		     props.put("mail.debug", "true");
		     props.put("mail.store.protocol", "pop3");
		     props.put("mail.transport.protocol", "smtp");
		     final String username = "kikakuyadev@gmail.com";//
		     final String password = "TechGirls";
		     
		     Session session = Session.getInstance(props,  new Authenticator(){
		    	 protected PasswordAuthentication getPasswordAuthentication() {
		         return new PasswordAuthentication(username, password);}});
		     
		     Message msg = new MimeMessage(session);

		     msg.setFrom(new InternetAddress(from));
		     msg.setRecipients(Message.RecipientType.TO,  InternetAddress.parse(to,false));
		     msg.setSubject(subject);
		     msg.setText(message);
		     msg.setText("http://localhost:8080/dev/search");
		     Transport.send(msg);
		     System.out.println("Message sent.");
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
}
	
	

