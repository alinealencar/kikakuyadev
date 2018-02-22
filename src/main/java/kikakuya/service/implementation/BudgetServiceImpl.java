package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kikakuya.dao.GoodDao;
import kikakuya.dao.VendorDao;
import kikakuya.dao.VendorEventDao;
import kikakuya.model.Event;
import kikakuya.model.Good;
import kikakuya.model.Vendor;
import kikakuya.service.BudgetService;

public class BudgetServiceImpl implements BudgetService{

	private VendorDao vendorDao;
	private GoodDao goodDao;
	private VendorEventDao vendorEventDao;

	public GoodDao getGoodDao() {
		return goodDao;
	}

	public void setGoodDao(GoodDao goodDao) {
		this.goodDao = goodDao;
	}

	public VendorDao getVendorDao() {
		return vendorDao;
	}

	public void setVendorDao(VendorDao vendorDao) {
		this.vendorDao = vendorDao;
	}

	public VendorEventDao getVendorEventDao() {
		return vendorEventDao;
	}

	public void setVendorEventDao(VendorEventDao vendorEventDao) {
		this.vendorEventDao = vendorEventDao;
	}

	public boolean addVendor(Vendor vendor) throws SQLException {
		return vendorDao.insertVendor(vendor);
	}
	
	public List<Vendor> getVendors(Event event) throws SQLException {
		return vendorDao.findVendors(event);
	}

	public boolean addGood(Good good, int vendorEventId) throws SQLException {
		return goodDao.insertGood(good, vendorEventId);
	}

	public boolean addVendorEvent(Vendor vendor, Event event) throws SQLException {
		return vendorEventDao.insertVendorEvent(vendor, event);
	}
	
	public int getVendorEventId(Vendor vendor) throws SQLException {
		return vendorEventDao.findVendorEventId(vendor);
	}
	
	@Override
	public Map<String, Map<Vendor, List<Good>>> getBudgetInfo(int eventId) throws SQLException {
		return vendorDao.findBudget(eventId);
	}

	@Override
	public int getLastInserted() throws SQLException {
		return vendorDao.findLastInserted();
	}
	
	public boolean editGood(Good good) throws SQLException {
		return goodDao.updateGood(good);
	}

	@Override
	public boolean deleteGood(int goodId) throws SQLException {
		return goodDao.deleteGood(goodId);
	}

	@Override
	public boolean deleteVendorEvent(int vendorId) throws SQLException {
		return vendorEventDao.deleteVendorEvent(vendorId);
	}
	
	public boolean deleteVendor(int vendorId) throws SQLException {
		return vendorDao.deleteVendor(vendorId);
	}
}
