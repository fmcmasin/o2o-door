package com.o2o.door.model;

/**
 * 门禁
 * @author masin
 *
 */
public class Door {
	
	private Integer id;
	private String name;                 //门名称
	private String doortype;             //门类型  cmdoor-小区公共门  cust-楼栋单元门
	private Integer vid;                 //小区编号
	private Integer bid;     //楼栋编号
	private Integer uid;     //单元编号
	private String  rketype;             //门类型  smrdoor-智能门禁  macdoor-机械门禁 other-其它
	private String  devicecode;          //设别序列编号
	private String  deviceid;            // 设备id
	private String  linglingid;          //令令id;
	private String  sdkey;               //设备密钥
	private String  remarks;             //备注
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDoortype() {
		return doortype;
	}
	public void setDoortype(String doortype) {
		this.doortype = doortype;
	}
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
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
	public String getRketype() {
		return rketype;
	}
	public void setRketype(String rketype) {
		this.rketype = rketype;
	}
	public String getDevicecode() {
		return devicecode;
	}
	public void setDevicecode(String devicecode) {
		this.devicecode = devicecode;
	}
	public String getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public String getLinglingid() {
		return linglingid;
	}
	public void setLinglingid(String linglingid) {
		this.linglingid = linglingid;
	}
	public String getSdkey() {
		return sdkey;
	}
	public void setSdkey(String sdkey) {
		this.sdkey = sdkey;
	}
	
}
