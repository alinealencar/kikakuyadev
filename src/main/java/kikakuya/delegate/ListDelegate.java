package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Item;
import kikakuya.model.Lists;
import kikakuya.service.ListService;

public class ListDelegate {
	
	private ListService listService;

	public ListService getListService() {
		return listService;
	}

	public void setListService(ListService listService) {
		this.listService = listService;
	}

	public List<Lists> getLists(Event event) throws SQLException {
		return listService.getLists(event);
	}

	public boolean addList(Lists list, Event event) throws SQLException {
		return listService.addList(list, event);
	}
	
	public boolean editList(Lists list) throws SQLException {
		return listService.editList(list);
	}

	public boolean deleteList(int listId) throws SQLException {
		return listService.deleteList(listId);
	}

	public Lists getListById(int listId) throws SQLException {
		return listService.getListById(listId);
	}

	public List<Item> getItems(Lists list) throws SQLException {
		return listService.getItems(list);
	}

	public boolean addItem(Item item) throws SQLException {
		return listService.addItem(item);
	}

	public boolean editItem(Item item) throws SQLException {
		return listService.editItem(item);
	}
	
	public boolean editItemStatus(Item item) throws SQLException {
		return listService.editItemStatus(item);
	}

	public boolean deleteItem(int itemId) throws SQLException {
		return listService.deleteItem(itemId);
	}
	
	public boolean checkIfListExists(Lists list) throws SQLException {
		return listService.checkIfListIsFound(list);
	}

}
