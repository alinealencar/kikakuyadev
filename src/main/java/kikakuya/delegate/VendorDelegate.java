package kikakuya.delegate;

import java.sql.SQLException;

import kikakuya.model.Vendor;
import kikakuya.service.VendorService;

public class VendorDelegate {

	VendorService vendorService;

	public VendorService getVendorService() {
		return vendorService;
	}

	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}

	public boolean addVendor(Vendor vendor) throws SQLException {
		return vendorService.addVendor(vendor);
	}
	
	
}
