package kikakuya.service.implementation;

import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
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

import kikakuya.dao.EmailDao;
import kikakuya.dao.GuestDao;
import kikakuya.dao.GuestPlusOneDao;
import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.model.User;
import kikakuya.model.Vendor;
import kikakuya.service.CommunicationService;

public class CommunicationServiceImpl implements CommunicationService{

	private GuestDao guestDao;
	private GuestPlusOneDao guestPlusOneDao;
	private EmailDao emailDao;
	
	public EmailDao getEmailDao() {
		return emailDao;
	}

	public void setEmailDao(EmailDao emailDao) {
		this.emailDao = emailDao;
	}

	public GuestDao getGuestDao() {
		return guestDao;
	}

	public void setGuestDao(GuestDao guestDao) {
		this.guestDao = guestDao;
	}
	
	public GuestPlusOneDao getGuestPlusOneDao() {
		return guestPlusOneDao;
	}

	public void setGuestPlusOneDao(GuestPlusOneDao guestPlusOneDao) {
		this.guestPlusOneDao = guestPlusOneDao;
	}

	public List<Guest> findGuests(Event event) throws SQLException {
		return guestDao.findGuests(event);
	}
	
	public Guest findGuestById(int guestId) throws SQLException {
		return guestDao.findGuestById(guestId);
	}
	
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException {
		return guestDao.findGuestByStatus(status, eventId);
	}
	
	public Guest findGuestByToken(String token) throws SQLException {
		return guestDao.findGuestByToken(token);
	}
	
	public boolean insertEmail(Email email, Event event) throws SQLException {
		return emailDao.insertEmail(email, event);
	}
	
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException {
		return guestPlusOneDao.insertPlusOne(plusOne, guest);
	}
	
	public boolean isTokenFound(String token) throws SQLException{
		return guestDao.isTokenFound(token);
	}
	
	public Email findEmailByEvent(Guest guest) throws SQLException {
		return emailDao.findEmailByEvent(guest);
	}
	
	public boolean countEmailByEvent(Event event) throws SQLException {
		return emailDao.countEmailByEvent(event);
	}
	
	public boolean updateGuest(Guest guest) throws SQLException {
		return guestDao.updateGuestRsvpInfo(guest);
	}
	
	public boolean deleteGuestToken(Guest guest) throws SQLException{
		return guestDao.deleteGuestToken(guest);
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
	
	public void sendRSVP(Email email, User user, Event event, List<Guest> guestList)  {
		String subject = "Kikakuya - RSVP to " + user.getUserName() + "'s Event";
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
		     
		     //iterate through all the guests
		     for(int i=0; i<guestList.size(); i++){
		    	 MimeMessage msg = new MimeMessage(session);
			     MimeMessageHelper helper = new MimeMessageHelper(msg, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED, StandardCharsets.UTF_8.name());
		    	 //body of the email
		    	 String message = "<div style=\"width: 75%; margin: 0 auto;\">"
			    	+ "<div style=\"background-color: #541388; padding: 15px;\">"
			   		+ "<img src=\"cid:logo.png\"></img></div>"
			   		+ "<div style=\"min-height: 300px; height: auto !important; height: 300px; padding: 15px;\">"
			   		+ "<h3>Hello " + guestList.get(i).getFirstName() + ",</h3>"
			   		+ "<p style=\"font-size: 120%; color: #2E294E;\">You are invited to " + event.getEventName() +"!</p>"
			   		+ "<p style=\"font-size: 120%; color: #2E294E;\">Location: " + event.getLocation() + "<br> Date: " + event.getEventDate() + "</p>"
			   		+ "<p style=\"font-size: 120%; color: #2E294E;\">Please let us know if you are coming before " + email.getReplyDue() + ".</p><br>"
			   		+"<a style=\"display: block; width: 20%; height: 20%; background: #D90368; color:#F1E9DA; padding: 10px; text-align: center; border-radius: 5px; text-decoration: none;\" href=\"http://localhost:8080/dev/rsvpResponse?token="+guestList.get(i).getToken()+"\">Click here to RSVP</a>"
			   		+ "<p style=\"font-size: 120%; color: #2E294E;\">Sincerely,<br>" + user.getUserName() +"</p></div>"
			   		+ "<div style=\"background-color: #d9dbdd; padding: 15px;\">"
				    + "</h4>&copy; KIKAKUYA - 2018 All Rights Reserved.<br>"
				    + "Do you want to plan an event? <a href=\"http://localhost:8080/dev\">Try Kikakuya!</a></h4></div></div>";
				    
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
	
	public void sendBroadcast(Email email, List<Guest> guestList)  {
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
		     
		     String message = "<div style=\"width: 75%; margin: 0 auto;\">"
			     		+ "<div style=\"background-color: #541388; padding: 15px;\"><img src=\"cid:logo.png\"></img></div>"
			     		+"<div style=\"min-height: 300px; height: auto !important; height: 300px; padding: 15px;\"><pre><font face=\"verdana\" size=\"2\">"+email.getMessage()+"</font></pre></div>"
			     		+ "<div style=\"background-color: #d9dbdd; padding: 15px;\">"
			     		+ "</h4>&copy; KIKAKUYA - 2018 All Rights Reserved.<br>"
			     		+ "Do you want to plan an event? <a href=\"http://localhost:8080/dev\">Try Kikakuya!</a><br></h4></div></div>";
		     
		     //iterate through all the selected guests
		     for(int i=0; i<guestList.size(); i++){
		    	 MimeMessage msg = new MimeMessage(session);
			     MimeMessageHelper helper = new MimeMessageHelper(msg, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED, StandardCharsets.UTF_8.name());
		    	 //set email content and information into the MimeMessageHelper
		    	 helper.setText(message, true); //true indicates that the text included is HTML
		    	 helper.addInline("logo.png",new ClassPathResource("logo.png"));
		    	 helper.setSubject(email.getTitle());
		    	 helper.setTo(guestList.get(i).getEmail());
		    	 helper.setFrom(from);
		     
		     //send the email
		     Transport.send(msg);
		   }
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}