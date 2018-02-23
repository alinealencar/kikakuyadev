package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

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
		//String query = "INSERT INTO vendorEvent (EventeventId, VendorvendorId, vendorCategory) VALUES(?,?,?) "
		//		+ "ON DUPLICATE KEY UPDATE EventeventId=VALUES(EventeventId), VendorvendorId=VALUES(VendorvendorId), vendorCategory=VALUES(vendorCategory)";
		String query = "INSERT INTO vendorEvent (EventeventId, VendorvendorId, vendorCategory) VALUES(?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setInt(1, event.getEventId());
		pstmt.setInt(2, vendor.getVendorId());
		pstmt.setString(3, vendor.getCategory());
		
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
	
	public int findVendorEventId(Vendor vendor) throws SQLException {
		String query = "SELECT vendorEventId from vendorevent WHERE VendorvendorId=" + vendor.getVendorId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		int vendorEventId=0;
		while(rs.next()){
			vendorEventId = rs.getInt(1);
		}
		return vendorEventId;
	}

	@Override
	public boolean deleteVendorEvent(int vendorId) throws SQLException {
		String query = "delete from vendorevent where VendorvendorId=" + vendorId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean deleteCategory(int eventId, String category) throws SQLException {
		String query = "delete from vendorevent where EventeventId=" + eventId + 
				" and vendorCategory='" + category + "'";
		System.out.println(query);
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}
	
	public boolean updateCategory(Vendor vendor) throws SQLException {
		String query = "UPDATE vendorevent SET vendorCategory='" + vendor.getCategory() + "'"
				+ "WHERE vendorCategory IS NULL";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}
	
	public boolean isVendorFound(Vendor vendor) throws SQLException{
		String query = "SELECT COUNT(*) FROM vendorevent WHERE VendorvendorId=" + vendor.getVendorId() 
				+ " AND (vendorCategory='" + vendor.getCategory() + "' OR vendorCategory IS NULL)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		if(rs.next())
			rs.getInt(1);
		if(rs.getInt(1) > 0)
			return true;
		else
			return false;
	}

}
