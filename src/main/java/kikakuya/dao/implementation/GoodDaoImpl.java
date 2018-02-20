package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import kikakuya.dao.GoodDao;
import kikakuya.model.Good;

public class GoodDaoImpl implements GoodDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean insertGood(Good good, int vendorEventId) throws SQLException {
		String query = "Insert into good (goodName, goodPrice, VendorEventvendorEventId) values (?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, good.getGoodName());
		pstmt.setDouble(2, good.getGoodPrice());
		pstmt.setInt(3, vendorEventId);
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

}
