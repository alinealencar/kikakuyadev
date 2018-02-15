package kikakuya.model;

import java.util.ArrayList;
import java.util.List;

public class Guest {
	private int guestId;
	private String firstName;
	private String lastName;
	private String email;
	private int isPresent;
	private String company;
	private int kidsWith;
	private int adultsWith;
	private int kidsMax;
	private int adultsMax;
	private String specialRequests;
	private String mealChoice;
	private int eventId;
	private String token;
	private String notes;
	private List<GuestPlusOne> plusOneList = new ArrayList<GuestPlusOne>();
	
	public Guest() {
	
	}
	public int getGuestId() {
		return guestId;
	}
	public void setGuestId(int guestId) {
		this.guestId = guestId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIsPresent() {
		return isPresent;
	}
	public void setIsPresent(int isPresent) {
		this.isPresent = isPresent;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getKidsWith() {
		return kidsWith;
	}
	public void setKidsWith(int kidsWith) {
		this.kidsWith = kidsWith;
	}
	public int getAdultsWith() {
		return adultsWith;
	}
	public void setAdultsWith(int adultsWith) {
		this.adultsWith = adultsWith;
	}
	public int getKidsMax() {
		return kidsMax;
	}
	public void setKidsMax(int kidsMax) {
		this.kidsMax = kidsMax;
	}
	public int getAdultsMax() {
		return adultsMax;
	}
	public void setAdultsMax(int adultsMax) {
		this.adultsMax = adultsMax;
	}
	public String getSpecialRequests() {
		return specialRequests;
	}
	public void setSpecialRequests(String specialRequests) {
		this.specialRequests = specialRequests;
	}
	public String getMealChoice() {
		return mealChoice;
	}
	public void setMealChoice(String mealChoice) {
		this.mealChoice = mealChoice;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public List<GuestPlusOne> getPlusOneList() {
		return plusOneList;
	}
	public void setPlusOneList(List<GuestPlusOne> plusOneList) {
		this.plusOneList = plusOneList;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
}
