package cn.com.security_system.pojo;

import java.io.Serializable;

public class SearchData implements Serializable{
	private static final long serialVersionUID = 4183671928338609540L;
private String data;
   private String minUrl;
   private String dailyUrl;
   private String weeklyUrl;
   private String monthUrl;
public String getData() {
	return data;
}
public void setData(String data) {
	this.data = data;
}
public String getMinUrl() {
	return minUrl;
}
public void setMinUrl(String minUrl) {
	this.minUrl = minUrl;
}
public String getDailyUrl() {
	return dailyUrl;
}
public void setDailyUrl(String dailyUrl) {
	this.dailyUrl = dailyUrl;
}
public String getWeeklyUrl() {
	return weeklyUrl;
}
public void setWeeklyUrl(String weeklyUrl) {
	this.weeklyUrl = weeklyUrl;
}
public String getMonthUrl() {
	return monthUrl;
}
public void setMonthUrl(String monthUrl) {
	this.monthUrl = monthUrl;
}
}
