package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kikakuya.dao.EventDao;
import kikakuya.dao.implementation.EventDaoImpl;
import kikakuya.model.Event;
import kikakuya.model.User;
import kikakuya.service.EventService;

//@Service
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
	
	public List<Event> listAllEvents() throws SQLException {
		return eventDao.listAllEvents();
	}

	public boolean insertEvent(Event event) throws SQLException{
		return eventDao.insertEvent(event);
		
	}

	public boolean updateEvent(Event event) throws SQLException{
		return eventDao.updateEvent(event);
		
	}

	public boolean deleteEvent(int eventId) throws SQLException {
		//eventDao.deleteEvent(eventId);
		return eventDao.deleteEvent(eventId);
		
	}

	public Event findEventById(int eventId) throws SQLException {
		return eventDao.findEventById(eventId);
	}

	public boolean updateEvent(int eventId) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}