package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kikakuya.dao.VendorDao;
import kikakuya.model.Good;
import kikakuya.model.Vendor;
import kikakuya.service.VendorService;

public class VendorServiceImpl implements VendorService{

	private VendorDao vendorDao;
	
	public VendorDao getVendorDao() {
		return vendorDao;
	}

	public void setVendorDao(VendorDao vendorDao) {
		this.vendorDao = vendorDao;
	}

	public boolean addVendor(Vendor vendor) throws SQLException {
		return vendorDao.insertVendor(vendor);
	}

	@Override
	public Map<String, Map<Vendor, List<Good>>> getBudgetInfo(int eventId) throws SQLException {
		return vendorDao.findBudget(eventId);
	}

}
