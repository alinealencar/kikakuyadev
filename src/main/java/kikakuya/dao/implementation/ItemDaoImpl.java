package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.dao.ItemDao;
import kikakuya.model.Item;
import kikakuya.model.Lists;

public class ItemDaoImpl implements ItemDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public List<Item> findItems(Lists list) throws SQLException {
		String query = "SELECT * FROM Item WHERE ListlistId=" + list.getListId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<Item> items = new ArrayList<Item>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Item item = new Item();
			item.setItemId(rs.getInt(1));
			item.setItemName(rs.getString(2));
			item.setItemStatus(rs.getInt(3));
			
			items.add(item);
		}
		return items;
	}

	@Override
	public boolean insertItem(Item item) throws SQLException {
		String query = "INSERT INTO Item (itemName, itemStatus, ListlistId) VALUES (?,?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		
		pstmt.setString(1, item.getItemName());
		pstmt.setInt(2, item.getItemStatus());
		pstmt.setInt(3, item.getListIdFK());
		
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean updateItem(Item item) throws SQLException {
		String query = "UPDATE Item SET itemName = '" + item.getItemName() + 
				"' WHERE itemId=" + item.getItemId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}
	
	@Override
	public boolean updateItemStatus(Item item) throws SQLException {
		String query = "UPDATE Item SET itemStatus=" + item.getItemStatus() + 
				" WHERE itemId=" + item.getItemId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	@Override
	public boolean deleteItem(int itemId) throws SQLException {
		String query = "DELETE FROM Item WHERE itemId="+itemId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

}
