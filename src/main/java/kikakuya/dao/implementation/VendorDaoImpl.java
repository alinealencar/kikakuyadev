package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import java.sql.Connection;

import kikakuya.dao.VendorDao;
import kikakuya.model.Event;
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
	
	public List<Vendor> findVendors(Event event) throws SQLException {
		//String query = "SELECT v.vendorId, v.vendorName, v.address, v.website, v.phone "
		//		+ "FROM vendor v, vendorevent ev WHERE v.vendorId = ev.VendorvendorId";
		String query = "SELECT DISTINCT Vendor.vendorId, Vendor.vendorName FROM Vendor INNER JOIN VendorEvent "
				+ "ON Vendor.vendorId = VendorEvent.VendorvendorId "
				+ "WHERE VendorEvent.EventeventId=" + event.getEventId();
				//+ " ORDER BY vendor.vendorId ASC";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		List<Vendor> vendors = new ArrayList<Vendor>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Vendor vendor = new Vendor();
			vendor.setVendorId(rs.getInt(1));
			vendor.setName(rs.getString(2));
			//vendor.setAddress(rs.getString(3));
			//vendor.setWebsite(rs.getString(4));
			//vendor.setPhoneNo(rs.getString(5));
			
			vendors.add(vendor);
		}
		connection.close();
		return vendors;	
	}
	
	public boolean insertVendor(Vendor vendor) throws SQLException {
		/*String query = "INSERT INTO vendor (vendorName, website, phone, address) SELECT ?,?,?,? FROM vendor "
				+ "WHERE NOT EXISTS(SELECT * FROM vendor WHERE vendorName='"+ vendor.getName() + "'";*/
		String query = "INSERT INTO Vendor (vendorName, website, phone, address) VALUES(?,?,?,?) "
				+ "ON DUPLICATE KEY UPDATE vendorName=VALUES(vendorName), website=VALUES(website), phone=VALUES(phone), address=VALUES(address)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, vendor.getName());
		pstmt.setString(2, vendor.getWebsite());
		pstmt.setString(3, vendor.getPhoneNo());
		pstmt.setString(4, vendor.getAddress());
		int rowsAffected = pstmt.executeUpdate();
		connection.close();
		return rowsAffected > 0;
	}
	
	public Map<String, Map<Vendor, List<Good>>> findBudget(int eventId) throws SQLException {
		String query = "select ev.vendorcategory, ev.vendoreventId," + 
				" v.vendorId, v.vendorName, v.website, v.address, v.phone, " +
				"g.goodId, g.goodName, g.goodPrice from Event e, VendorEvent ev, Vendor v, Good g " +
				"where ev.eventEventId = e.eventId " +
				"and ev.vendorVendorId = v.vendorId " +
				"and ev.vendorEventId = g.vendorEventVendorEventId " +
				"and e.eventId = " + eventId +
				" order by ev.vendorcategory, v.vendorName";
		
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		Map<String, Map<Vendor, List<Good>>> result = new HashMap<String, Map<Vendor, List<Good>>>();
		ResultSet rs = pstmt.executeQuery(query);
		
		String curCategory = "";
		String curVendor = "";
		List<Good> goodsList = new ArrayList<Good>();
		Map<Vendor, List<Good>> vendorMap = new HashMap<Vendor, List<Good>>();
		Vendor aVendor = new Vendor();
		Good aGood = new Good();
		
		while(rs.next()){
			if(!curCategory.equals(rs.getString(1))){
				//Skip very first case
				if(!curCategory.equals("")) {
					vendorMap.put(aVendor, goodsList);
					result.put(curCategory, vendorMap);
					vendorMap = new HashMap<Vendor, List<Good>>();
				}
				
				curCategory = rs.getString(1);
				curVendor = "";
			}
				//Different vendor
				if(!curVendor.equals(rs.getString(4))){
					//Skip very first case
					if(!curVendor.equals("")) {
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
		if(!curCategory.equals("")){
			vendorMap.put(aVendor, goodsList);
			result.put(curCategory, vendorMap);
		}

		connection.close();
		return result;
	}
	
	public int findLastInserted() throws SQLException {
		String query = "SELECT vendorId from Vendor WHERE vendorId=(SELECT MAX(vendorId) FROM Vendor)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		int vendorId=0;
		while(rs.next()){
			vendorId = rs.getInt(1);
		}
		connection.close();
		return vendorId;
	}

	@Override
	public boolean deleteVendor(int vendorId) throws SQLException {
		String query = "delete from Vendor where vendorId=" + vendorId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		connection.close();
		return rowsAffected > 0;
	}

	@Override
	public Vendor findVendor(int vendorId) throws SQLException {
		String query = "select * from Vendor where vendorId=" + vendorId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Vendor aVendor = new Vendor();
		if(rs.next()){
			aVendor.setName(rs.getString(2));
			aVendor.setWebsite(rs.getString(3));
			aVendor.setPhoneNo(rs.getString(4));
			aVendor.setAddress(rs.getString(5));
		}
		connection.close();
		return aVendor;
	}
}
