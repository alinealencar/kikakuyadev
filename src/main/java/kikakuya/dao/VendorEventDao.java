package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.Event;
import kikakuya.model.Vendor;

public interface VendorEventDao {
	public boolean insertVendorEvent(Vendor vendor, Event event) throws SQLException;
	public int findVendorEventId(Vendor vendor) throws SQLException;
	public boolean deleteVendorEvent(int vendorId) throws SQLException;
	public boolean deleteCategory(int eventId, String category) throws SQLException;
	public boolean updateCategory(Vendor vendor) throws SQLException;
	public boolean isVendorFound(Vendor vendor) throws SQLException;
}
