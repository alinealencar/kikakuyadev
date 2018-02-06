package kikakuya.dao.implementation;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import kikakuya.dao.GuestDao;
import kikakuya.model.Guest;

public class GuestDaoImpl implements GuestDao {
	DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Guest> findGuests() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean insertGuest(Guest guest) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean updateGuest(Guest guest) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deleteGuest(Guest guest) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
