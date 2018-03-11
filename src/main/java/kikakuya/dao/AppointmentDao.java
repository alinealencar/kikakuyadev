package kikakuya.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import kikakuya.model.Appointment;

public interface AppointmentDao {
	public boolean insertAppointment(Appointment anAppointment) throws SQLException, ParseException;
	public List<Appointment> findAppointmentsByMonth(int month, int year) throws SQLException;
}
