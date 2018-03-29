package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;
import java.sql.Connection;

import kikakuya.dao.EventDao;
import kikakuya.model.Event;
import kikakuya.model.User;
import kikakuya.utilities.HelperUtilities;

public class EventDaoImpl implements EventDao {
	
	DataSource dataSource;
	

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Event> listEventsByUser(User user) throws SQLException  {
		String query = "Select * from Event WHERE UseruserId = " + user.getUserId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		List<Event> events = new ArrayList<Event>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Event event = new Event();
			event.setEventId(rs.getInt(1));
			event.setEventName(rs.getString(2));
			event.setEventDate(HelperUtilities.timestampToString(rs.getTimestamp(3)));
			event.setLocation(rs.getString(5));
			event.setTotalBudget(rs.getDouble(6));
			
			events.add(event);
		}
		
		connection.close();
		return events;
	}
	
	
	public boolean insertEvent(Event event, User user) throws SQLException, ParseException {
		String query = "INSERT INTO Event (eventName, eventDate, location, UseruserId) values (?,?,?,?)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, event.getEventName());
		pstmt.setTimestamp(2, HelperUtilities.stringToTimestamp(event.getEventDate()));
		pstmt.setString(3,event.getLocation());
		pstmt.setInt(4, user.getUserId());
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	public boolean updateEvent(Event event)throws SQLException, ParseException {
		String query = "UPDATE Event SET eventName = '" + event.getEventName() + 
				"', eventDate = '" + HelperUtilities.stringToTimestamp(event.getEventDate()) + 
				"', location = '" + event.getLocation() + 
				"' where eventId = " + event.getEventId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}
	
	public boolean deleteEvent(Event event) throws SQLException{
		String query = "DELETE FROM Event WHERE eventId="+ event.getEventId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	public Event findEventById(int eventId) throws SQLException {
		String query = "SELECT * FROM Event WHERE eventId="+eventId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Event event = new Event();
		while(rs.next()){
			event.setEventId(rs.getInt(1));
			event.setEventName(rs.getString(2));
			event.setEventDate(HelperUtilities.timestampToString(rs.getTimestamp(3)));
			event.setLocation(rs.getString(5));
			event.setTotalBudget(rs.getDouble(6));
		}
		
		connection.close();
		return event;
	}

	@Override
	public boolean updateTotalBudget(int eventId, double totalBudget) throws SQLException {
		String query = "update Event set totalBudget=" + totalBudget + " where eventId=" + eventId;
		
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	@Override
	public List<Event> findEventsByMonth(Calendar date, int userId) throws SQLException {
		String day = date.get(Calendar.YEAR) + "-" + HelperUtilities.formatMonthInt(date.get(Calendar.MONTH) + 1) + "-01 00:00:00";
		String dayEnd = date.get(Calendar.YEAR) + "-" + HelperUtilities.formatMonthInt(date.get(Calendar.MONTH) + 2) + "-01 00:00:00";
		String query = "select * from Event where eventDate >= '" + day +
				"' and eventDate < '" + dayEnd + "' and UseruserId=" + userId;
		
		System.out.println(query);
		
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		
		List<Event> eventsList = new ArrayList<Event>();
		while(rs.next()){
			Event event = new Event();
			event.setEventId(rs.getInt(1));
			event.setEventName(rs.getString(2));
			event.setEventDate(HelperUtilities.timestampToString(rs.getTimestamp(3)));
			event.setLocation(rs.getString(5));
			event.setTotalBudget(rs.getDouble(6));
			eventsList.add(event);
		}
		
		connection.close();
		return eventsList;
		
	}
}
