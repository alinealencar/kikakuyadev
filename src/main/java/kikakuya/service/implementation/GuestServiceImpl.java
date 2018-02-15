package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;

import kikakuya.dao.GuestDao;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.service.GuestService;

public class GuestServiceImpl implements GuestService {
	private GuestDao guestDao;

	public GuestDao getGuestDao() {
		return guestDao;
	}

	public void setGuestDao(GuestDao guestDao) {
		this.guestDao = guestDao;
	}

	public boolean addGuest(Guest guest) throws SQLException {
		return guestDao.insertGuest(guest);
	}

	public boolean deleteGuest(int guestId) throws SQLException {
		return guestDao.deleteGuest(guestId);
	}

	public boolean editGuest(Guest guest) throws SQLException {
		return guestDao.updateGuestRsvpInfo(guest);
	}

	public List<Guest> getAllGuests(Event event) throws SQLException {
		return guestDao.findGuests(event);
	}
	
	public Guest getGuestById(int guestId) throws SQLException {
		return guestDao.findGuestById(guestId);
	}
}
