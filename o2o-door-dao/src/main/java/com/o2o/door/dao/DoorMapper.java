package com.o2o.door.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.o2o.door.model.Door;
import com.o2o.door.model.DoorOpenListCondition;


public interface DoorMapper {
	
    int deleteByPrimaryKey(Integer id);         //删除门
    
    int deleteDoorAuthByDoorid(Integer id);     //删除拥有这个门权限的人
    
    int deleteDoorListByDoorid(Integer id);     //删除门列表
    
    int insertSelective(Door record);        //添加门

    Door selectByPrimaryKey(Integer id);     //依据id 查询详细信息

    int updateByPrimaryKeySelective(Door record); //更改门信息
    /**
     * 依据设备序列号查询设备的信息
     * @param deviceid
     * @return
     */
    Door  selectDeviceid(String deviceCode);      //依据设备编码查询设备信息
   
    /**
     * 查询门列表
     * @param name  门名称
     * @param doortype  门类型
     * @param rketype   门禁类型
     * @return
     */
	@SuppressWarnings("rawtypes")
	List<Door>  selectByParams(HashMap map);       //查询门列表信息
	/**
	 * 设备更改之后，更改用户二维码数据
	 * @param id
	 * @param qrcode  二维码
	 * @return
	 */
	int updateUserQrcode(Integer id,String qrcode);  //更改用户二维码数据
	
	/**
	 * 查询权限范围内的门列表
	 * @param userid
	 * @param range
	 * @param doortype
	 * @param bid
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	List<Map<String,Object>>  selectDoorListByParams(HashMap map); 
	
	/**
	 * 依据Userid 来查找设备的sdk(设备开起密钥)
	 * @param userid
	 * @return
	 */
	List<Map<String,Object>>  getSdkByUserid(Integer userid);
	
	/**
	 * 获取智能门禁列表数据，用于定时任务更新sdk
	 * @return
	 */
	List<Door>  getSmrDoorList();
	
	/**
	 * 更新sdkey  定时任务更新
	 * @param id
	 * @return
	 */
	Integer updateSdkey(String deviceid,String sdkey);
	
	/**
	 * 调用存储过程去创建开门记录表，每天创建一张表
	 * @return
	 */
	Integer callCreate_door_open_list();
	
	/**
	 * 调用存储过程，去插入开门记录
	 * @return
	 */
	Integer callInsert_door_open_insert(Integer userid,Date  date);
	
	/**
	 * 依据门名称去查找 门 id
	 * @return
	 */
	List<Map<String,Integer>> getDoorid(List<String> doorname);
	
	/**
	 * 查询所有业主信息
	 * @return
	 */
	List<Map<String,Integer>> getSysmemberData();
	
	/**
	 * 查询开门记录日志
	 * @param pageNo
	 * @param pageSize
	 * @param conditions
	 * @return
	 */
	List<Map<String,Object>>   selectDoorOpenList(DoorOpenListCondition conditions);
	
	/**
	 * 依据令令id  获取  sys_member 表 id
	 * @return
	 */
	Map<String,Integer> getSysMemberId(String  lingLingid);
}