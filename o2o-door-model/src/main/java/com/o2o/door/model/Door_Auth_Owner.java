package com.o2o.door.model;

/**
 * 业主权限设定
 * @author masin
 *
 */
public class Door_Auth_Owner {
    
	private Integer vid;  //小区编号
	private String username; // 姓名
	private String tel;  // 电话
	private Integer bid; // 楼栋
	private Integer uid; // 房号
	private Integer hid; // 房号
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
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}
	
}
