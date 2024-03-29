package kikakuya.dao.implementation;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;
import java.sql.Connection;

import kikakuya.dao.AppointmentDao;
import kikakuya.model.Appointment;

public class AppointmentDaoImpl implements AppointmentDao {
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	@Override
	public boolean insertAppointment(Appointment anAppt) throws SQLException, ParseException {
		String query = "insert into Appointment (apptDateTime, apptTitle, apptNotes, EventeventId, location, color) "
				+ "values (?,?,?,?,?,?)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		
		pstmt.setTimestamp(1, anAppt.getApptDateTime());
		pstmt.setString(2, anAppt.getTitle());
		pstmt.setString(3,  anAppt.getNotes());
		pstmt.setInt(4, anAppt.getEventId());
		pstmt.setString(5, anAppt.getLocation());
		pstmt.setString(6, anAppt.getColor());
		
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	@Override
	public List<Appointment> findAppointmentsByMonth(int month, int year, int eventId) throws SQLException {
		String query = "select * from Appointment where apptDateTime between '" +year+"-"+(month+1)+"-01' and '" +year+"-"+(month+2) +"-01'" +
						" and eventeventId=" + eventId;
		
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		
		List<Appointment> apptList = new ArrayList<Appointment>();
		while(rs.next()){
			Appointment appt = new Appointment();
			appt.setApptId(rs.getInt(1));
			appt.setTitle(rs.getString(2));
			appt.setDatetime(rs.getTimestamp(3));
			appt.setNotes(rs.getString(4));
			appt.setEventId(rs.getInt(5));
			appt.setLocation(rs.getString(6));
			appt.setColor(rs.getString(7));

			apptList.add(appt);
		}
		
		connection.close();
		return apptList;
	}

	@Override
	public Appointment findAppointmentById(int apptId) throws SQLException {
		String query = "select * from Appointment where apptId=" + apptId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		
		Appointment appt = new Appointment();
		if(rs.next()){
			appt.setApptId(rs.getInt(1));
			appt.setTitle(rs.getString(2));
			appt.setDatetime(rs.getTimestamp(3));
			appt.setNotes(rs.getString(4));
			appt.setEventId(rs.getInt(5));
			appt.setLocation(rs.getString(6));
			appt.setColor(rs.getString(7));
		}
		connection.close();
		return appt;
	}

	@Override
	public boolean updateAppointment(Appointment appt) throws SQLException, ParseException {
		String query = "update Appointment set apptTitle='" + appt.getTitle() +
				"', apptDateTime='" + appt.getApptDateTime() +
				"', apptNotes='" + appt.getNotes() + 
				"', location='" + appt.getLocation() + 
				"', color='" + appt.getColor() +
				"' where apptId=" + appt.getApptId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	@Override
	public boolean deleteAppointment(int apptId) throws SQLException {
		String query = "DELETE FROM Appointment WHERE apptId=" + apptId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}

	@Override
	public List<Appointment> findAppointmentByDay(Calendar date, int eventId) throws SQLException {
		//Build day string
		String day = date.get(Calendar.YEAR) + "-" + (Integer.valueOf(date.get(Calendar.MONTH)) + 1) + "-" + date.get(Calendar.DATE) + " 00:00:00";
		String dayEnd = date.get(Calendar.YEAR) + "-" + (Integer.valueOf(date.get(Calendar.MONTH)) + 1) + "-" + (Integer.valueOf(date.get(Calendar.DATE)) + 1) + " 00:00:00";
		String query = "SELECT * FROM Appointment WHERE apptDateTime >= '" + day
				+ "' and apptDateTime < '" + dayEnd + "' and EventeventId=" + eventId; 
				
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		
		List<Appointment> apptList = new ArrayList<Appointment>();
		while(rs.next()){
			Appointment appt = new Appointment();
			appt.setApptId(rs.getInt(1));
			appt.setTitle(rs.getString(2));
			appt.setDatetime(rs.getTimestamp(3));
			appt.setNotes(rs.getString(4));
			appt.setEventId(rs.getInt(5));
			appt.setLocation(rs.getString(6));
			appt.setColor(rs.getString(7));

			apptList.add(appt);
		}
		
		connection.close();
		return apptList;
	}

}
