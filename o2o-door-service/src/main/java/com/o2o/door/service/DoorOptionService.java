package com.o2o.door.service;



import java.util.Date;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.o2o.door.model.Door;
import com.o2o.door.model.DoorOpenListCondition;


public interface DoorOptionService {
	
	int insertSelective(Door record); 								//添加门信息
	
	int updateByPrimaryKeySelective(Door record); 				   //更改门信息
	
	int deleteByPrimaryKey(int id);   							   //删除门信息
	
	Door selectDeviceid(String  devicecode);  					  //查询设备的id,二维码信息
    /**
     * 查询门列表
     * @param name  门名称
     * @param doortype  门类型
     * @param rketype   门禁类型
     * @return
     */
	PageInfo<Door>  selectByParams(Integer pageNo,
			Integer pageSize,Integer vid,String name,String doortype,String rketype);
	
	Door selectByPrimaryKey(Integer  id);  //通过门 id 查询门详细信息
	
	/**
	 * 查询权限范围内的门列表
	 * @param userid  用户id
	 * @param range   范围
	 * @param doortype 门禁类型
	 * @param bid  楼栋
	 * @return
	 */
	PageInfo<Map<String,Object>>   selectDoorListByParams(Integer pageNo,
			Integer pageSize,Integer vid,Integer userid,Integer range,String doortype,Integer bid);   
	
	/**
	 * 依据userid 来查找sdk(令令开门密钥)
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
	 * 依据小区编号 和 门名称去查找 门 id
	 * @return
	 */
	List<Map<String,Integer>> getDoorid(Integer vid,List<String> doorname);
	
	/**
	 * 查询所有业主信息
	 * @return
	 */
	List<Map<String,Integer>> getSysmemberData();
	
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
	 * 查询开门记录日志
	 * @param pageNo
	 * @param pageSize
	 * @param conditions
	 * @return
	 */
	PageInfo<Map<String,Object>>  selectDoorOpenList(Integer pageNo,
			Integer pageSize,DoorOpenListCondition conditions);
	
	/**
	 * 依据令令id  获取  sys_member 表 id
	 * @return
	 */
	Map<String,Integer> getSysMemberId(String  lingLingid);
}
