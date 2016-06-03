package cn.com.security_system.action;

import java.sql.Time;
import java.util.HashMap;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import cn.com.security_system.base.httputils;
import cn.com.security_system.pojo.SearchData;

@Component
@Scope
public class SearchAction extends ActionSupport {
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 3802033725769126170L;
	private String number;
	private Map<String, Object> responseJson;

	public String search() {
		long startTime=System.currentTimeMillis();
		responseJson=new HashMap<>();
		// ��ȡ���ݵ�url
		String dataUrl = "http://hq.sinajs.cn/list=sh" + number;
		System.out.println("dataUrl"+dataUrl);
		// ��ȡ��ʱurl
		String minUrl = "http://image.sinajs.cn/newchart/min/n/sh"+number+".gif";
		System.out.println("minUrl"+minUrl);
		// ��ȡ��k��url
		String dailyUrl = "http://image.sinajs.cn/newchart/daily/n/sh"+number+".gif";
		System.out.println("dailyUrl"+dailyUrl);
		// ��ȡ��k��url
		String weeklyUrl = "http://image.sinajs.cn/newchart/weekly/n/sh"+number+".gif";
		System.out.println("weeklyUrl"+weeklyUrl);
		// ��ȡ��k��url
		String monthUrl = "http://image.sinajs.cn/newchart/monthly/n/sh"+number+".gif";
		System.out.println("monthUrl"+monthUrl);
		try {
			// �������˹�Ʊapi�ӿ�
			String dataResult = httputils.connctionURL_Params(dataUrl, "GET", "");
			dataResult=dataResult.substring(21, dataResult.length()-2);
			Gson gson=new Gson();
			//��װ���ز���
			SearchData searchData=new SearchData();
			searchData.setData(dataResult);
			searchData.setMinUrl(minUrl);
			searchData.setDailyUrl(dailyUrl);
			searchData.setWeeklyUrl(weeklyUrl);
			searchData.setMonthUrl(monthUrl);
			responseJson.put("result", gson.toJson(searchData));
			long endTime=System.currentTimeMillis();
			System.out.println("time:"+(endTime-startTime));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;

	}

	public Map<String, Object> getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(Map<String, Object> responseJson) {
		this.responseJson = responseJson;
	}
}
