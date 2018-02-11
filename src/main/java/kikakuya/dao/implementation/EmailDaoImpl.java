package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import kikakuya.dao.EmailDao;
import kikakuya.model.Email;
import kikakuya.model.Guest;

public class EmailDaoImpl implements EmailDao{
	
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Email findEmailById(int emailId) throws SQLException {
		String query = "SELECT * FROM email WHERE emailId="+emailId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Email email = new Email();
		while(rs.next()){
			email.setReplyDue(rs.getString(2));
			email.setKidsMax(rs.getInt(3));
			email.setAdultsMax(rs.getInt(4));
			email.setMealChoiceBeef(rs.getString(5));
			email.setMealChoicePork(rs.getString(6));
			email.setMealChoiceChicken(rs.getString(7));
			email.setMealChoiceVeg(rs.getString(8));
			email.setMealChoiceFish(rs.getString(9));
			email.setMealChoiceKids(rs.getString(10));
		}
		return email;
	}
	
	public boolean insertEmail(Email email) throws SQLException {
		String query = "INSERT INTO email (replyDue, kidsMax, adultsMax, mealChoiceBeef, mealChoicePork, mealChoiceChicken, mealChoiceVeg, mealChoiceFish, mealChoiceKids) VALUES (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		
		pstmt.setString(1, email.getReplyDue());
		pstmt.setInt(2, email.getKidsMax());
		pstmt.setInt(3, email.getAdultsMax());
		pstmt.setString(4, email.getMealChoiceBeef());
		pstmt.setString(5, email.getMealChoicePork());
		pstmt.setString(6, email.getMealChoiceChicken());
		pstmt.setString(7, email.getMealChoiceVeg());
		pstmt.setString(8, email.getMealChoiceFish());
		pstmt.setString(9, email.getMealChoiceKids());
		
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
}
