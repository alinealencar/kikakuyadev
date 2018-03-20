package kikakuya.service.implementation;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import kikakuya.dao.EventDao;
import kikakuya.model.Event;
import kikakuya.model.User;
import kikakuya.service.EventService;

public class EventServiceImpl implements EventService{

	private EventDao eventDao;

	public EventServiceImpl() {
		
	}

	public EventDao getEventDao() {
		return eventDao;
	}

	public void setEventDao(EventDao eventDao){
		this.eventDao = eventDao;
	}

	
	public List<Event> listEventsByUser(User user) throws SQLException {
		return eventDao.listEventsByUser(user);
	}

	public boolean insertEvent(Event event, User user) throws SQLException, ParseException{
		return eventDao.insertEvent(event, user);
		
	}

	public boolean updateEvent(Event event) throws SQLException, ParseException{
		return eventDao.updateEvent(event);
	}

	public boolean deleteEvent(Event event) throws SQLException {
		return eventDao.deleteEvent(event);
		
	}
	
	public Event findEventById(int eventId) throws SQLException {
		return eventDao.findEventById(eventId);
	}
	
	public Event getEventById(int eventId) throws SQLException{
		return eventDao.findEventById(eventId);
	}
	
	@Override
	public boolean editTotalBudget(int eventId, double totalBudget) throws SQLException {
		return eventDao.updateTotalBudget(eventId, totalBudget);
	}

	@Override
	public List<Event> findEventsByMonth(Calendar date, int userId) throws SQLException {
		return eventDao.findEventsByMonth(date, userId);
	}
}
