package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.service.GuestService;

public class GuestDelegate {
	private GuestService guestService;

	public GuestService getGuestService() {
		return guestService;
	}

	public void setGuestService(GuestService guestService) {
		this.guestService = guestService;
	}
	
	public boolean addGuest(Guest guest) throws SQLException {
		return guestService.addGuest(guest);
	}
	
	public boolean editGuest(Guest guest) throws SQLException {
		return guestService.editGuest(guest);
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
}
