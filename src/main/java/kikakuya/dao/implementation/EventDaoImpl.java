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
	
	//is this even right? :P
	public List<Event> listAllEvents() throws SQLException  {
		String query = "Select * from event";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<Event> events = new ArrayList<Event>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Event event = new Event();
			event.setEventId(rs.getInt(1));
			event.setEventName(rs.getString(2));
			event.setLocation(rs.getString(5));
			//pstmt.setString(1, event.getEventName());
			//pstmt.setString(2, event.getEventDate());
			//pstmt.setString(3, event.getLocation());
			
			events.add(event);
		}
		return events;
	}
	
	
	public boolean insertEvent(Event event, User user) throws SQLException {
		//Event event = new Event();
		String query = "Insert into event (eventName, eventDate, location, userUserId) values (?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, event.getEventName());
		pstmt.setString(2,event.getEventDate());
		pstmt.setString(3,event.getLocation());
		//pstmt.set(3,user.get()); // userId 
		
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	public boolean updateEvent(Event event)throws SQLException {
		String query = "UPDATE event SET eventName = ?, eventDate = ?, location = ? WHERE eventId = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, event.getEventName());
		pstmt.setString(2, event.getEventDate());
		pstmt.setString(3, event.getLocation());
		int rowsAffected = pstmt.executeUpdate();
		
		
		return(rowsAffected > 0);
	}
	
	public boolean deleteEvent(int eventId) throws SQLException{
		String query = "DELETE FROM event WHERE eventId="+eventId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		//pstmt.setInt(0, eventId);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}
	
	public Event findEventById(int eventId) throws SQLException {
		Event event = new Event();
		String query = "SELECT eventName, eventDate, location FROM event WHERE eventId ="+eventId+"";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setInt(0, eventId);
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next()){
			event.setEventName(resultSet.getString(1));
			event.setEventDate(resultSet.getString(2));
			event.setLocation(resultSet.getString(3));
		}
		return event;
	}
}
