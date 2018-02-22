package kikakuya.service.implementation;

import java.sql.SQLException;
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

	public boolean insertEvent(Event event, User user) throws SQLException{
		return eventDao.insertEvent(event, user);
		
	}

	public boolean updateEvent(Event event) throws SQLException{
		return eventDao.updateEvent(event);
	}

	public boolean deleteEvent(Event event) throws SQLException {
		return eventDao.deleteEvent(event);
		
	}
	
	public Event findEventById(int eventId) throws SQLException {
		return eventDao.findEventById(eventId);
	}
<<<<<<< HEAD
	
	public Event getEventById(int eventId) throws SQLException{
		return eventDao.findEventById(eventId);
	}

=======

	public Event getEventById(int eventId) throws SQLException{
		return eventDao.findEventById(eventId);
	}
>>>>>>> f192d4839712f206b108092dc0ab9ee83e7ec515

	@Override
	public boolean editTotalBudget(int eventId, double totalBudget) throws SQLException {
		return eventDao.updateTotalBudget(eventId, totalBudget);
	}
}
