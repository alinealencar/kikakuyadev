package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

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
		String query = "insert into appointment (apptDateTime, apptTitle, apptNotes, UseruserId, location, color) "
				+ "values (?,?,?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		
		System.out.println(anAppt);
		
		pstmt.setTimestamp(1, anAppt.getApptDateTime());
		pstmt.setString(2, anAppt.getTitle());
		pstmt.setString(3,  anAppt.getNotes());
		pstmt.setInt(4, anAppt.getUserId());
		pstmt.setString(5, anAppt.getLocation());
		pstmt.setString(6, anAppt.getColor());
		
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}

	@Override
	public List<Appointment> findAppointmentsByMonth(int month, int year) throws SQLException {
		String query = "select * from appointment where apptDateTime between '" +year+"-"+(month+1)+"-01' and '" +year+"-"+(month+2) +"-01'";
		
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		
		List<Appointment> apptList = new ArrayList<Appointment>();
		while(rs.next()){
			Appointment appt = new Appointment();
			appt.setApptId(rs.getInt(1));
			appt.setTitle(rs.getString(2));
			appt.setDatetime(rs.getTimestamp(3));
			appt.setNotes(rs.getString(4));
			appt.setUserId(rs.getInt(5));
			appt.setLocation(rs.getString(6));
			appt.setColor(rs.getString(7));

			apptList.add(appt);
		}
		
		return apptList;
	}

}