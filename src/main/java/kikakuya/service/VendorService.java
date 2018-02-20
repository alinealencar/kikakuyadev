package kikakuya.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.model.Good;
import kikakuya.model.Vendor;

public interface VendorService {
	public boolean addVendor(Vendor vendor) throws SQLException;
	public Map<String, Map<Vendor, List<Good>>> getBudgetInfo(int eventId) throws SQLException;
}
