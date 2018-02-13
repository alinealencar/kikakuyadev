package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.SQLException;
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
		String query = "Insert into guestplusone (fullName, mealChoice, GuestguestId) values (?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, plusOne.getFullName());
		//pstmt.setString(2, plusOne.getFullName().split(" ")[1]);
		pstmt.setString(2, plusOne.getMealChoice());
		pstmt.setInt(3, guest.getGuestId());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
}
