package kikakuya.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import kikakuya.model.Appointment;

public interface CalendarService {
	public boolean addAppointment(Appointment anAppt) throws SQLException, ParseException;
	public List<Appointment> findAppointment (int month, int year) throws SQLException;
}
