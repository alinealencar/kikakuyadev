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
		String query = "Select userName, userPassword, email, token, isRememberMe from user where email = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, email);
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next()){
			user.setUserName(resultSet.getString(1));
			user.setUserPassword(resultSet.getString(2));
			user.setEmail(resultSet.getString(3));
			user.setToken(resultSet.getString(4));
			user.setIsRememberMe(resultSet.getInt(5));
		}
        
		return user;
	}
}
