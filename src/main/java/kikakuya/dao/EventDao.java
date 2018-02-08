package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;

public interface EventDao {

	public List<Event> listAllEvents() throws SQLException;
	public boolean insertEvent(Event event) throws SQLException;
	public boolean updateEvent(Event event) throws SQLException;
	public boolean deleteEvent(int eventId) throws SQLException;
	public Event findEventById(int eventId) throws SQLException;

}
