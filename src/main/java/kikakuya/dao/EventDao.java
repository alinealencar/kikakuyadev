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
<<<<<<< HEAD
=======
	public boolean updateTotalBudget(int eventId, double totalBudget) throws SQLException;
>>>>>>> c31186b4dc0703d017253f42b2ab33fe9801ce4c
}
