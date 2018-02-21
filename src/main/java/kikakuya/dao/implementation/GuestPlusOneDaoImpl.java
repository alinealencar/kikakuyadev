package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.dao.GuestPlusOneDao;
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
		String query = "Insert into guestplusone (fullName, mealChoice, GuestguestId, Category) values (?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, plusOne.getFullName());
		pstmt.setString(2, plusOne.getMealChoice());
		pstmt.setInt(3, guest.getGuestId());
		pstmt.setString(4, plusOne.getCategory());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	@Override
	public boolean updatePlusOne(GuestPlusOne plusOne) throws SQLException {
		String query = "update guestplusone set fullName = '" + plusOne.getFullName() + 
				"', mealChoice = '" + plusOne.getMealChoice() +
				"' where guestPlusOneId = '" + plusOne.getGuestPlusOneId() + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}

	@Override
	public List<GuestPlusOne> findPlusOne(Guest guest) throws SQLException {
		String query = "select * from guestplusone where GuestguestId=" + guest.getGuestId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
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
		
		return plusOnes;
	}
}
