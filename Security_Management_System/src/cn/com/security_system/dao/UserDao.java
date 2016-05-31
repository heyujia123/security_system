package cn.com.security_system.dao;

import cn.com.security_system.pojo.User;

public interface UserDao {
	public User login(String username, String password) throws Exception;

	public boolean register(String username, String password);
}
