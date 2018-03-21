package kikakuya.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import kikakuya.model.Event;
import kikakuya.model.User;

public interface EventService {
	
	public List<Event> listEventsByUser(User user) throws SQLException;
	public boolean insertEvent(Event event, User user) throws SQLException, ParseException;
	public boolean updateEvent(Event event) throws SQLException, ParseException;
	public boolean deleteEvent(Event event) throws SQLException;
	//public Event getEventById(int eventId) throws SQLException;
	//public Event findEventById(int eventId) throws SQLException;
	//public boolean editTotalBudget(int eventId, double totalBudget) throws SQLException;
	//public boolean deleteEvent(int eventId) throws SQLException;
	public Event getEventById(int eventId) throws SQLException;
	public Event findEventById(int eventId) throws SQLException;
	public boolean editTotalBudget(int eventId, double totalBudget) throws SQLException;
	public List<Event> findEventsByMonth(Calendar date, int userId) throws SQLException;
}
