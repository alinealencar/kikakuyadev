package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Vendor;

public interface VendorDao {

	public boolean insertVendor(Vendor vendor) throws SQLException;
	public List<Vendor> findVendors() throws SQLException;
}
