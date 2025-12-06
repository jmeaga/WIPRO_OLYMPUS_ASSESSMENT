package com.example.demo.model;



import jakarta.persistence.*;


@Entity

@Table(name = "user_apps")
public class UserApps {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userAppId;

    private Integer userId;
    private Integer appId;
    private String downloadDate;
    
    @Transient
    private String appName;
    
	public Integer getUserAppId() {
		return userAppId;
	}
	public void setUserAppId(Integer userAppId) {
		this.userAppId = userAppId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getAppId() {
		return appId;
	}
	public void setAppId(Integer appId) {
		this.appId = appId;
	}
	public String getDownloadDate() {
		return downloadDate;
	}
	public void setDownloadDate(String downloadDate) {
		this.downloadDate = downloadDate;
	}
	public String getAppName() { return appName; }
	public void setAppName(String appName) { this.appName = appName; }
}
