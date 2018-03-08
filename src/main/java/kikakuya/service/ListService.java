package kikakuya.service;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Lists;

public interface ListService {
	public List<Lists> getLists(Event event) throws SQLException;
	public boolean addList(Lists list, Event event) throws SQLException;
	public boolean editList(Lists list) throws SQLException;
	public boolean deleteList(int listId) throws SQLException;
}
