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
		String query = "SELECT v.vendorId, v.vendorName, v.address, v.website, v.phone "
				+ "FROM vendor v, vendorevent ev WHERE v.vendorId = ev.VendorvendorId";
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
		/*String query = "INSERT INTO vendor (vendorName, website, phone, address) SELECT ?,?,?,? FROM vendor "
				+ "WHERE NOT EXISTS(SELECT * FROM vendor WHERE vendorName='"+ vendor.getName() + "'";*/
		String query = "INSERT INTO vendor (vendorName, website, phone, address) VALUES(?,?,?,?) "
				+ "ON DUPLICATE KEY UPDATE vendorName=VALUES(vendorName), website=VALUES(website), phone=VALUES(phone), address=VALUES(address)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, vendor.getName());
		pstmt.setString(2, vendor.getWebsite());
		pstmt.setString(3, vendor.getPhoneNo());
		pstmt.setString(4, vendor.getAddress());
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
	
	public Map<String, Map<Vendor, List<Good>>> findBudget(int eventId) throws SQLException {
		String query = "select ev.vendorcategory, ev.vendoreventId," + 
				" v.vendorId, v.vendorName, v.website, v.address, v.phone, " +
				"g.goodId, g.goodName, g.goodPrice from event e, vendorevent ev, vendor v, good g " +
				"where ev.eventEventId = e.eventId " +
				"and ev.vendorVendorId = v.vendorId " +
				"and ev.vendorEventId = g.vendorEventVendorEventId " +
				"and e.eventId = " + eventId +
				" order by ev.vendorcategory, v.vendorName";
		
		System.out.println(query);
		
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
			if(curVendor != null || !curVendor.equals(rs.getString(4))){
				//Skip very first case
				if(curVendor == null || !curVendor.equals("")) {
					vendorMap.put(aVendor, goodsList);
				}
					
				//Create vendor object
				aVendor = new Vendor();
				aVendor.setVendorId(rs.getInt(3));
				aVendor.setName(rs.getString(4));
				aVendor.setWebsite(rs.getString(5));
				aVendor.setAddress(rs.getString(6));
				aVendor.setPhoneNo(rs.getString(7));
				curVendor = rs.getString(4);
					
				//Empty list out
				goodsList = new ArrayList<Good>();
					
				if(curCategory != null || !curCategory.equals(rs.getString(1))){
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
			aGood.setGoodId(rs.getInt(8));
			aGood.setGoodName(rs.getString(9));
			aGood.setGoodPrice(rs.getDouble(10));
			//Add good object to goodsList
			goodsList.add(aGood);
		
		}
		//Handle last entities after loop
		if(curCategory == null || !curCategory.equals("")){
			vendorMap.put(aVendor, goodsList);
			result.put(curCategory, vendorMap);
		}

		return result;
	}
	
	public int findLastInserted() throws SQLException {
		String query = "SELECT vendorId from vendor WHERE vendorId=(SELECT MAX(vendorId) FROM vendor)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		int vendorId=0;
		while(rs.next()){
			vendorId = rs.getInt(1);
		}
		return vendorId;
	}

	@Override
	public boolean deleteVendor(int vendorId) throws SQLException {
		String query = "delete from vendor where vendorId=" + vendorId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}
}
