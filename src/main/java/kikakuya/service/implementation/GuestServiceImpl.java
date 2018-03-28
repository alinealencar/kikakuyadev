package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;

import kikakuya.dao.GuestDao;
import kikakuya.dao.GuestPlusOneDao;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.service.GuestService;

public class GuestServiceImpl implements GuestService {
	private GuestDao guestDao;
	private GuestPlusOneDao plusOneDao;

	public GuestDao getGuestDao() {
		return guestDao;
	}

	public void setGuestDao(GuestDao guestDao) {
		this.guestDao = guestDao;
	}
	
	public GuestPlusOneDao getPlusOneDao() {
		return plusOneDao;
	}

	public void setPlusOneDao(GuestPlusOneDao plusOneDao) {
		this.plusOneDao = plusOneDao;
	}

	public boolean addGuest(Guest guest) throws SQLException {
		return guestDao.insertGuest(guest);
	}

	public boolean deleteGuest(int guestId) throws SQLException {
		return guestDao.deleteGuest(guestId);
	}

	public boolean editGuestRsvpInfo(Guest guest) throws SQLException {
		return guestDao.updateGuestRsvpInfo(guest);
	}

	public List<Guest> getAllGuests(Event event) throws SQLException {
		return guestDao.findGuests(event);
	}
	
	public Guest getGuestById(int guestId) throws SQLException {
		return guestDao.findGuestById(guestId);
	}

	@Override
	public boolean editGuest(Guest guest) throws SQLException {
		return guestDao.updateGuestInfo(guest);
	}

	@Override
	public boolean editPlusOneInfo(GuestPlusOne plusOne) throws SQLException {
		return plusOneDao.updatePlusOne(plusOne);
	}

	@Override
	public List<GuestPlusOne> gelAllPlusOnes(Guest guest) throws SQLException {
		return plusOneDao.findPlusOne(guest);
	}

	@Override
	public int countGuestsByStatus(Event event, int status) throws SQLException {
		return guestDao.countGuestsByStatus(event, status);
	}

	@Override
	public int countGuests(Event event) throws SQLException {
		return guestDao.countGuests(event);
	}

	@Override
	public int countPlusOnesByCategory(Event event, String category) throws SQLException {
		return plusOneDao.getPlusOnesTotalByCategory(event, category);
	}

	@Override
	public boolean addGuestPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException {
		return plusOneDao.insertPlusOne(plusOne, guest);
	}

	@Override
	public boolean deletePlusOne(int plusOneId) throws SQLException {
		return plusOneDao.deletePlusOne(plusOneId);
	}
}
