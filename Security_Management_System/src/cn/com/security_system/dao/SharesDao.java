package cn.com.security_system.dao;

import java.util.List;

import cn.com.security_system.pojo.Shares;

public interface SharesDao {
	/**
	 * 获取所有的股票列表
	 * @return
	 */
	public List<Shares> getAllShares(String type,String queryStr);
	/**
	 * 根据id查询股票详细信息
	 * @param id
	 * @return
	 */
	public Shares getSharesById(long id);
	/**
	 * 修改股票信息
	 * @param id
	 * @return
	 */
	public boolean updateShares(Shares shares);
	/**
	 * 删除股票信息
	 * @param id
	 * @return
	 */
	public boolean deleteShares(long id);
	/**
	 * 添加股票信息
	 * @param shares
	 * @return
	 */
	public boolean addShares(Shares shares);
	public List<Shares> getByIds(List<Long> ids);

}
