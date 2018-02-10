package kikakuya.service.implementation;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.MimeMessageHelper;

import kikakuya.dao.GuestDao;
import kikakuya.model.Email;
import kikakuya.model.Guest;
import kikakuya.model.User;
import kikakuya.service.CommunicationService;

public class CommunicationServiceImpl implements CommunicationService{

	private GuestDao guestDao;
	
	public GuestDao getGuestDao() {
		return guestDao;
	}

	public void setGuestDao(GuestDao guestDao) {
		this.guestDao = guestDao;
	}

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
	
	public void sendRSVP(Email email)  {
		String subject = "Kikakuya - RSVP to <user>'s Event";
		String from = "kikakuyadev@gmail.com"; //add email address
		String[] to = {"mavillacete@gmail.com"};//add recipient
		String message = "";
		List<Guest> guestList = new ArrayList<Guest>();
		
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
		     
		     //get all guests
		     guestList = guestDao.findGuests();
		     
		     //iterate through all the guests
		     for(int i=0; i<guestList.size(); i++){
		    	 //body of the email
		    	message += "<div style=\"background-color: #F1E9DA; width: 50%; margin: 0 auto;\">";
		    	message += "<div style=\"background-color: #541388; padding: 15px;";
		   		message += "<img src=\"cid:logo.png\" width=\"250px\" height=\"180px\"></img></div>";
		   		message += "<div style=\"min-height: 300px; height: auto; height: 300px; background-color: #F1E9DA; padding: 15px;\">";
		   		message += "<h3>You are invited to Kie's Wedding!</h3>";
		   		message += "<h4>Location: <br> Date: </h4>";
		   		message += "<p>Please let us know if you are coming before " + email.getReplyDue() + ".</p><br><br>";
		   		message += "<form action = \"http://localhost:8080/dev/rsvpResponse?guestId="+guestList.get(i).getGuestId()+"\"><input type = \"submit\" value = \"Click here to RSVP\" /></form><br><br>";
		   		message += "<p>Sincerely,<br>Kie</p></div>";
		   		message += "<div style=\"background-color: #541388; color: #F1E9DA; padding: 15px;\"><br>";
			    message += "</h4>&copy; KIKAKUYA - 2018 All Rights Reserved.<br>";
			    message += "Do you want to plan an event? <a href=\"localhost:8080/dev\" style=\"text-decoration: underline; color: #F1E9DA;\">Try Kikakuya!</a></h4></div></div>";
		   		
		   		//set email content and information into the MimeMessageHelper
		   		helper.setText(message, true); //true indicates that the text included is HTML
		   		helper.addInline("logo.png",new ClassPathResource("logo.png"));
		   		helper.setSubject(subject);
		   		helper.setTo(guestList.get(i).getEmail());
		   		helper.setFrom(from);
		     
		   		//send the email
		   		Transport.send(msg);
		     }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sendBroadcast(Email email)  {
		//String subject = "Kikakuya - Event Announcement";
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
		     
		     String message = "<div style=\"background-color: #F1E9DA; width: 50%; margin: 0 auto;\">"
		     		+ "<div style=\"background-color: #541388; padding: 15px;\"><br><img src=\"cid:logo.png\"></img></div>"
		     		+"<div style=\"min-height: 300px; height: auto; height: 300px; padding: 15px;\"><h4>"+email.getMessage()+"</h4></div>"
		     		+ "<div style=\"background-color: #541388; color: #F1E9DA; padding: 15px;\">"
		     		+ "</h4>&copy; KIKAKUYA - 2018 All Rights Reserved.<br>"
		     		+ "Do you want to plan an event? <a href=\"http://localhost:8080/dev\" style=\"text-decoration: underline; color: #F1E9DA;\">Try Kikakuya!</a><br></h4></div></div>";
		     
		     //iterate through all the selected guests
		     //for(int i=0; i<guestList.size(); i++){
		    	 //set email content and information into the MimeMessageHelper
		    	 helper.setText(message, true); //true indicates that the text included is HTML
		    	 helper.addInline("logo.png",new ClassPathResource("logo.png"));
		    	 helper.setSubject(email.getTitle());
		    	 helper.setBcc(to);
		    	 helper.setFrom(from);
		     
		     //send the email
		     Transport.send(msg);
		     //}
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
	
	

