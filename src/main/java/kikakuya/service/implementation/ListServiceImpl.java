package kikakuya.service.implementation;

import java.sql.SQLException;
import java.util.List;

import kikakuya.dao.ListDao;
import kikakuya.model.Event;
import kikakuya.model.Lists;
import kikakuya.service.ListService;

public class ListServiceImpl implements ListService{

	private ListDao listDao;
	
	
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
	
	

}
