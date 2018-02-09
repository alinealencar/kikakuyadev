package kikakuya.service.implementation;

import java.nio.charset.StandardCharsets;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.MimeMessageHelper;

import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;
import kikakuya.service.CommunicationService;

public class CommunicationServiceImpl implements CommunicationService{

	public Properties setProperties(){
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
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
	    
	    return props;
	}
	
	public void sendRSVP(Guest guest, Email email, User user)  {
		String subject = "Kikakuya - RSVP to <user>'s Event";
		String from = "kikakuyadev@gmail.com"; //add email address
		String[] to = {"mavillacete@gmail.com"};//add recipient
		String message = "<img src=\"cid:logo.png\" width=\"250px\" height=\"180px\"></img><br/>";
		message += "<h3>You are invited to Kie's Wedding!</h3>";
		message += "<h4>Location: <br> Date: </h4>";
		message += "<p>Please let us know if you are coming before <date>.</p><br><br>";
		message += "<form action = \"http://localhost:8081/dev/search\"><input type = \"submit\" value = \"Click here to RSVP\" /></form><br><br>";
		message += "<p>Sincerely,<br>Kie</p>";
		
		//email account information
		final String username = "kikakuyadev@gmail.com";
	    final String password = "TechGirls";

		try { 
			//create session instance
		     Session session = Session.getInstance(setProperties(),  new Authenticator(){
		    	 protected PasswordAuthentication getPasswordAuthentication() {
		    	 //check if email account and password combination is valid
		         return new PasswordAuthentication(username, password);}});
		     
		     MimeMessage msg = new MimeMessage(session);
		     MimeMessageHelper helper = new MimeMessageHelper(msg, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED, StandardCharsets.UTF_8.name());
		     
		     //set email content and information into the MimeMessageHelper
		     helper.setText(message, true); //true indicates that the text included is HTML
		     helper.addInline("logo.png",new ClassPathResource("yelp_logo.png"));
		     helper.setSubject(subject);
		     helper.setBcc(to);
		     helper.setFrom(from);
		     
		     //send the email
		     Transport.send(msg);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void sendMessage(Guest guest, Email email, User user)  {
		String subject = "Kikakuya - RSVP to <user>'s Event";
		String from = "kikakuyadev@gmail.com"; //add email address
		String[] to = {"mavillacete@gmail.com"};//add recipient
		
		//email account information
		final String username = "kikakuyadev@gmail.com";
	    final String password = "TechGirls";

		try { 
			//create session instance
		     Session session = Session.getInstance(setProperties(),  new Authenticator(){
		    	 protected PasswordAuthentication getPasswordAuthentication() {
		    	 //check if email account and password combination is valid
		         return new PasswordAuthentication(username, password);}});
		     
		     MimeMessage msg = new MimeMessage(session);
		     MimeMessageHelper helper = new MimeMessageHelper(msg, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED, StandardCharsets.UTF_8.name());
		     
		     //set email content and information into the MimeMessageHelper
		     helper.setText(email.getMessage(), true); //true indicates that the text included is HTML
		     helper.addInline("logo.png",new ClassPathResource("yelp_logo.png"));
		     helper.setSubject(subject);
		     helper.setBcc(to);
		     helper.setFrom(from);
		     
		     //send the email
		     Transport.send(msg);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
	
	

