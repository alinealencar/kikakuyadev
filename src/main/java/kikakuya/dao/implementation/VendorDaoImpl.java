package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.dao.VendorDao;
import kikakuya.model.Vendor;

public class VendorDaoImpl implements VendorDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Vendor> findVendors() throws SQLException {
		String query = "SELECT * FROM vendor";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<Vendor> vendors = new ArrayList<Vendor>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Vendor vendor = new Vendor();
			vendor.setVendorId(rs.getInt(1));
			vendor.setName(rs.getString(2));
			vendor.setAddress(rs.getString(3));
			vendor.setWebsite(rs.getString(4));
			vendor.setPhoneNo(rs.getString(5));
			
			vendors.add(vendor);
		}
		return vendors;	
	}
	
	public boolean insertVendor(Vendor vendor) throws SQLException {
		/*String query = "INSERT INTO vendor (vendorName, website, phone, address) SELECT ?,?,?,? FROM vendor "
				+ "WHERE NOT EXISTS(SELECT * FROM vendor WHERE vendorName='"+ vendor.getName() + "'";*/
		String query = "INSERT INTO vendor (vendorName, website, phone, address) VALUES(?,?,?,?) "
				+ "ON DUPLICATE KEY UPDATE vendorName=VALUES(vendorName), website=VALUES(website), phone=VALUES(phone), address=VALUES(address)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, vendor.getName());
		pstmt.setString(2, vendor.getWebsite());
		pstmt.setString(3, vendor.getPhoneNo());
		pstmt.setString(4, vendor.getAddress());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	
	
}
