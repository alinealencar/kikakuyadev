package kikakuya.delegate;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import kikakuya.model.Appointment;
import kikakuya.service.CalendarService;

public class CalendarDelegate {
	private CalendarService calendarService;

	public CalendarService getCalendarService() {
		return calendarService;
	}

	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
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
}
