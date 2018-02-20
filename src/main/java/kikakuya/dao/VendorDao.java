package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.model.Good;
import kikakuya.model.Vendor;

public interface VendorDao {
	public boolean insertVendor(Vendor vendor) throws SQLException;
	public Map<String, Map<Vendor, List<Good>>> findBudget(int eventId) throws SQLException;
}
