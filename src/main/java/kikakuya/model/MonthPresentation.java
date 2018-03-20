package kikakuya.model;

import java.util.List;

public class MonthPresentation {
	private String name;
	private int year;
	private int firstDay; //1: Sunday, 2: Monday, ..., 7: Saturday
	private int numOfDays;
	private List<Appointment> appointments;
	private List<Event> events;
	
	public MonthPresentation() {
	
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getFirstDay() {
		return firstDay;
	}
	public void setFirstDay(int firstDay) {
		this.firstDay = firstDay;
	}
	public int getNumOfDays() {
		return numOfDays;
	}
	public void setNumOfDays(int numOfDays) {
		this.numOfDays = numOfDays;
	}
	public List<Appointment> getAppointments() {
		return appointments;
	}
	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	@Override
	public String toString() {
		return "MonthPresentation [name=" + name + ", year=" + year + ", firstDay=" + firstDay + ", numOfDays="
				+ numOfDays + ", appointments=" + appointments + ", events=" + events + "]";
	}

	
	
}
