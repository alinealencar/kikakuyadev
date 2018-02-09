package kikakuya.delegate;

import java.sql.SQLException;
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
	
	public List<Event> listAllEvents()throws SQLException{
		return eventService.listAllEvents();
	}
	
	public boolean insertEvent(Event event, User user) throws SQLException{
		return eventService.insertEvent(event, user);
	}
	
	public boolean updateEvent(Event event)throws SQLException{
		return eventService.updateEvent(event);
	}
	
	public boolean deleteEvent(int eventId)throws SQLException{
		return eventService.deleteEvent(eventId);
	}
	
	public Event findEventById(int eventId){
		return null;
	}
	
}
