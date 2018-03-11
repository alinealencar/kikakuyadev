package kikakuya.dao;

import java.sql.SQLException;
import java.text.ParseException;

import kikakuya.model.Appointment;

public interface AppointmentDao {
	public boolean insertAppointment(Appointment anAppointment) throws SQLException, ParseException;
}
