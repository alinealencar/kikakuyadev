package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import java.sql.Connection;

import kikakuya.dao.GuestDao;
import kikakuya.model.Event;
import kikakuya.model.Guest;

public class GuestDaoImpl implements GuestDao {
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Guest> findGuests(Event event) throws SQLException {
		String query = "SELECT * FROM Guest WHERE EventeventId=" + event.getEventId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		List<Guest> guests = new ArrayList<Guest>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Guest guest = new Guest();
			guest.setGuestId(rs.getInt(1));
			guest.setToken(rs.getString(2));
			guest.setFirstName(rs.getString(3));
			guest.setLastName(rs.getString(4));
			guest.setEmail(rs.getString(5));
			guest.setIsPresent(rs.getInt(6));
			guest.setCompany(rs.getString(7));
			guest.setKidsWith(rs.getInt(8));
			guest.setAdultsWith(rs.getInt(9));
			guest.setKidsMax(rs.getInt(10));
			guest.setAdultsMax(rs.getInt(11));
			guest.setSpecialRequests(rs.getString(12));
			guest.setMealChoice(rs.getString(13));
			guest.setNotes(rs.getString(14));
			guest.setEventId(rs.getInt(15));
			
			guests.add(guest);
		}
		
		connection.close();
		return guests;
	}

	public boolean insertGuest(Guest guest) throws SQLException {
		String query = "INSERT INTO Guest (firstName, lastName, email, isPresent, company, kidsMax, adultsMax, specialRequests, EventeventId, token, notes, mealChoice) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		
		pstmt.setString(1, guest.getFirstName());
		pstmt.setString(2, guest.getLastName());
		pstmt.setString(3, guest.getEmail());
		pstmt.setInt(4, guest.getIsPresent());
		pstmt.setString(5, guest.getCompany());
		pstmt.setInt(6, guest.getKidsMax());
		pstmt.setInt(7, guest.getAdultsMax());
		pstmt.setString(8, guest.getSpecialRequests());
		pstmt.setInt(9, guest.getEventId());
		pstmt.setString(10, guest.getToken());
		pstmt.setString(11, guest.getNotes());
		pstmt.setString(12, guest.getMealChoice());
		
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}

	public boolean updateGuestRsvpInfo(Guest guest) throws SQLException {
		String query = "UPDATE Guest SET isPresent = '" + guest.getIsPresent() + 
				"', kidsWith = '" + guest.getKidsWith() + 
				"', adultsWith = '" + guest.getAdultsWith() + 
				"', specialRequests = '" + guest.getSpecialRequests() + 
				"', mealChoice = '" + guest.getMealChoice() +
				"', notes = '" + guest.getNotes() +
				"' WHERE guestId = '" + guest.getGuestId() + "'";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}
	
	public boolean deleteGuestToken(Guest guest) throws SQLException {
		String query = "UPDATE Guest SET token ='' where guestId = '" + guest.getGuestId() + "'";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	public boolean deleteGuest(int guestId) throws SQLException {
		String query = "DELETE FROM Guest WHERE guestId="+guestId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	public Guest findGuestById(int guestId) throws SQLException {
		String query = "SELECT * FROM Guest WHERE guestId="+guestId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Guest guest = new Guest();
		while(rs.next()){
			guest.setGuestId(rs.getInt(1));
			guest.setToken(rs.getString(2));
			guest.setFirstName(rs.getString(3));
			guest.setLastName(rs.getString(4));
			guest.setEmail(rs.getString(5));
			guest.setIsPresent(rs.getInt(6));
			guest.setCompany(rs.getString(7));
			guest.setKidsWith(rs.getInt(8));
			guest.setAdultsWith(rs.getInt(9));
			guest.setKidsMax(rs.getInt(10));
			guest.setAdultsMax(rs.getInt(11));
			guest.setSpecialRequests(rs.getString(12));
			guest.setMealChoice(rs.getString(13));
			guest.setNotes(rs.getString(14));
			guest.setEventId(rs.getInt(15));
		}
		
		connection.close();
		return guest;
	}
	
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException {
		String query = "SELECT * FROM Guest WHERE isPresent=" + status + " AND EventeventID=" + eventId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		List<Guest> guests = new ArrayList<Guest>();
		while(rs.next()){
			Guest guest = new Guest();
			guest.setGuestId(rs.getInt(1));
			guest.setToken(rs.getString(2));
			guest.setFirstName(rs.getString(3));
			guest.setLastName(rs.getString(4));
			guest.setEmail(rs.getString(5));
			guest.setIsPresent(rs.getInt(6));
			guest.setCompany(rs.getString(7));
			guest.setKidsWith(rs.getInt(8));
			guest.setAdultsWith(rs.getInt(9));
			guest.setKidsMax(rs.getInt(10));
			guest.setAdultsMax(rs.getInt(11));
			guest.setSpecialRequests(rs.getString(12));
			guest.setMealChoice(rs.getString(13));
			guest.setNotes(rs.getString(14));
			guest.setEventId(rs.getInt(15));
			
			guests.add(guest);
		}
		
		connection.close();
		return guests;
	}
	
	public Guest findGuestByToken(String token) throws SQLException{
		String query = "SELECT * FROM Guest WHERE token='"+token+"'";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Guest guest = new Guest();
		while(rs.next()){
			guest.setGuestId(rs.getInt(1));
			guest.setToken(rs.getString(2));
			guest.setFirstName(rs.getString(3));
			guest.setLastName(rs.getString(4));
			guest.setEmail(rs.getString(5));
			guest.setIsPresent(rs.getInt(6));
			guest.setCompany(rs.getString(7));
			guest.setKidsWith(rs.getInt(8));
			guest.setAdultsWith(rs.getInt(9));
			guest.setKidsMax(rs.getInt(10));
			guest.setAdultsMax(rs.getInt(11));
			guest.setSpecialRequests(rs.getString(12));
			guest.setMealChoice(rs.getString(13));
			guest.setNotes(rs.getString(14));
			guest.setEventId(rs.getInt(15));
		}
		
		connection.close();
		return guest;
	}
	
	public boolean isTokenFound(String token) throws SQLException{
		String query = "SELECT COUNT(*) FROM Guest WHERE token='" + token + "'";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		if(rs.next())
			rs.getInt(1);
		if(rs.getInt(1) > 0){
			connection.close();
			return true;
		}
		else{
			connection.close();
			return false;
		}
	}

	@Override
	public boolean updateGuestInfo(Guest guest) throws SQLException {
		String query = "update Guest set firstName = '" + guest.getFirstName() + 
				"', lastName = '" + guest.getLastName() + 
				"', email = '" + guest.getEmail() + 
				"', adultsMax = " + guest.getAdultsMax() + 
				", kidsMax = " + guest.getKidsMax() +
				", company = '" + guest.getCompany() +
				"', notes = '" + guest.getNotes() +
				"', isPresent = " + guest.getIsPresent() +
				", mealChoice= '" + guest.getMealChoice() + 
				"' where guestId = " + guest.getGuestId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	@Override
	public int countGuestsByStatus(Event event, int status) throws SQLException {
		int count = 0;
		String query = "SELECT COUNT(*) FROM Guest WHERE EventeventId=" + event.getEventId()
				+ " AND isPresent=" + status;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		while (rs.next()){
            count = rs.getInt(1);
        }
		connection.close();
		return count;
	}

	@Override
	public int countGuests(Event event) throws SQLException {
		int count = 0;
		String query = "SELECT COUNT(*) FROM Guest WHERE EventeventId=" + event.getEventId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		while (rs.next()){
            count = rs.getInt(1);
        }
		connection.close();
		return count;
	}

	@Override
	public boolean updateGuestAdultsKidsWith(Guest guest) throws SQLException {
		String query = "update Guest set adultsWith = " + guest.getAdultsWith() +
		", kidsWith = " + guest.getKidsWith() +
		" where guestId = " + guest.getGuestId();
		
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

}
