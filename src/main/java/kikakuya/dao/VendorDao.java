package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.model.Event;
import kikakuya.model.Good;
import kikakuya.model.Vendor;

public interface VendorDao {
	public boolean insertVendor(Vendor vendor) throws SQLException;
	public Map<String, Map<Vendor, List<Good>>> findBudget(int eventId) throws SQLException;
	public List<Vendor> findVendors(Event event) throws SQLException;
	public int findLastInserted() throws SQLException;
	public boolean deleteVendor(int vendorId) throws SQLException;
	public Vendor findVendor(int vendorId) throws SQLException;
}
