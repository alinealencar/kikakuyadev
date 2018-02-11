package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import kikakuya.dao.EmailDao;
import kikakuya.model.Email;

public class EmailDaoImpl implements EmailDao{
	
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
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
