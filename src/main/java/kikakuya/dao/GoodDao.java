package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.Good;


public interface GoodDao {

	public boolean insertGood(Good good, int vendorEventId) throws SQLException;
}
