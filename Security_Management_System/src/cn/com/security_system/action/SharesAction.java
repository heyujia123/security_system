package cn.com.security_system.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import cn.com.security_system.dao.SharesDao;
import cn.com.security_system.pojo.Shares;

@Component
@Scope
public class SharesAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8330376812840260023L;
	private Map<String, Object> responseJson;
	private long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	private long number;
	private String name;
	private String category;
	private String module;
	private String service;
	private String subService;
	private String coreProduct;
	private String positiveFactors;//利好因素
	private String nagetiveFactors;//利空因素
	private String positiveMonth;//利好月份
	private String queryStr;//查询条件
	private String type;//查询类型

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPositiveFactors() {
		return positiveFactors;
	}

	public void setPositiveFactors(String positiveFactors) {
		this.positiveFactors = positiveFactors;
	}

	public String getNagetiveFactors() {
		return nagetiveFactors;
	}

	public void setNagetiveFactors(String nagetiveFactors) {
		this.nagetiveFactors = nagetiveFactors;
	}

	public String getPositiveMonth() {
		return positiveMonth;
	}

	public void setPositiveMonth(String positiveMonth) {
		this.positiveMonth = positiveMonth;
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

	public Map<String, Object> getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(Map<String, Object> responseJson) {
		this.responseJson = responseJson;
	}

	@Autowired
	private SharesDao sharesDao;

	public String getAllShares() {
		responseJson = new HashMap<String, Object>();
		//根据type和查询条件获取股票列表
		List<Shares> shares = sharesDao.getAllShares(type,queryStr);
		Gson gson = new Gson();
		responseJson.put("result", gson.toJson(shares));
		return SUCCESS;
	}

	public String getSharesById() {
		responseJson = new HashMap<String, Object>();
		Shares shares = sharesDao.getSharesById(id);
		Gson gson = new Gson();
		responseJson.put("result", gson.toJson(shares));
		return SUCCESS;
	}

	public String updateShares() {
		responseJson = new HashMap<>();
		Shares shares = new Shares();
		shares.setNumber(number);
		shares.setName(name);
		shares.setModule(module);
		shares.setCategory(category);
		shares.setService(service);
		shares.setSubService(subService);
		shares.setCoreProduct(coreProduct);
		shares.setId(id);
		try {
			boolean result = sharesDao.updateShares(shares);
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

	public String deleteShares() {
		responseJson = new HashMap<>();
		try {
			boolean result = sharesDao.deleteShares(id);
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
	public String addShares(){
		responseJson = new HashMap<>();
		try {
			Shares shares=new Shares();
			shares.setName(name);;
			shares.setNumber(number);
			shares.setCategory(category);
			shares.setModule(module);
			shares.setService(service);
			shares.setSubService(subService);
			shares.setCoreProduct(coreProduct);
			shares.setPositiveFactors(positiveFactors);
			shares.setNagetiveFactors(nagetiveFactors);
			shares.setPositiveMonth(positiveMonth);
			boolean result=sharesDao.addShares(shares);
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
