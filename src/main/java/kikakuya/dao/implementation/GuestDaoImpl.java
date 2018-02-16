package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

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
//		String query = "SELECT * FROM guest INNER JOIN guest_event "
//				+ "ON guest.guestId = guest_event.GuestguestId "
//				+ "WHERE guest_event.EventeventId=" + event.getEventId();
		String query = "SELECT * FROM guest WHERE EventeventId=" + event.getEventId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
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
			
			guests.add(guest);
		}
		return guests;
	}

	public boolean insertGuest(Guest guest) throws SQLException {
		String query = "INSERT INTO guest (firstName, lastName, email, isPresent, company, kidsMax, adultsMax, specialRequests, EventeventId, token, notes) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		
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
		
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	public boolean updateGuestRsvpInfo(Guest guest) throws SQLException {
		String query = "UPDATE guest SET isPresent = '" + guest.getIsPresent() + 
				"', kidsWith = '" + guest.getKidsWith() + 
				"', adultsWith = '" + guest.getAdultsWith() + 
				"', specialRequests = '" + guest.getSpecialRequests() + 
				"', mealChoice = '" + guest.getMealChoice() + 
				"' WHERE guestId = '" + guest.getGuestId() + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}
	
	public boolean deleteGuestToken(Guest guest) throws SQLException {
		String query = "UPDATE guest SET token ='' where guestId = '" + guest.getGuestId() + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}

	public boolean deleteGuest(int guestId) throws SQLException {
		String query = "DELETE FROM guest WHERE guestId="+guestId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}
	
	public Guest findGuestById(int guestId) throws SQLException {
		String query = "SELECT * FROM guest WHERE guestId="+guestId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
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
		}
		return guest;
	}
	
	public List<Guest> findGuestByStatus(int status, int eventId) throws SQLException {
		String query = "SELECT * FROM guest WHERE isPresent=" + status + " AND EventeventID=" + eventId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
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
			
			guests.add(guest);
		}
		return guests;
	}
	
	public Guest findGuestByToken(String token) throws SQLException{
		String query = "SELECT * FROM guest WHERE token='"+token+"'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
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
		}
		return guest;
	}
	
	public boolean isTokenFound(String token) throws SQLException{
		String query = "SELECT COUNT(*) FROM guest WHERE token='" + token + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		if(rs.next())
			rs.getInt(1);
		if(rs.getInt(1) > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateGuestInfo(Guest guest) throws SQLException {
		String query = "update guest set firstName = '" + guest.getFirstName() + 
				"', lastName = '" + guest.getLastName() + 
				"', email = '" + guest.getEmail() + 
				"', adultsMax = '" + guest.getAdultsMax() + 
				"', kidsMax = '" + guest.getKidsMax() +
				"', company = '" + guest.getCompany() +
				"', notes = '" + guest.getNotes() +
				"', isPresent = " + guest.getIsPresent() +
				" where token = '" + guest.getToken() + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}

}
