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

public class GuestPlusOneImpl implements GuestPlusOneDao {

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<GuestPlusOne> listPlusOne() throws SQLException {
		String query = "SELECT guest.firstName, guest.lastName, guest.isPresent FROM guest WHERE isPresent = 1";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<GuestPlusOne> plusOne = new ArrayList<GuestPlusOne>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			GuestPlusOne gPlusOne = new GuestPlusOne();
			//Guest guest = new Guest();
			gPlusOne.setFirstName(rs.getString(2));
			gPlusOne.setLastName(rs.getString(3));
			//guest.setIsPresent(rs.getInt(4));
		}
		return plusOne;
	}
	
	public boolean insertPlusOne(GuestPlusOne guestPlusOne) throws SQLException{
		
		String query = "Insert into guestplusone (firstName, lastName, mealChoice) values (?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, guestPlusOne.getFirstName());
		pstmt.setString(2,guestPlusOne.getLastName());
		pstmt.setString(3,guestPlusOne.getMealChoice());
		
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
}
