package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Item;
import kikakuya.model.Lists;

public interface ListService {
	public List<Lists> getLists(Event event) throws SQLException;
	public boolean addList(Lists list, Event event) throws SQLException;
	public boolean editList(Lists list) throws SQLException;
	public boolean deleteList(int listId) throws SQLException;
	public Lists getListById(int listId) throws SQLException;
	public List<Item> getItems(Lists list) throws SQLException;
	public boolean addItem(Item item) throws SQLException;
	public boolean editItem(Item item) throws SQLException;
	public boolean editItemStatus(Item item) throws SQLException;
	public boolean deleteItem(int itemId) throws SQLException;
	public boolean checkIfListIsFound(int listId) throws SQLException;
}
