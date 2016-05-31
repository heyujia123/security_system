package cn.com.security_system.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;
import cn.com.security_system.dao.UserDao;
import cn.com.security_system.pojo.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public User login(String username, String password) throws Exception {
		String sql = "select * from user where user_name=? and password=?";
		final User user = new User();
		jdbcTemplate.query(sql, new Object[] { username, password }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				user.setUser_id(rs.getString("id"));
				user.setUsername(rs.getString("user_name"));
				user.setPassword(rs.getString("password"));
			}
		});
		return user;
	}

	@Override
	public boolean register(String username, String password) {
		String sql = "insert into user(user_name,password) values(?,?)";
		int result = jdbcTemplate.update(sql, new Object[] { username, password });
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
}
