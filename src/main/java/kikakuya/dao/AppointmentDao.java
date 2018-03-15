package kikakuya.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import kikakuya.model.Appointment;

public interface AppointmentDao {
	public boolean insertAppointment(Appointment anAppointment) throws SQLException, ParseException;
	public List<Appointment> findAppointmentsByMonth(int month, int year, int userId) throws SQLException;
	public Appointment findAppointmentById(int id) throws SQLException;
	public boolean updateAppointment(Appointment appt) throws SQLException, ParseException;
}
