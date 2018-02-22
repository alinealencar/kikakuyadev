package kikakuya.model;

public class Event {
	
	private int eventId;
	private String eventName;
	private String eventDate;
	private String location;
	private int userUserId;
	private double totalBudget;
	
	public Event(int eventId, String eventName, String eventDate, String location, int userUserId) {
		super();
		this.eventId = eventId;
		this.eventName = eventName;
		this.eventDate = eventDate;
		this.location = location;
		this.userUserId = userUserId;
	}

	public Event(int eventId) {
		super();
		this.eventId = eventId;
	}

	public Event() {
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getUserUserId() {
		return userUserId;
	}

	public void setUserUserId(int userUserId) {
		this.userUserId = userUserId;
	}

	public double getTotalBudget() {
		return totalBudget;
	}

	public void setTotalBudget(double totalBudget) {
		this.totalBudget = totalBudget;
	}

	@Override
	public String toString() {
		return "Event [eventId=" + eventId + ", eventName=" + eventName + ", eventDate=" + eventDate + ", location="
				+ location + ", userUserId=" + userUserId + "]";
	}
}
