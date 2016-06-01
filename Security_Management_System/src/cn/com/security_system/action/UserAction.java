package cn.com.security_system.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.com.security_system.dao.UserDao;
import cn.com.security_system.pojo.User;

@Component
@Scope
public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private Map<String, Object> responseJson;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Map<String, Object> getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(Map<String, Object> responseJson) {
		this.responseJson = responseJson;
	}

	@Autowired
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String login() {

		responseJson = new HashMap<String, Object>();
		User user;
		try {
			user = userDao.login(username, password);
			Gson gson = new Gson();
			if (null != user && null != user.getUser_id()) {
				//登录成功后将用户id存入session
				ActionContext actionContext = ActionContext.getContext();
				Map<String, Object> session = actionContext.getSession();
				session.put("user_id", user.getUser_id());
				responseJson.put("result", gson.toJson(user));

			} else {
				responseJson.put("result", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String register() {
		responseJson = new HashMap<>();
		try {
			boolean result = userDao.register(username, password);
			if (result) {
				responseJson.put("result", "true");
			} else {
				responseJson.put("result", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
