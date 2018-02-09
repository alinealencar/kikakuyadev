package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import kikakuya.dao.UserDao;
import kikakuya.model.User;
import kikakuya.utilities.HelperUtilities;

public class UserDaoImpl implements UserDao {
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public boolean insertUser(User user) throws SQLException {
		String query = "Insert into user (userName, email, userPassword) values (?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getEmail());
		pstmt.setString(3, HelperUtilities.toMd5(user.getUserPassword()));
		
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
		
	}

	public User findByEmail(String email) throws SQLException {
		User user = new User();
		//Using MD5 encryption for the password
		String query = "Select userId, userName, userPassword, email, token, series from user where email = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, email);
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next()){
			user.setUserId(resultSet.getInt(1));
			user.setUserName(resultSet.getString(2));
			user.setUserPassword(resultSet.getString(3));
			user.setEmail(resultSet.getString(4));
			user.setToken(resultSet.getString(5));
			user.setSeries(resultSet.getString(6));
		}
        
		return user;
	}

	public boolean updateUser(User user) throws SQLException {
		String query = "update user set userName = '" + user.getUserName() + 
				"', userPassword = '" + user.getUserPassword() + 
				"', token = '" + user.getToken() + 
				"', series = '" + user.getSeries() + 
				"' where email = '" + user.getEmail() + "'";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
		
	}

	public User findBySeries(String series) throws SQLException {
		User user = new User();
		String query = "Select userName, email, token, series from user where series = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, series);
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next()){
			user.setUserName(resultSet.getString(1));
			user.setEmail(resultSet.getString(2));
			user.setToken(resultSet.getString(3));
			user.setSeries(resultSet.getString(4));
		}
        
		return user;
	}
}
