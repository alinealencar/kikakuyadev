package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.model.Event;
import kikakuya.model.Good;
import kikakuya.model.Vendor;
import kikakuya.service.BudgetService;
import kikakuya.service.EventService;

public class BudgetDelegate {

	BudgetService budgetService;
	EventService eventService;
	
	public BudgetService getBudgetService() {
		return budgetService;
	}

	public void setBudgetService(BudgetService budgetService) {
		this.budgetService = budgetService;
	}

	public EventService getEventService() {
		return eventService;
	}

	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	public List<Vendor> getVendors() throws SQLException {
		return budgetService.getVendors();
	}
	
	public boolean addVendor(Vendor vendor) throws SQLException {
		return budgetService.addVendor(vendor);
	}
	
	public boolean addGood(Good good, int vendorEventId) throws SQLException {
		return budgetService.addGood(good, vendorEventId);
	}

	public boolean addVendorEvent(Vendor vendor, Event event) throws SQLException {
		return budgetService.addVendorEvent(vendor, event);
	}
	
	public int getVendorEventId(Vendor vendor) throws SQLException {
		return budgetService.getVendorEventId(vendor);
	}
	
	public Map<String, Map<Vendor, List<Good>>> showBudget(int eventId) throws SQLException {
		return budgetService.getBudgetInfo(eventId);
	}
	
	public int findLastInserted() throws SQLException {
		return budgetService.getLastInserted();
	}

	public boolean editGood(Good good) throws SQLException {
		return budgetService.editGood(good);
	}
	
	public boolean editTotalBudget(int eventId, double totalBudget) throws SQLException {
		return eventService.editTotalBudget(eventId, totalBudget);
	}
	
	public boolean deleteGood(int goodId) throws SQLException {
		return budgetService.deleteGood(goodId);
	}
	
	public boolean deleteVendorEvent(int vendorEventId) throws SQLException {
		return budgetService.deleteVendorEvent(vendorEventId);
	}
	
	public boolean deleteVendor(int vendorId) throws SQLException {
		return budgetService.deleteVendor(vendorId);
	}
}

