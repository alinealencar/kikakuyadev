package kikakuya.service.implementation;

import java.sql.SQLException;
import java.text.ParseException;

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

}
