package com.o2o.door.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.o2o.door.common.lingling.GetDataFromLingLing;
import com.o2o.door.dao.DoorAuthMapper;
import com.o2o.door.dao.DoorMapper;
import com.o2o.door.model.Door;
import com.o2o.door.service.DoorAuthOptionService;

@Service("doorAuthOptionServiceImpl")
public class DoorAuthOptionServiceImpl implements DoorAuthOptionService {
    
	@Resource
	private DoorAuthMapper   doorAuth;
	
	@Resource
	private DoorMapper   doormapper;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public PageInfo<Map<String,Object>> selectDoorAuthData(Integer pageNo,
			Integer pageSize,Integer vid,Integer bid, Integer uid,
			Integer hid, String username, String tel, String status) {
		HashMap map = new HashMap();
		map.put("vid", vid);
		map.put("bid", bid);
		map.put("uid", uid);
		map.put("hid", hid);
		map.put("username", username);
		map.put("tel", tel);
		map.put("status", status);
		PageHelper.startPage(pageNo,pageSize);
		List<Map<String,Object>>  doorAuthlist = doorAuth.selectDoorAuthData(map);
		PageInfo<Map<String,Object>>  pageinfo = new PageInfo<Map<String,Object>>(doorAuthlist);
		return pageinfo;
	}

	@Override
	public int updateDoorAuth(Integer userid, Integer doorid,String status,Date date) {
		return doorAuth.updateDoorAuth(userid, doorid,status,date);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public PageInfo<Map<String,Object>> selectDoorAuthQueryData(Integer pageNo,
			Integer pageSize,Integer vid,String username, String tel,
			Integer bid, Integer uid, Integer hid, String doortype,
			Integer isowner) {
		HashMap map   =  new HashMap();
		map.put("vid", vid);
		map.put("bid", bid);
		map.put("uid", uid);
		map.put("hid", hid);
		map.put("username", username);
		map.put("tel", tel);
		map.put("doortype", doortype);
		map.put("isowner", isowner);
		PageHelper.startPage(pageNo,pageSize);
		List<Map<String,Object>>  list = doorAuth.selectDoorAuthQueryData(map);
		PageInfo<Map<String,Object>>  pageinfo = new PageInfo<Map<String,Object>>(list);
		return pageinfo;
	}
    
	/**
	 * userid  用户id
	 * params  门 id 数组
	 */
	@Override
	public Integer saveDoorList(Integer userid, Integer[] params) {
		//遍历数组进行保存，已拥有的门不再保存
		for(int i=0;i<params.length;i++){
			if(params[i]==null)
				continue;
			Integer count = doorAuth.selectDoorListByUseridAndDoorid(userid,params[i]);
			if(count>0)
				continue;
			doorAuth.insertDoorListByUseridAndDoorid(userid,params[i]);
		}
		//判断door_auth表有无记录，没有记录新增一条
		Integer  doorauthcount = doorAuth.selectDoorAuthByUserid(userid);
		String qrcode = getQrcode(userid,null);
		if(doorauthcount==0){
			doorAuth.insertDoorAuthByUserid(userid, qrcode);
		}else{   //更改二维码
			doorAuth.updatUserQrcode(userid, qrcode);
		}
		return null;
	}

	@Override
	public Integer updatUserQrcode(Integer userid, String qrcode) {
		return doorAuth.updatUserQrcode(userid, qrcode);
	}

	@Override
	public Integer insertDoorAuthByUserid(Integer userid, String qcode) {
		return doorAuth.insertDoorAuthByUserid(userid, qcode);
	}

	@Override
	public Integer selectDoorAuthByUserid(Integer userid) {
		return doorAuth.selectDoorAuthByUserid(userid);
	}
    
	/**
	 * 获取用户二维码
	 */
	@Override
	public String getQrcode(Integer userid,Integer doorid) {
		String result ;
		JSONObject  json;
		//为用户重新生成二维码 1-先获取该人员状态是审批通过的的sdk,2-组合sdk 调用令令接口生成二维码
		List<Map<String,Object>> listmap = doormapper.getSdkByUserid(userid);
		String qrcode = null;
		try{
			if(!listmap.isEmpty()){
				String linglingid = String.valueOf(listmap.get(0).get("linglingid"));      //linglingid为操作对象，没有实在意义，取一次就行
				List<String> list = new ArrayList<String>();    
				//遍历获取sdk 添加到String 数组中
				for (Map<String, Object> map : listmap) {
					if(map.get("sdkey")==null||map.get("sdkey").toString().trim().length()<1){
						continue;
					}
					list.add(String.valueOf(map.get("sdkey")));
				}
				String[] sdk = list.toArray(new String[list.size()]);  
				//获取二维码数据
				result = GetDataFromLingLing.getOwnerQrcode(linglingid, sdk, 4095, "499602d3");   //获取业主二维码
				//String result = GetDataFromLingLing.getVistorQrcode(linglingid, sdk,1489452790000L, 4095, 3, "499602d3");  //获取访客二维码
				json = GetDataFromLingLing.analyResult(result);
				qrcode = json.getString("qrcodeKey");
			}else{
				Door  door =  doormapper.selectByPrimaryKey(doorid);
				result = GetDataFromLingLing.getOwnerQrcode(door.getLinglingid(), new String[]{door.getSdkey()}, 4095, "499602d3");   //获取业主二维码
				json = GetDataFromLingLing.analyResult(result);
				qrcode = json.getString("qrcodeKey");
			}
			return qrcode;
		}catch(Exception e){
			return qrcode;
		}
			
	}

}
