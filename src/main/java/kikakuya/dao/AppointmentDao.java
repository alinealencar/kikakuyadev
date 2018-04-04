package kikakuya.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

import kikakuya.model.Appointment;

public interface AppointmentDao {
	public boolean insertAppointment(Appointment anAppointment) throws SQLException, ParseException;
	public List<Appointment> findAppointmentsByMonth(int month, int year, int eventId) throws SQLException;
	public Appointment findAppointmentById(int id) throws SQLException;
	public boolean updateAppointment(Appointment appt) throws SQLException, ParseException;
	public boolean deleteAppointment(int apptId) throws SQLException;
	public List<Appointment> findAppointmentByDay(Calendar date, int eventId) throws SQLException;
}
