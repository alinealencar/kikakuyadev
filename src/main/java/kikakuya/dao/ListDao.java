package kikakuya.dao;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Event;
import kikakuya.model.Lists;

public interface ListDao {
	public List<Lists> findLists(Event event) throws SQLException;
	public boolean insertList(Lists list, Event event) throws SQLException;
	public boolean updateList(Lists list) throws SQLException;
	public boolean deleteList(int listId) throws SQLException;
	public Lists findListById(int listId) throws SQLException;
	public boolean isListFound(Lists list) throws SQLException;
}
