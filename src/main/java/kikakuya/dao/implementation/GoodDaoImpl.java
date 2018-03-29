package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;
import java.sql.Connection;

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
		String query = "Insert into Good (goodName, goodPrice, VendorEventvendorEventId) values (?,?,?)";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, good.getGoodName());
		pstmt.setDouble(2, good.getGoodPrice());
		pstmt.setInt(3, vendorEventId);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}

	@Override
	public boolean deleteGood(int goodId) throws SQLException {
		String query = "delete from Good where goodId=" + goodId;
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return rowsAffected > 0;
	}
	
	@Override
	public boolean updateGood(Good good) throws SQLException {
		String query = "update Good set " +
	"goodName='" + good.getGoodName() + "', " +
	"goodPrice=" + good.getGoodPrice() + " " +
	"where goodId=" + good.getGoodId();
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		connection.close();
		return(rowsAffected > 0);
	}

	@Override
	public int goodsByVendor(int vendorId) throws SQLException {
		String query = "select count(*) as numOfGoods from Good where vendoreventvendoreventId in "
				+ "(select vendoreventId from VendorEvent where vendorvendorId=" + vendorId + ")";
		Connection connection = dataSource.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		if(rs.first()){
			connection.close();
			return (rs.getInt(1));
		}
		else {
			connection.close();
			return 0;
		}
	}
	
}
