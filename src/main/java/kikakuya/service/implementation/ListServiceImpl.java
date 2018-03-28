package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;

import kikakuya.dao.ItemDao;
import kikakuya.dao.ListDao;
import kikakuya.model.Event;
import kikakuya.model.Item;
import kikakuya.model.Lists;
import kikakuya.service.ListService;

public class ListServiceImpl implements ListService{

	private ListDao listDao;
	private ItemDao itemDao;

	public ItemDao getItemDao() {
		return itemDao;
	}

	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	public ListDao getListDao() {
		return listDao;
	}

	public void setListDao(ListDao listDao) {
		this.listDao = listDao;
	}

	@Override
	public List<Lists> getLists(Event event) throws SQLException {
		return listDao.findLists(event);
	}

	@Override
	public boolean addList(Lists list, Event event) throws SQLException {
		return listDao.insertList(list, event);
	}

	@Override
	public boolean deleteList(int listId) throws SQLException {
		return listDao.deleteList(listId);
	}

	@Override
	public boolean editList(Lists list) throws SQLException {
		return listDao.updateList(list);
	}

	@Override
	public Lists getListById(int listId) throws SQLException {
		return listDao.findListById(listId);
	}
	
	@Override
	public List<Item> getItems(Lists list) throws SQLException {
		return itemDao.findItems(list);
	}

	@Override
	public boolean addItem(Item item) throws SQLException {
		return itemDao.insertItem(item);
	}

	@Override
	public boolean editItem(Item item) throws SQLException {
		return itemDao.updateItem(item);
	}
	
	@Override
	public boolean editItemStatus(Item item) throws SQLException {
		return itemDao.updateItemStatus(item);
	}

	@Override
	public boolean deleteItem(int itemId) throws SQLException {
		return itemDao.deleteItem(itemId);
	}

	@Override
	public boolean checkIfListIsFound(Lists list, int eventId) throws SQLException {
		return listDao.isListFound(list, eventId);
	}

	@Override
	public boolean checkIfListFoundEdit(Lists list, int eventId) throws SQLException {
		return listDao.isListFoundEdit(list, eventId);
	}

}
