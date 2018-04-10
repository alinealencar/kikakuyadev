package kikakuya.utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kikakuya.delegate.LoginDelegate;
import kikakuya.model.User;
import kikakuya.service.implementation.UserServiceImpl;

public class AuthenticationUtilities {
	
	public static boolean isLoggedIn(HttpSession session){
		return !(session == null || session.getAttribute("user") == null);
	}
	public static User isRememberMe(HttpServletRequest request, DataSource dataSource) throws Exception{
		
		Cookie[] cookies = request.getCookies();

		Cookie[] rememberMeCookies = new Cookie[2];
		
		if(cookies != null){
			for(Cookie aCookie : cookies){
				//Search for cookies by name
				if(aCookie.getName().equals("token")){
					rememberMeCookies[0] = aCookie;
				}
				if(aCookie.getName().equals("series")){
					rememberMeCookies[1] = aCookie;
				}
			}
			
			//If both cookies exist
			if(rememberMeCookies[0] != null && rememberMeCookies[1] != null) {
				System.out.println("DATASOURCE: " + dataSource);
				User user = new User();
				String query = "Select userId, userName, email, token, series from User where series = ?";
				Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setString(1, rememberMeCookies[1].getValue());
				ResultSet resultSet = pstmt.executeQuery();
				if(resultSet.next()){
					user.setUserId(resultSet.getInt(1));
					user.setUserName(resultSet.getString(2));
					user.setEmail(resultSet.getString(3));
					user.setToken(resultSet.getString(4));
					user.setSeries(resultSet.getString(5));
				}
				connection.close();
				
				if (user.getToken() != null && user.getToken().equals(rememberMeCookies[0].getValue()))
					return user;
				
			}
			
		}
		
		return null;

		
	}
}
