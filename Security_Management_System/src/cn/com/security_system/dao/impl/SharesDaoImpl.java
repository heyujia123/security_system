package cn.com.security_system.dao.impl;

import java.awt.peer.TrayIconPeer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import cn.com.security_system.dao.SharesDao;
import cn.com.security_system.pojo.Shares;

@Repository
public class SharesDaoImpl implements SharesDao {
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
	public List<Shares> getAllShares(String type,String queryStr) {
		System.out.println("type:"+type+" queryStr:"+queryStr);
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("select * from shares");
		if(type.equals(null)||type.equals("")){
			sBuffer.append(" order by id desc");
			String sql=sBuffer.toString();
			return (List<Shares>) jdbcTemplate.query(sql, new SharesRowMapper());
		}else{
			if(type.equals("number")){
				sBuffer.append(" where number=? order by id desc");
			}else if(type.equals("name")){
				sBuffer.append(" where name=? order by id desc");
			}else if(type.equals("category")){
				sBuffer.append(" where category=? order by id desc");
			}else if(type.equals("module")){
				sBuffer.append(" where module=? order by id desc");
			}else if(type.equals("service")){
				sBuffer.append(" where service=? order by id desc");
			}else if(type.equals("subService")){
				sBuffer.append(" where sub_service=? order by id desc");
			}else if(type.equals("coreProduct")){
				sBuffer.append(" where core_product=? order by id desc");
			}else if(type.equals("positiveFactors")){
				sBuffer.append(" where positive_factors like %?% order by id desc");
			}else if(type.equals("nagetiveFactors")){
				sBuffer.append(" where nagetive_factors like %?% order by id desc");
			}else if(type.equals("positiveMonth")){
				sBuffer.append(" where positive_month=? order by id desc");
			}
			String sql=sBuffer.toString();
			return (List<Shares>) jdbcTemplate.query(sql, new Object[] { queryStr },new SharesRowMapper());
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public Shares getSharesById(long id) {
		String sql = "select * from shares where id=?";
		return (Shares) jdbcTemplate.query(sql, new Object[] { id }, new SharesRowMapper()).get(0);
	}

	@SuppressWarnings("rawtypes")
	class SharesRowMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int index) throws SQLException {
			Shares shares = new Shares();
			shares.setId(rs.getLong("id"));
			shares.setName(rs.getString("name"));
			shares.setNumber(rs.getLong("number"));
			shares.setCategory(rs.getString("category"));
			shares.setModule(rs.getString("module"));
			shares.setService(rs.getString("service"));
			shares.setSubService(rs.getString("sub_service"));
			shares.setCoreProduct(rs.getString("core_product"));
			shares.setPositiveFactors(rs.getString("positive_factors"));
			shares.setNagetiveFactors(rs.getString("nagetive_factors"));
			shares.setPositiveMonth(rs.getString("positive_month"));
			return shares;
		}
	}

	@Override
	public boolean updateShares(Shares shares) {
		String sql = "update shares set number=?,name=?,category=?,module=?,service=?,sub_service=?,core_product=? ,positive_factors=?,nagetive_factors=?,positive_month=? where id=?";
		int result = jdbcTemplate.update(sql,
				new Object[] { shares.getNumber(), shares.getName(), shares.getCategory(), shares.getModule(),
						shares.getService(), shares.getSubService(), shares.getCoreProduct(),
						shares.getPositiveFactors(), shares.getNagetiveFactors(), shares.getPositiveMonth(),
						shares.getId() });
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteShares(long id) {
		String sql = "delete from shares where id=?";
		int result = jdbcTemplate.update(sql, new Object[] { id });
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addShares(Shares shares) {
		String sql = "insert into shares(number,name,category,module,service,sub_service,core_product,positive_factors,nagetive_factors,positive_month) values(?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,
				new Object[] { shares.getNumber(), shares.getName(), shares.getCategory(), shares.getModule(),
					 shares.getService(), shares.getSubService(), shares.getCoreProduct(),
						shares.getPositiveFactors(), shares.getNagetiveFactors(), shares.getPositiveMonth() });
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shares> getByIds(List<Long> ids) {
		String sql = "select * from shares where id in "+convert(ids);
		return (List<Shares>) jdbcTemplate.query(sql, new SharesRowMapper());
	}

	private String convert(List<Long> list) {
		StringBuffer sb = new StringBuffer();
		sb.append("(");
		for (int i = 0; i < list.size(); i++) {
			if (i != list.size() - 1) {
				sb.append(list.get(i)).append(",");
			} else {
				sb.append(list.get(i));
			}
		}
		sb.append(")");
		System.out.println("select * from shares where id in "+sb.toString());
		return sb.toString();
	}

}
