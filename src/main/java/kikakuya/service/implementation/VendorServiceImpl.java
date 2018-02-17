package kikakuya.service.implementation;

import java.sql.SQLException;

import kikakuya.dao.VendorDao;
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

}
