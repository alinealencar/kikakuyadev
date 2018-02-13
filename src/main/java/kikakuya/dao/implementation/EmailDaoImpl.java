package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import kikakuya.dao.EmailDao;
import kikakuya.model.Email;
import kikakuya.model.Event;
import kikakuya.model.Guest;

public class EmailDaoImpl implements EmailDao{
	
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Email findEmailById(Event event) throws SQLException {
		String query = "SELECT * FROM email WHERE EventeventId=" + event.getEventId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Email email = new Email();
		while(rs.next()){
			email.setReplyDue(rs.getString(2));
			email.setMealChoiceBeef(rs.getString(3));
			email.setMealChoicePork(rs.getString(4));
			email.setMealChoiceChicken(rs.getString(5));
			email.setMealChoiceVeg(rs.getString(6));
			email.setMealChoiceFish(rs.getString(7));
			email.setMealChoiceKids(rs.getString(8));
		}
		return email;
	}
	
	public boolean findEmailByEvent(Event event) throws SQLException {
		String query = "SELECT COUNT(*) FROM email WHERE EventeventId=" + event.getEventId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		if(rs.next())
			rs.getInt(1);
		if(rs.getInt(1) > 0)
			return true;
		else
			return false;
	}
	
	public boolean insertEmail(Email email, Event event) throws SQLException {
		String query = "INSERT INTO email (replyDue, mealChoiceBeef, mealChoicePork, mealChoiceChicken, mealChoiceVeg, mealChoiceFish, mealChoiceKids, EventeventId) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		
		pstmt.setString(1, email.getReplyDue());
		pstmt.setString(2, email.getMealChoiceBeef());
		pstmt.setString(3, email.getMealChoicePork());
		pstmt.setString(4, email.getMealChoiceChicken());
		pstmt.setString(5, email.getMealChoiceVeg());
		pstmt.setString(6, email.getMealChoiceFish());
		pstmt.setString(7, email.getMealChoiceKids());
		pstmt.setInt(8, event.getEventId());
		
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
}
