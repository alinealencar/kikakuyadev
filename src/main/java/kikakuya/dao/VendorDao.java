package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.Vendor;

public interface VendorDao {

	public boolean insertVendor(Vendor vendor) throws SQLException;
}
