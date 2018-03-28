package kikakuya.delegate;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.service.CommunicationService;
import kikakuya.service.GuestService;

public class GuestDelegate {
	private GuestService guestService;
	private CommunicationService commService;

	public GuestService getGuestService() {
		return guestService;
	}

	public void setGuestService(GuestService guestService) {
		this.guestService = guestService;
	}
	
	public CommunicationService getCommService() {
		return commService;
	}

	public void setCommService(CommunicationService commService) {
		this.commService = commService;
	}

	public boolean addGuest(Guest guest) throws SQLException {
		return guestService.addGuest(guest);
	}
	
	public boolean editGuestRsvpInfo(Guest guest) throws SQLException {
		return guestService.editGuestRsvpInfo(guest);
	}
	
	public boolean removeGuest(int guestId) throws SQLException {
		return guestService.deleteGuest(guestId);
	}
	
	public List<Guest> getAllGuests(int eventId) throws SQLException {
		Event event = new Event();
		event.setEventId(eventId);
		return guestService.getAllGuests(event);
	}
	
	public Guest getSelectedGuest(int guestId) throws SQLException {
		return guestService.getGuestById(guestId);
	}
	
	public boolean editGuest(Guest guest) throws SQLException {
		return guestService.editGuest(guest);
	}
	
	public boolean editPlusOne(GuestPlusOne plusOne) throws SQLException {
		return guestService.editPlusOneInfo(plusOne);
	}
	
	public List<GuestPlusOne> getAllPlusOnes(Guest guest) throws SQLException {
		return guestService.gelAllPlusOnes(guest);
	}
	
	public List<String> getMealOptions(int eventId) throws SQLException {
		Guest guest = new Guest();
		guest.setEventId(eventId);
		Email email = commService.findEmailByEvent(guest);
		
		List<String> meals = new ArrayList();
		if(email.getMealChoiceBeef() != null)
			meals.add("Beef");
		if(email.getMealChoiceChicken() != null)
			meals.add("Chicken");
		if(email.getMealChoiceFish() != null)
			meals.add("Fish");
		if(email.getMealChoiceKids() != null)
			meals.add("Kids");
		if(email.getMealChoicePork() != null)
			meals.add("Pork");
		if(email.getMealChoiceVeg() != null)
			meals.add("Vegetarian");
		
		return meals;
	}
	
	public int countGuestsByStatus(Event event, int status) throws SQLException{
		return guestService.countGuestsByStatus(event, status);
	}
	
	public int countGuests(Event event) throws SQLException{
		return guestService.countGuests(event);
	}
	
	public int countPlusOnesByCategory(Event event, String category) throws SQLException{
		return guestService.countPlusOnesByCategory(event, category);
	}
	
	public boolean addPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException{
		return guestService.addGuestPlusOne(plusOne, guest);
	}
	
	public boolean removePlusOne(int plusOneId) throws SQLException {
		return guestService.deletePlusOne(plusOneId);
	}
}
