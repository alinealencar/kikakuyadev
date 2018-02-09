package kikakuya.utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kikakuya.delegate.LoginDelegate;
import kikakuya.model.User;
import kikakuya.service.implementation.UserServiceImpl;

public class AuthenticationUtilities {
	
	public static boolean isLoggedIn(HttpSession session){
		return !(session == null || session.getAttribute("userName") == null);
	}
	public static boolean isRememberMe(HttpServletRequest request, DataSource dataSource) throws Exception{
		
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
				String query = "Select userName, email, token, series from user where series = ?";
				PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
				pstmt.setString(1, rememberMeCookies[1].getValue());
				ResultSet resultSet = pstmt.executeQuery();
				if(resultSet.next()){
					user.setUserName(resultSet.getString(1));
					user.setEmail(resultSet.getString(2));
					user.setToken(resultSet.getString(3));
					user.setSeries(resultSet.getString(4));
				}
				
				return (user.getToken().equals(rememberMeCookies[0].getValue()));
			}
			
		}
		
		return false;

		
	}
}
