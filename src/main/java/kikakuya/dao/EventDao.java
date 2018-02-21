package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.User;

public interface EventDao {

	public List<Event> listEventsByUser(User user) throws SQLException;
	public boolean insertEvent(Event event, User user) throws SQLException;
	public boolean updateEvent(Event event) throws SQLException;
	public boolean deleteEvent(int eventId) throws SQLException;
	public Event findEventById(int eventId) throws SQLException;
	public boolean updateTotalBudget(int eventId, double totalBudget) throws SQLException;
}
