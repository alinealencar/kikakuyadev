package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.dao.EventDao;
import kikakuya.model.Event;
import kikakuya.model.User;

public class EventDaoImpl implements EventDao {
	
	DataSource dataSource;
	

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Event> listEventsByUser(User user) throws SQLException  {
		String query = "Select * from event WHERE UseruserId = " + user.getUserId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<Event> events = new ArrayList<Event>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Event event = new Event();
			event.setEventId(rs.getInt(1));
			event.setEventName(rs.getString(2));
			event.setEventDate(rs.getString(3));
			event.setLocation(rs.getString(5));
			event.setTotalBudget(rs.getDouble(6));
			
			events.add(event);
			System.out.println("EVENT: " + event.getEventName());
		}
		
		return events;
	}
	
	
	public boolean insertEvent(Event event, User user) throws SQLException {
		String query = "INSERT INTO event (eventName, eventDate, location, UseruserId) values (?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, event.getEventName());
		pstmt.setString(2,event.getEventDate());
		pstmt.setString(3,event.getLocation());
		pstmt.setInt(4, user.getUserId());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
	
	public boolean updateEvent(Event event)throws SQLException {
		String query = "UPDATE event SET eventName = '" + event.getEventName() + 
				"', eventDate = '" + event.getEventDate() + 
				"', location = '" + event.getLocation() + 
				"' where eventId = '" + event.getEventId() + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}
	
	public boolean deleteEvent(Event event) throws SQLException{
		String query = "DELETE FROM event WHERE eventId="+ event.getEventId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		//pstmt.setInt(0, eventId);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}
	
	public Event findEventById(int eventId) throws SQLException {
		String query = "SELECT * FROM event WHERE eventId="+eventId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Event event = new Event();
		while(rs.next()){
			event.setEventId(rs.getInt(1));
			event.setEventName(rs.getString(2));
			event.setEventDate(rs.getString(3));
			event.setLocation(rs.getString(5));
			event.setTotalBudget(rs.getDouble(6));
		}
		return event;
	}

	@Override
	public boolean updateTotalBudget(int eventId, double totalBudget) throws SQLException {
		String query = "update event set totalBudget=" + totalBudget + " where eventId=" + eventId;
		
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}
}
