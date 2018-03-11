package kikakuya.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.Calendar;

import kikakuya.utilities.HelperUtilities;


public class Appointment {
	private int apptId;
	private String title;
	private String day;
	private String month;
	private String year;
	private String hour;
	private String minute;
	private String ampm;
	private String notes;
	private int userId;
	private String location;
	private String color;
	
	public Appointment() {
		
	}

	public void setDatetime(Timestamp datetime) {
		LocalDateTime ddd = datetime.toLocalDateTime();
		
		this.day = String.valueOf(ddd.getDayOfMonth());
		this.month = HelperUtilities.getMonthName(ddd.getMonthValue() - 1);
		this.year = String.valueOf(ddd.getYear());
		
		if(ddd.getHour() > 1 && ddd.getHour() < 12){
			this.hour = String.valueOf(ddd.getHour());
			this.ampm = "am";
		}
		else if(ddd.getHour() == 0){
			this.hour = "12";
			this.ampm = "am";
		}
		else if(ddd.getHour() == 12){
			this.hour = "12";
			this.ampm = "pm";
		}
		else {
			this.hour = String.valueOf(ddd.getHour() - 12);
			this.ampm="pm";
		}
		
		this.minute = String.valueOf(ddd.getMinute());
	}

	public int getApptId() {
		return apptId;
	}
	public void setApptId(int apptId) {
		this.apptId = apptId;
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getAmpm() {
		return ampm;
	}
	public void setAmpm(String ampm) {
		this.ampm = ampm;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getApptDateTime() throws ParseException{
		return HelperUtilities.stringToTimestamp(year, month, day, hour, minute, ampm);
	}

	@Override
	public String toString() {
		return "Appointment [apptId=" + apptId + ", title=" + title + ", day=" + day
				+ ", month=" + month + ", year=" + year + ", hour=" + hour + ", minute=" + minute + ", ampm=" + ampm
				+ ", notes=" + notes + ", userId=" + userId + ", location=" + location + ", color=" + color + "]";
	}
	
	
	
	
}
