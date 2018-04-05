package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import java.sql.Connection;

import kikakuya.dao.GuestPlusOneDao;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;

public class GuestPlusOneDaoImpl implements GuestPlusOneDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException {
		String query = "Insert into GuestPlusOne (fullName, mealChoice, GuestguestId, Category) values (?,?,?,?)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, plusOne.getFullName());
		pstmt.setString(2, plusOne.getMealChoice());
		pstmt.setInt(3, guest.getGuestId());
		pstmt.setString(4, plusOne.getCategory());
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}

	@Override
	public boolean updatePlusOne(GuestPlusOne plusOne) throws SQLException {
		String query = "update GuestPlusOne set fullName = '" + plusOne.getFullName() + 
				"', mealChoice = '" + plusOne.getMealChoice() +
				"' where guestPlusOneId = '" + plusOne.getGuestPlusOneId() + "'";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	@Override
	public List<GuestPlusOne> findPlusOne(Guest guest) throws SQLException {
		String query = "select * from GuestPlusOne where GuestguestId=" + guest.getGuestId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		List<GuestPlusOne> plusOnes = new ArrayList<GuestPlusOne>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			GuestPlusOne plusOne = new GuestPlusOne();
			plusOne.setGuestPlusOneId(rs.getInt(1));
			plusOne.setFullName(rs.getString(2));
			plusOne.setMealChoice(rs.getString(3));
			plusOne.setCategory(rs.getString(5));
			plusOnes.add(plusOne);
		}
		
		connection.close();
		return plusOnes;
	}
	
	public int getPlusOnesTotalByCategory(Event event, String category, int isPresent) throws SQLException {
		int count = 0;
		String query = "SELECT COUNT(*) FROM Guest g INNER JOIN GuestPlusOne p"
				+ " ON g.guestId = p.GuestguestId"
				+ " WHERE EventeventId=" + event.getEventId()
				+ " AND category='" + category + "' AND g.isPresent=" + isPresent;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		while (rs.next()){
            count = rs.getInt(1);
        }
		
		connection.close();
		return count;
	}
	
	public int getPlusOnesTotalByGuest(int guestId) throws SQLException {
		int count = 0;
		String query = "SELECT COUNT(*) FROM GuestPlusOne"
				+ " WHERE GuestguestId=" + guestId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		while (rs.next()){
            count = rs.getInt(1);
        }
		
		connection.close();
		return count;
	}
	
	public int getPlusOnesTotal(Event event) throws SQLException {
		int count = 0;
		String query = "SELECT COUNT(*) FROM Guest g INNER JOIN GuestPlusOne p"
				+ " ON g.guestId = p.GuestguestId"
				+ " WHERE EventeventId=" + event.getEventId();
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
	public boolean deletePlusOne(int plusOneId) throws SQLException {
		String query = "delete from GuestPlusOne where guestplusoneid=" + plusOneId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	public boolean deletePlusOneByGuest(int guestId) throws SQLException {
		String query = "delete from GuestPlusOne where GuestguestId=" + guestId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
}
