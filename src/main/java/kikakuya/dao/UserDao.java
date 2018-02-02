/**
 * Interface: UserDao
 * Description: This interface is used to communicate with the database.
 * Data Access Object interfaces define methods for performing CRUD operations in each table.
 */

package kikakuya.dao;

import java.sql.SQLException;

import kikakuya.model.User;

public interface UserDao {
	public User findByEmail(String email) throws SQLException;
	public boolean insertUser(User user) throws SQLException;
//	public boolean updateUser(User user) throws SQLException;
//	public boolean deleteUser(User user) throws SQLException;
}
