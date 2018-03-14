package kikakuya.utilities;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;


public class HelperUtilities {
	public static String toMd5(String data){
		return DigestUtils.md5DigestAsHex(data.getBytes());
	}
	
	public static String hashToken(String data) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(data.getBytes(StandardCharsets.UTF_8));
		return new String(hash, "UTF-8");
	}
	
	public static String newUUID() {
		return UUID.randomUUID().toString();
	}
	
	public static String capitalize(String str) {
	    String[] words = str.split(" ");
	    StringBuilder ret = new StringBuilder();
	    for(int i = 0; i < words.length; i++) {
	        ret.append(Character.toUpperCase(words[i].charAt(0)));
	        ret.append(words[i].substring(1));
	        if(i < words.length - 1) {
	            ret.append(' ');
	        }
	    }
	    return ret.toString();
	}
	
	public static Timestamp stringToTimestamp(String year, String month, String day, String hour, String minute, String ampm) 
			throws ParseException{
		if(ampm.equals("PM")) {
			int hourInt = Integer.valueOf(hour);
			hourInt += 12;
			hour = String.valueOf(hourInt);
		}
		
		String strDate;
		
		if(isNumeric(month))
			strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute;
		else
			strDate = year + "-" + getMonthNumber(month) + "-" + day + " " + hour + ":" + minute;
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	    Date parsedDate = dateFormat.parse(strDate);
	    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
	    
	    return timestamp;
	}

	public static int getMonthNumber(String month){
		String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		return Arrays.asList(monthNames).indexOf(month) + 1;
	}
	
	public static Calendar getLoadMonth(String curMonth, String curYear) {
		
		Calendar c = getMonth(curMonth, curYear);
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    return c;
	}
	
	public static Calendar getNextMonth(String curMonth, String curYear) {
		
		Calendar c = getMonth(curMonth, curYear);
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    c.add(Calendar.MONTH, 1);
	    return c;
	}
	
	public static Calendar getPrevMonth(String curMonth, String curYear) {
		
		Calendar c = getMonth(curMonth, curYear);
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    c.add(Calendar.MONTH, -1);
	    return c;
	}
	
	public static Calendar getNextYear(String curMonth, String curYear) {
		
		Calendar c = getMonth(curMonth, curYear);
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    c.add(Calendar.YEAR, 1);
	    return c;
	}
	
	public static Calendar getPrevYear(String curMonth, String curYear) {
		
		Calendar c = getMonth(curMonth, curYear);
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    c.add(Calendar.YEAR, -1);
	    return c;
	}
	
	public static Calendar getMonth(String curMonth, String curYear){
		Calendar c = Calendar.getInstance();
		
		if(curMonth.equals("January"))
			c.set(Calendar.MONTH, Calendar.JANUARY);
		else if(curMonth.equals("February"))
			c.set(Calendar.MONTH, Calendar.FEBRUARY);
		else if(curMonth.equals("March"))
			c.set(Calendar.MONTH, Calendar.MARCH);
		else if(curMonth.equals("April"))
			c.set(Calendar.MONTH, Calendar.APRIL);
		else if(curMonth.equals("May"))
			c.set(Calendar.MONTH, Calendar.MAY);
		else if(curMonth.equals("June"))
			c.set(Calendar.MONTH, Calendar.JUNE);
		else if(curMonth.equals("July"))
			c.set(Calendar.MONTH, Calendar.JULY);
		else if(curMonth.equals("August"))
			c.set(Calendar.MONTH, Calendar.AUGUST);
		else if(curMonth.equals("September"))
			c.set(Calendar.MONTH, Calendar.SEPTEMBER);
		else if(curMonth.equals("October"))
			c.set(Calendar.MONTH, Calendar.OCTOBER);
		else if(curMonth.equals("November"))
			c.set(Calendar.MONTH, Calendar.NOVEMBER);
		else if(curMonth.equals("December"))
			c.set(Calendar.MONTH, Calendar.DECEMBER);
		
		c.set(Calendar.YEAR, Integer.parseInt(curYear));
		
		return c;
	}
	
	public static String getMonthName(int month){
		String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
	    return monthNames[month];
	}
	
	public static int getDayOfWeek(Calendar c){
		return c.get(Calendar.DAY_OF_WEEK);
	}
	
	public static int getNumOfDays(Calendar c){
		return c.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	
	public static boolean isNumeric(String number){
		return number != null && number.matches("[-+]?\\d*\\.?\\d+");  
	}
}
