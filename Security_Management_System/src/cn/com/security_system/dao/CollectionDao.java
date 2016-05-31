package cn.com.security_system.dao;

import java.util.List;

import cn.com.security_system.pojo.Collection;

public interface CollectionDao {
	/**
	 * 根据用户id获取收藏信息
	 * @param userId
	 * @return
	 */
	public List<Collection> getCollectionByUId(long userId);
	/**
	 * 添加收藏
	 * @param collection
	 * @return
	 */
	public boolean addCollection(Collection collection);
	/**
	 * 删除收藏
	 * @param collection
	 * @return
	 */
	public boolean deleteCollection(Collection collection);
	
}
