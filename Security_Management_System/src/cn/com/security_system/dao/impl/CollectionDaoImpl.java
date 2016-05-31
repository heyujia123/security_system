package cn.com.security_system.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import cn.com.security_system.dao.CollectionDao;
import cn.com.security_system.pojo.Collection;

@Repository
public class CollectionDaoImpl implements CollectionDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Collection> getCollectionByUId(long userId) {
		String sql = "select * from collection where user_id=?";
		return (List<Collection>) jdbcTemplate.query(sql, new Object[] { userId }, new CollectionRowMapper());
	}

	@SuppressWarnings("rawtypes")
	class CollectionRowMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int index) throws SQLException {
			Collection collection = new Collection();
			collection.setId(rs.getLong("id"));
			collection.setUserId(rs.getLong("user_id"));
			collection.setSharesId(rs.getLong("shares_id"));
			return collection;
		}
	}

	@Override
	public boolean addCollection(Collection collection) {
		String sql = "insert into collection(user_id,shares_id) values(?,?)";
		int result = jdbcTemplate.update(sql, new Object[] { collection.getUserId(), collection.getSharesId() });
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteCollection(Collection collection) {
		String sql = "delete from collection where shares_id=?";
		int result = jdbcTemplate.update(sql, new Object[] { collection.getId() });
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

}
