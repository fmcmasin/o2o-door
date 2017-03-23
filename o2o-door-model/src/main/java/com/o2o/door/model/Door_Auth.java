package com.o2o.door.model;

/**
 * 权限申请
 * @author masin
 *
 */
public class Door_Auth {
	
	private Integer vid; //小区编号
	private String buid; // 楼栋
	private String unit; //单元
	private String house; //房号
	private Integer userid;  //userid
	private String username; //姓名
	private String wechatname; // 微信昵称
	private String identity;  //身份
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	private String tel;  //电话
	private String doorname;  //门禁权限
	private String remarks; // 备注
	private String status; // 审批状态
	public String getBuid() {
		return buid;
	}
	public void setBuid(String buid) {
		this.buid = buid;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getWechatname() {
		return wechatname;
	}
	public void setWechatname(String wechatname) {
		this.wechatname = wechatname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDoorname() {
		return doorname;
	}
	public void setDoorname(String doorname) {
		this.doorname = doorname;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
