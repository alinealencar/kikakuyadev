package kikakuya.delegate;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

import kikakuya.model.Appointment;
import kikakuya.model.Event;
import kikakuya.service.CalendarService;
import kikakuya.service.EventService;

public class CalendarDelegate {
	private CalendarService calendarService;
	private EventService eventService;

	public CalendarService getCalendarService() {
		return calendarService;
	}

	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	public EventService getEventService() {
		return eventService;
	}

	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	public boolean addAppt(Appointment anAppt) throws SQLException, ParseException {
		return calendarService.addAppointment(anAppt);
	}
	
	public List<Appointment> findAppts(int month, int year, int userId) throws SQLException {
		return calendarService.findAppointments(month, year, userId);
	}
	
	public Appointment findAppt(int apptId) throws SQLException {
		return calendarService.findAppointment(apptId);
	}
	
	public boolean editAppt(Appointment appt) throws SQLException, ParseException {
		return calendarService.editAppointment(appt);
	}
	
	public boolean deleteAppt(int apptId) throws SQLException {
		return calendarService.deleteAppointment(apptId);
	}
	
	public List<Appointment> findApptsByDay(Calendar date) throws SQLException {
		return calendarService.findAppointmentsByDay(date);
	}
	
	public List<Event> findEventsByMonth(Calendar date, int userId) throws SQLException {
		return eventService.findEventsByMonth(date, userId);
	}
}
