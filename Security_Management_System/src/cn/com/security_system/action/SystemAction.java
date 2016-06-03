package cn.com.security_system.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope
public class SystemAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2473518872865077813L;
	
	
	public String getRootView(){
		System.out.println("加载根目录资源。。。");
		return SUCCESS;
	}

}
