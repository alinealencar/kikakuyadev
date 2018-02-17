package kikakuya.service;

import java.sql.SQLException;

import kikakuya.model.Vendor;

public interface VendorService {
	
	public boolean addVendor(Vendor vendor) throws SQLException;
}
