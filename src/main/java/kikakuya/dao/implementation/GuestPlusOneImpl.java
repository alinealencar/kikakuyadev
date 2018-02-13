package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.GuestPlusOne;
import kikakuya.model.User;

public class GuestPlusOneImpl {

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean insertPlusOne(GuestPlusOne plusOne, Guest guest) throws SQLException {
		String query = "Insert into guestplusone (firstName, lastName, mealChoice, GuestguestId) values (?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, plusOne.getFirstName());
		pstmt.setString(2, plusOne.getLastName());
		pstmt.setString(3, plusOne.getMealChoice());
		pstmt.setInt(4, guest.getGuestId());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
}
