package com.o2o.door.model;

/**
 * 工作人员权限设定
 * @author masin
 *
 */
public class Door_Auth_Staff {
    
	private Integer vid;  //小区编号
	private String username; // 姓名
	private String tel;  // 电话
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
