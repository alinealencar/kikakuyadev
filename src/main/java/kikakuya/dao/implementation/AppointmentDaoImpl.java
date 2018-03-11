package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

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
		
		pstmt.setTimestamp(1, anAppt.getApptDateTime());
		pstmt.setString(2, anAppt.getTitle());
		pstmt.setString(3,  anAppt.getNotes());
		pstmt.setInt(4, anAppt.getUserId());
		pstmt.setString(5, anAppt.getLocation());
		pstmt.setString(6, anAppt.getColor());
		
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}

}
