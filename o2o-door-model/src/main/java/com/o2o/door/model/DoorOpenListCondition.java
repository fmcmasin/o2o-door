package com.o2o.door.model;

/**
 * 开门日志查询条件
 * @author masin
 *
 */
public class DoorOpenListCondition {
	
	private Integer vid ;    //小区编号
	private String username; //姓名
	private Integer isowner;  //身份
	private Integer bid;  //楼栋
	private Integer uid;  //单元
	private Integer hid;  //房号
	private String  date; //日期
	private String tableName;  //数据库表名
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
	public Integer getIsowner() {
		return isowner;
	}
	public void setIsowner(Integer isowner) {
		this.isowner = isowner;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}
