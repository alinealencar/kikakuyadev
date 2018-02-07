package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;

import kikakuya.dao.GuestDao;
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

	public boolean deleteGuest(Guest guest) throws SQLException {
		return guestDao.deleteGuest(guest);
	}

	public boolean editGuest(Guest guest) throws SQLException {
		return guestDao.updateGuest(guest);
	}

	public List<Guest> getAllGuests() throws SQLException {
		return guestDao.findGuests();
	}

}
