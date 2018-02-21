package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import kikakuya.dao.VendorEventDao;
import kikakuya.model.Event;
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
		/*String query = "INSERT INTO vendorevent (EventeventId, VendorvendorId, vendorCategory) "
				+ "SELECT EventeventId, VendorvendorId, vendorCategory "
				+ "WHERE NOT EXISTS(SELECT * FROM vendorevent WHERE VendorvendorId=" + vendor.getVendorId();*/
		String query = "INSERT INTO vendorEvent (EventeventId, VendorvendorId, vendorCategory) VALUES(?,?,?) "
				+ "ON DUPLICATE KEY UPDATE EventeventId=VALUES(EventeventId), VendorvendorId=VALUES(VendorvendorId), vendorCategory=VALUES(vendorCategory)";
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

}
