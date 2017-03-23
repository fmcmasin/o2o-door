package com.o2o.door.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.o2o.door.common.lingling.Door_Config;
import com.o2o.door.common.lingling.GetDataFromLingLing;
import com.o2o.door.dao.DoorMapper;
import com.o2o.door.model.Door;
import com.o2o.door.model.DoorOpenListCondition;
import com.o2o.door.service.DoorOptionService;

@Service("doorOptionServcieImpl")
public class DoorOptionServcieImpl implements DoorOptionService {
	
	@Resource
	private DoorMapper door;
	
	@Override
	public int insertSelective(Door record) {
		//判断是否是智能门禁
		if(!Door_Config.SMART_door.equalsIgnoreCase(record.getRketype()))  //机械门禁或者其它门禁直接跳过
			return door.insertSelective(record);
		//智能门禁，先判断设备相同序列号的设备是否存在，如果已经存在就直接复制设备的ID 以及linglingID 设备密钥
		Door  result = selectDeviceid(record.getDevicecode());
		if(result!=null){
			record.setDeviceid(result.getDeviceid());      //设备ID
			record.setLinglingid(result.getLinglingid());  //设备linglingID
			record.setSdkey(result.getSdkey());            //获取设备开门密钥
		}else{
			//调用接口获取设备ID,设备令令ID,设备开门密钥
			Door records = getDeviceDataFromLingLing(record);
			if(records!=null)
				record = records;
		}
		return door.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		   door.deleteByPrimaryKey(id);       //依据门id删除门
		   door.deleteDoorListByDoorid(id);   //依据门id 删除门列表 door_list
		   return 1;
	}

	@Override
	public Door selectDeviceid(String devicecode) {    //依据设备序列号查询设备信息
		return door.selectDeviceid(devicecode);
	}
	
	
	@Override
	public int updateByPrimaryKeySelective(Door record) {
		//判断是否是智能门禁
		if(!Door_Config.SMART_door.equalsIgnoreCase(record.getRketype()))  //机械门禁或者其它门禁直接跳过
			return door.updateByPrimaryKeySelective(record);
		//智能门禁，先判断相同序列号的设备是否存在，如果已经存在就复制二维码等信息过来
		Door  result = selectDeviceid(record.getDevicecode());
		if(result!=null){
			record.setDeviceid(result.getDeviceid());      //设备ID
			record.setLinglingid(result.getLinglingid());  //设备linglingID
			record.setSdkey(result.getSdkey());            //获取设备开门密钥
		}else{
			//调用接口获取设备ID,设备令令ID,设备开门密钥
			Door records = getDeviceDataFromLingLing(record);
			if(records!=null)
				record = records;
		}
		return door.updateByPrimaryKeySelective(record);
	}

	public  Door getDeviceDataFromLingLing(Door door){
		String result = null;
		JSONObject  json = new JSONObject();
		String deviceCode = door.getDevicecode();                                //设备序列号
		String deviceName =  Door_Config.getInstance().getProperty("username");  //设备名称自定义，写在配置文件中
		result = GetDataFromLingLing.addDecvice(deviceName, deviceCode);
		//通过设备序列号去获取设备 id
		json = GetDataFromLingLing.analyResult(result);
		String deviceid = json.getString("deviceId");   //获取设备id
		door.setDeviceid(deviceid);           //设置设备id
		result = GetDataFromLingLing.getLLID();         //获取令令id;
		//获取令令id  标识符用来表示操作对象
		json = GetDataFromLingLing.analyResult(result);
		String linglingid =json.getString("lingLingId");
		door.setLinglingid(linglingid);      //设置设备linglingid
		result = GetDataFromLingLing.makeSdkKey(new String[]{deviceid}, 180);    //通过设备id去获取开门密钥
		//获取开门密钥
		json = GetDataFromLingLing.analyResult(result);
		String sdkey = json.getString(deviceid);   //设置设备密钥
		door.setSdkey(sdkey);
		return door;
	}

    /**
     * 查询门列表
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public PageInfo<Door> selectByParams(Integer pageNo,
			Integer pageSize,Integer vid,String name, String doortype,
			String rketype) {
			HashMap  map = new HashMap();
			map.put("vid", vid);  //小区编号
			map.put("name", name);
			map.put("doortype", doortype);
			map.put("rketype", rketype);
			PageHelper.startPage(pageNo,pageSize);
			List<Door>  doorlist = door.selectByParams(map);
			PageInfo<Door>  pageinfo = new PageInfo<Door>(doorlist);
			return pageinfo;
	}
    
	/**
	 * 查询详细信息 门id
	 */
	@Override
	public Door selectByPrimaryKey(Integer id) {
		return door.selectByPrimaryKey(id);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public PageInfo<Map<String,Object>>  selectDoorListByParams(Integer pageNo,
			Integer pageSize,Integer vid,Integer userid, Integer range,
			String doortype, Integer bid) {
		HashMap  map = new HashMap();
		map.put("vid", vid);   //小区编号
		map.put("doortype", doortype);   //门类型
		//判断是否查询已授权还是所有的
		if(range==1) { //查询已授权的 需要传入userid
			map.put("userid", userid);
		}
		//判断是否是楼栋
		if("custdoor".equalsIgnoreCase(doortype)){
			map.put("bid", bid);  //传入楼栋的id
		}
		PageHelper.startPage(pageNo,pageSize);
		List<Map<String,Object>>  doorlist = door.selectDoorListByParams(map);
		PageInfo<Map<String,Object>>  pageinfo = new PageInfo<Map<String,Object>>(doorlist);
		return pageinfo; 
	}

	@Override
	public List<Map<String, Object>> getSdkByUserid(Integer userid) {
		return door.getSdkByUserid(userid);
	}

	@Override
	public List<Door> getSmrDoorList() {
		return door.getSmrDoorList();
	}

	@Override
	public Integer updateSdkey(String deviceid,String sdkey) {
		return door.updateSdkey(deviceid, sdkey);
	}

	@Override
	public List<Map<String,Integer>> getDoorid(Integer vid,List<String> doorname) {
		return door.getDoorid(doorname);
	}

	@Override
	public List<Map<String, Integer>> getSysmemberData() {
		return door.getSysmemberData();
	}

	@Override
	public PageInfo<Map<String, Object>> selectDoorOpenList(Integer pageNo,
			Integer pageSize, DoorOpenListCondition conditions) {
		//拼接动态表名
		String tableName =null;
		String[] strarry = (conditions.getDate()).split("-");
		tableName = strarry[0]+strarry[1]+strarry[2];
		tableName = tableName.substring(2, tableName.length());
		conditions.setTableName("tbdoor_"+tableName);
		PageHelper.startPage(pageNo,pageSize);
		List<Map<String,Object>>  doorlist = door.selectDoorOpenList(conditions);
		PageInfo<Map<String,Object>>  pageinfo = new PageInfo<Map<String,Object>>(doorlist);
		return pageinfo; 
	}

	@Override
	public Integer callCreate_door_open_list() {
		return door.callCreate_door_open_list();
	}

	@Override
	public Integer callInsert_door_open_insert(Integer userid, Date date) {
		return door.callInsert_door_open_insert(userid, date);
	}

	@Override
	public Map<String, Integer> getSysMemberId(String lingLingid) {
		return door.getSysMemberId(lingLingid);
	}

}
