package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Item;
import kikakuya.model.Lists;

public interface ItemDao {
	public List<Item> findItems(Lists list) throws SQLException;
	public boolean insertItem(Item item) throws SQLException;
	public boolean updateItem(Item item) throws SQLException;
	public boolean deleteItem(int itemId) throws SQLException;
	boolean updateItemStatus(Item item) throws SQLException;
}
