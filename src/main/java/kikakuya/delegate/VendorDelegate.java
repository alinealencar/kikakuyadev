package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.model.Good;
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
	
	public Map<String, Map<Vendor, List<Good>>> showBudget(int eventId) throws SQLException {
		return vendorService.getBudgetInfo(eventId);
	}
}
