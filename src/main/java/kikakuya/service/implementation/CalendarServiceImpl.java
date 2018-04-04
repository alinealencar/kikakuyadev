package kikakuya.service.implementation;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

import kikakuya.dao.AppointmentDao;
import kikakuya.model.Appointment;
import kikakuya.service.CalendarService;

public class CalendarServiceImpl implements CalendarService {

	private AppointmentDao apptDao;
	
	public AppointmentDao getApptDao() {
		return apptDao;
	}

	public void setApptDao(AppointmentDao apptDao) {
		this.apptDao = apptDao;
	}

	
	@Override
	public boolean addAppointment(Appointment anAppt) throws SQLException, ParseException {
		return apptDao.insertAppointment(anAppt);
	}

	@Override
	public List<Appointment> findAppointments(int month, int year, int eventId) throws SQLException {
		return apptDao.findAppointmentsByMonth(month, year, eventId);
	}

	@Override
	public Appointment findAppointment(int apptId) throws SQLException {
		return apptDao.findAppointmentById(apptId);
	}

	@Override
	public boolean editAppointment(Appointment appt) throws SQLException, ParseException {
		return apptDao.updateAppointment(appt);
	}

	@Override
	public boolean deleteAppointment(int apptId) throws SQLException {
		return apptDao.deleteAppointment(apptId);
	}

	@Override
	public List<Appointment> findAppointmentsByDay(Calendar date, int eventId) throws SQLException {
		return apptDao.findAppointmentByDay(date, eventId);
	}

}
