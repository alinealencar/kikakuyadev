package kikakuya.delegate;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import kikakuya.service.EventService;
import kikakuya.model.*;

public class EventDelegate {
	private EventService eventService;

	public EventService geteventService() {
		return eventService;
	}

	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
	
	public List<Event> listEventsByUser(User user)throws SQLException{
		return eventService.listEventsByUser(user);
	}
	
	public boolean insertEvent(Event event, User user) throws SQLException, ParseException{
		return eventService.insertEvent(event, user);
	}
	
	public boolean updateEvent(Event event)throws SQLException, ParseException{
		return eventService.updateEvent(event);
	}
	
	public boolean deleteEvent(Event event)throws SQLException{
		return eventService.deleteEvent(event);
	}
	
//	public boolean findEventById(int eventId) throws SQLException{
//		return eventService.findEventById(eventId);
//	}
	
	public Event getSelectedEvent(int eventId) throws SQLException{
		return eventService.getEventById(eventId);
	}
}
