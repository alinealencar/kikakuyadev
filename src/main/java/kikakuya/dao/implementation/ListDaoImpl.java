package kikakuya.dao.implementation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.dao.ListDao;
import kikakuya.model.Event;
import kikakuya.model.Lists;

public class ListDaoImpl implements ListDao{

	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Lists> findLists(Event event) throws SQLException {
		String query = "SELECT * FROM list WHERE EventeventId=" + event.getEventId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		List<Lists> lists = new ArrayList<Lists>();
		ResultSet rs = pstmt.executeQuery(query);
		while(rs.next()){
			Lists list = new Lists();
			list.setListId(rs.getInt(1));
			list.setListTitle(rs.getString(2));
			
			lists.add(list);
		}
		return lists;
	}

	@Override
	public boolean insertList(Lists list, Event event) throws SQLException {
		String query = "INSERT INTO list (listTitle, EventeventId) VALUES (?,?)";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		
		pstmt.setString(1, list.getListTitle());
		pstmt.setInt(2, event.getEventId());
		
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean deleteList(int listId) throws SQLException {
		String query = "DELETE FROM list WHERE listId="+listId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean updateList(Lists list) throws SQLException {
		String query = "UPDATE list SET listTitle = '" + list.getListTitle() +
				"' WHERE listId=" + list.getListId();
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		int rowsAffected = pstmt.executeUpdate();
		
		return rowsAffected > 0;
	}

	@Override
	public Lists findListById(int listId) throws SQLException {
		String query = "SELECT * FROM list WHERE listId="+listId;
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery(query);
		Lists list = new Lists();
		while(rs.next()){
			list.setListId(rs.getInt(1));
			list.setListTitle(rs.getString(2));
		}
		return list;
	}
}
