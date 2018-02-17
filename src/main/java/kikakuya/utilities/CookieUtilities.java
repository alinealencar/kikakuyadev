package kikakuya.utilities;

import javax.servlet.http.Cookie;

public class CookieUtilities {
	/**
	 * This creates a cookie that will be used in the implementation of 
	 * the RememberMe feature. This cookie has a maximum age  of one year.
	 * @param cookieName	String that holds the name of the cookie
	 * @param cookieValue	String that holds the value of the cookie
	 * @return	Cookie	This returns a Cookie object with the name cookieName,
	 * 					value cookieValue and maximum age of one year.
	 */
	public static Cookie createRememberMeCookie(String cookieName, String cookieValue) {
		Cookie c = new Cookie(cookieName, cookieValue);
		c.setMaxAge(365 * 24 * 60 * 60); // One year
		return c;
	}
	
	/**
	 * This method deleted a cookie by cookie name.
	 * @param strCookieName	String that holds the name of the cookie that will be deleted.
	 * @return Cookie	This returns a Cookie object with an empty string value and maxAge of 0 (deleted).
	 */
	public static Cookie eraseCookie(String strCookieName) {
		Cookie cookie = new Cookie(strCookieName, null);
	    cookie.setMaxAge(0);
	    cookie.setValue(null);
	    return cookie;
	}
}
