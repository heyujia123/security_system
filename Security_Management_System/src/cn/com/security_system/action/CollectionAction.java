package cn.com.security_system.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.com.security_system.dao.CollectionDao;
import cn.com.security_system.dao.SharesDao;
import cn.com.security_system.pojo.Collection;
import cn.com.security_system.pojo.Shares;

/**
 * 收藏Action
 * @author Administrator
 *
 */
@Component
@Scope
public class CollectionAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6498644490501868028L;
	@Autowired
	CollectionDao collectionDao;
	@Autowired
	SharesDao sharesDao;
	private Map<String, Object> responseJson;
	private long id;
	private long userId;
	private long sharesId;
	private long number;
	private String name;
	private String category;
	private String module;
	private String service;
	private String subService;

	public Map<String, Object> getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(Map<String, Object> responseJson) {
		this.responseJson = responseJson;
	}

	public long getNumber() {
		return number;
	}

	public void setNumber(long number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getSubService() {
		return subService;
	}

	public void setSubService(String subService) {
		this.subService = subService;
	}

	public String getCoreProduct() {
		return coreProduct;
	}

	public void setCoreProduct(String coreProduct) {
		this.coreProduct = coreProduct;
	}

	private String coreProduct;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getSharesId() {
		return sharesId;
	}

	public void setSharesId(long sharesId) {
		this.sharesId = sharesId;
	}
	/**
	 * 他娘收藏
	 * @return
	 */
	public String addCollection() {
		responseJson = new HashMap<>();
		try {
			Collection collection = new Collection();
			//从session中获取用户id
			ActionContext actionContext = ActionContext.getContext();
			Map<String, Object> session = actionContext.getSession();
			userId=Long.valueOf((String) session.get("user_id"));
			collection.setUserId(userId);
			collection.setSharesId(sharesId);
			//添加收藏信息至数据库
			boolean result = collectionDao.addCollection(collection);
			//返回插入结果
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
	/**
	 * 查询用户收藏列表
	 * @return
	 */
	public String getByUid() {
		responseJson = new HashMap<>();
		try {
			Gson gson = new Gson();
			List<Collection> list = new ArrayList<>();
			ActionContext actionContext = ActionContext.getContext();
			Map<String, Object> session = actionContext.getSession();
			//从sesion中取用户id
			userId=Long.valueOf((String) session.get("user_id"));
			//根据用户id查询收藏列表
			list = collectionDao.getCollectionByUId(userId);
			//遍历list获取股票id的list
			List<Long> ids = new ArrayList<>();
			for (Collection collection : list) {
				ids.add(collection.getSharesId());
			}
			List<Shares> sharesList = new ArrayList<>();
			//根据股票id的list查询用户收藏的股票列表
			sharesList = sharesDao.getByIds(ids);
			responseJson.put("result", gson.toJson(sharesList));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	/**
	 * 删除收藏信息列表
	 * @return
	 */
	public String deleteCollection(){
		responseJson=new HashMap<>();
		try {
			Collection collection=new Collection();
			collection.setId(sharesId);
			//根据id删除用户收藏信息
			boolean result=collectionDao.deleteCollection(collection);
			if(result){
				responseJson.put("result", "true");
			}else{
				responseJson.put("result", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

}
