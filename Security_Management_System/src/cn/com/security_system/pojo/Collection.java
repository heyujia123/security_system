package cn.com.security_system.pojo;

import java.io.Serializable;

public class Collection implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5547076107032388822L;
	private long id;
	private long userId;
	private long sharesId;
	private long number;
	private String name;
	private String category;
	private String module;
	private String service;
	private String subService;
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
}
