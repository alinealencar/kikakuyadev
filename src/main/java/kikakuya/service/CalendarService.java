package kikakuya.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

import kikakuya.model.Appointment;

public interface CalendarService {
	public boolean addAppointment(Appointment anAppt) throws SQLException, ParseException;
	public List<Appointment> findAppointments (int month, int year, int userId) throws SQLException;
	public Appointment findAppointment(int apptId) throws SQLException;
	public boolean editAppointment(Appointment appt) throws SQLException, ParseException;
	public boolean deleteAppointment(int apptId) throws SQLException;
	public List<Appointment> findAppointmentsByDay(Calendar date) throws SQLException;
}
