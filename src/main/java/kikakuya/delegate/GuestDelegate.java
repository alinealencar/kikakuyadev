package kikakuya.delegate;

import java.sql.SQLException;

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
}
