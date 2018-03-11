package kikakuya.service;

import java.sql.SQLException;
import java.text.ParseException;

import kikakuya.model.Appointment;

public interface CalendarService {
	public boolean addAppointment(Appointment anAppt) throws SQLException, ParseException;
}
