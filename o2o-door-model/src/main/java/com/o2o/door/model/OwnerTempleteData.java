package com.o2o.door.model;

import java.util.List;


public class OwnerTempleteData {
	
	private String buid;  //楼栋
	private String unit;  //单元
	private String house; //房号
	private String ownername;  //业主姓名
	private String ownercard;  //身份证号
	private List<String> door; //拥有的门
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
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public String getOwnercard() {
		return ownercard;
	}
	public void setOwnercard(String ownercard) {
		this.ownercard = ownercard;
	}
	public List<String> getDoor() {
		return door;
	}
	public void setDoor(List<String> door) {
		this.door = door;
	}
	

}
