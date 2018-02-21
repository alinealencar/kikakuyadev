package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import kikakuya.dao.VendorDao;
import kikakuya.model.Good;
import kikakuya.model.Guest;
import kikakuya.model.Vendor;

public class VendorDaoImpl implements VendorDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Vendor> findVendors() throws SQLException {
		String query = "SELECT * FROM vendor";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<Vendor> vendors = new ArrayList<Vendor>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Vendor vendor = new Vendor();
			vendor.setVendorId(rs.getInt(1));
			vendor.setName(rs.getString(2));
			vendor.setAddress(rs.getString(3));
			vendor.setWebsite(rs.getString(4));
			vendor.setPhoneNo(rs.getString(5));
			
			vendors.add(vendor);
		}
		return vendors;	
	}
	
	public boolean insertVendor(Vendor vendor) throws SQLException {
		String query = "Insert into vendor (vendorName, website, phone, address) values (?,?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, vendor.getName());
		pstmt.setString(2, vendor.getWebsite());
		pstmt.setString(3, vendor.getPhoneNo());
		pstmt.setString(4, vendor.getAddress());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
	
	public Map<String, Map<Vendor, List<Good>>> findBudget(int eventId) throws SQLException {
		String query = "select ev.vendorcategory, v.vendorName, v.website, v.address, v.phone, " +
	"g.goodId, g.goodName, g.goodPrice from event e, vendorevent ev, vendor v, good g " +
	"where ev.eventEventId = e.eventId " +
	"and ev.vendorVendorId = v.vendorId " +
	"and ev.vendorEventId = g.vendorEventVendorEventId " +
	"and e.eventId = " + eventId +
	" order by ev.vendorcategory, v.vendorName";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		Map<String, Map<Vendor, List<Good>>> result = new HashMap<String, Map<Vendor, List<Good>>>();
		ResultSet rs = pstmt.executeQuery(query);
		
		String curCategory = "";
		String curVendor = "";
		List<Good> goodsList = new ArrayList<Good>();
		Map<Vendor, List<Good>> vendorMap = new HashMap<Vendor, List<Good>>();
		Vendor aVendor = new Vendor();
		Good aGood = new Good();
		
		while(rs.next()){
			//Different vendor
			if(!curVendor.equals(rs.getString(2))){
				//Skip very first case
				if(!curVendor.equals("")) {
					vendorMap.put(aVendor, goodsList);
				}
					
				//Create vendor object
				aVendor = new Vendor();
				aVendor.setName(rs.getString(2));
				aVendor.setWebsite(rs.getString(3));
				aVendor.setAddress(rs.getString(4));
				aVendor.setPhoneNo(rs.getString(5));
				curVendor = rs.getString(2);
					
				//Empty list out
				goodsList = new ArrayList<Good>();
					
				if(!curCategory.equals(rs.getString(1))){
					//Skip very first case
					if(!curCategory.equals("")) {
						result.put(curCategory, vendorMap);
						vendorMap = new HashMap<Vendor, List<Good>>();
					}
					curCategory = rs.getString(1);
				}
			}
				
			//Create list of all goods for a certain vendor
			aGood = new Good();
			aGood.setGoodId(rs.getInt(6));
			aGood.setGoodName(rs.getString(7));
			aGood.setGoodPrice(rs.getDouble(8));
			//Add good object to goodsList
			goodsList.add(aGood);
		
		}
		//Handle last entities after loop
		if(!curCategory.equals("")){
			vendorMap.put(aVendor, goodsList);
			result.put(curCategory, vendorMap);
		}

		return result;
	}

	@Override
	public boolean updateGood(Good good) throws SQLException {
		String query = "update good set " +
	"goodName='" + good.getGoodName() + "', " +
	"goodPrice=" + good.getGoodPrice() + " " +
	"where goodId=" + good.getGoodId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return(rowsAffected > 0);
	}
}
