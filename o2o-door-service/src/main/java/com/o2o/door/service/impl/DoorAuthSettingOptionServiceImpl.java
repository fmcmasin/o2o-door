package com.o2o.door.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.o2o.door.dao.DoorAuthSettingMapper;
import com.o2o.door.model.Door_Auth_Owner;
import com.o2o.door.model.Door_Auth_Staff;
import com.o2o.door.service.DoorAuthSettingOptionService;

@Service("doorAuthSettingOptionServiceImpl")
public class DoorAuthSettingOptionServiceImpl implements DoorAuthSettingOptionService {
    
	@Resource
	private DoorAuthSettingMapper   mdaom;
	
	@Override
	public PageInfo<Map<String, Object>> ownerIndex(Integer pageNo,Integer pageSize,Door_Auth_Owner mao) {
			PageHelper.startPage(pageNo,pageSize);
			List<Map<String,Object>> list = mdaom.getOwnerIndex(mao);
			PageInfo<Map<String,Object>>  pageinfo =new PageInfo<Map<String,Object>>(list);
			return pageinfo;
	}

	@Override
	public PageInfo<Map<String, Object>> staffIndex(Integer pageNo,
			Integer pageSize, Door_Auth_Staff mas) {
			PageHelper.startPage(pageNo,pageSize);
			List<Map<String,Object>> list = mdaom.getStaffIndex(mas);
			PageInfo<Map<String,Object>>  pageinfo =new PageInfo<Map<String,Object>>(list);
			return pageinfo;
	}

	@Override
	public List<Map<String, Object>> getUseridMap(List<String> ownercard) {
			return mdaom.getUseridMap(ownercard);
	}

	@Override
	public List<Map<String, Object>> getSysUserByVid(Integer vid) {
		return mdaom.getSysUserByVid(vid);
	}

	@Override
	public Integer selectSysuserInSysmember(Integer vid,String wxid) {
		return mdaom.selectSysuserInSysmember(vid,wxid);
	}

	@Override
	public Integer insertSysUserToSysMember(HashMap<String, Object> map) {
		return mdaom.insertSysUserToSysMember(map);
	}

}
