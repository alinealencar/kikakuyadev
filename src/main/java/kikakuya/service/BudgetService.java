package kikakuya.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.model.Event;
import kikakuya.model.Good;
import kikakuya.model.Vendor;

public interface BudgetService {
	
	public boolean addVendor(Vendor vendor) throws SQLException;
	public List<Vendor> getVendors(Event event) throws SQLException;
	public boolean addGood(Good good, int vendorEventId) throws SQLException;
	public boolean addVendorEvent(Vendor vendor, Event event) throws SQLException;
	public int getVendorEventId(Vendor vendor) throws SQLException;
	public Map<String, Map<Vendor, List<Good>>> getBudgetInfo(int eventId) throws SQLException;
	public int getLastInserted() throws SQLException;
	public boolean editGood(Good good) throws SQLException;
}
