package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	
	public boolean insertVendor(Vendor vendor) throws SQLException {
		String query = "Insert into vendor (vendorName, address, website, phone) values (?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, vendor.getName());
		pstmt.setString(2, vendor.getAddress());
		pstmt.setString(3, vendor.getWebsite());
		pstmt.setString(4, vendor.getPhoneNo());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	
}
