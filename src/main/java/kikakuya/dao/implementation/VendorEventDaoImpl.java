package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;
import java.sql.Connection;

import kikakuya.dao.VendorEventDao;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.Vendor;

public class VendorEventDaoImpl implements VendorEventDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean insertVendorEvent(Vendor vendor, Event event) throws SQLException {
		String query = "INSERT INTO VendorEvent (EventeventId, VendorvendorId, vendorCategory) VALUES(?,?,?)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, event.getEventId());
		pstmt.setInt(2, vendor.getVendorId());
		pstmt.setString(3, vendor.getCategory());
		
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	public int findVendorEventId(Vendor vendor) throws SQLException {
		String query = "SELECT vendorEventId from VendorEvent WHERE VendorvendorId=" + vendor.getVendorId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		int vendorEventId=0;
		while(rs.next()){
			vendorEventId = rs.getInt(1);
		}
		
		connection.close();
		return vendorEventId;
	}

	@Override
	public boolean deleteVendorEvent(int vendorId) throws SQLException {
		String query = "delete from VendorEvent where VendorvendorId=" + vendorId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}

	@Override
	public boolean deleteCategory(int eventId, String category) throws SQLException {
		String query = "delete from VendorEvent where EventeventId=" + eventId + 
				" and vendorCategory='" + category + "'";
		System.out.println(query);
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	public boolean updateCategory(Vendor vendor) throws SQLException {
		String query = "UPDATE VendorEvent SET vendorCategory='" + vendor.getCategory() + "'"
				+ "WHERE vendorCategory IS NULL";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}
	
	public boolean isVendorFound(Vendor vendor) throws SQLException{
		String query = "SELECT COUNT(*) FROM VendorEvent WHERE VendorvendorId=" + vendor.getVendorId() 
				+ " AND (vendorCategory='" + vendor.getCategory() + "' OR vendorCategory IS NULL)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		if(rs.next())
			rs.getInt(1);
		if(rs.getInt(1) > 0){
			connection.close();
			return true;
		}
		else{
			connection.close();
			return false;
		}
	}

}
