package com.o2o.door.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.o2o.door.common.upload.UploadController;
import com.o2o.door.model.Door_Auth_Owner;
import com.o2o.door.model.Door_Auth_Staff;
import com.o2o.door.model.OwnerTempleteData;
import com.o2o.door.service.DoorAuthOptionService;
import com.o2o.door.service.DoorAuthSettingOptionService;
import com.o2o.door.service.DoorOptionService;

/**
 * 业主和工作人员权限设定
 * @author masin
 *
 */
@Controller
@RequestMapping("/doorAuthSetting")
public class DoorAuthSettingController {

	private Logger logger  = Logger.getLogger(DoorAuthSettingController.class);
	
	@Resource
	private DoorAuthSettingOptionService   doorAuthSettingOptionServiceImpl;
	
	@Resource
	private DoorOptionService   doorOptionServcieImpl;
	
	@Resource
	private DoorAuthOptionService   doorAuthOptionServiceImpl;
	
	//跳转至业主权限设定列表
	@RequestMapping("/ownerindexjsp")
	public String ownerIndex(){
		return "door/doorAuthOwner";
	}
	
	//跳转至业主权限设定列表
	@RequestMapping("/staffindexjsp")
	public String staffIndex(){
		return "door/doorAuthStaff";
	}
	
	//业主权限设定列表
	@ResponseBody
	@RequestMapping("/ownerIndex")
	public PageInfo<Map<String,Object>> ownerIndex(HttpSession session,Integer pageNo,Integer pageSize,Door_Auth_Owner  mao){
		try{
			return doorAuthSettingOptionServiceImpl.ownerIndex(pageNo,pageSize,mao);
		}catch(RuntimeException e){
			logger.error("DoorAuthSettingController ownerIndex Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorAuthSettingController ownerIndex Exception Error", e);
			return null;
		}
		
	}
	
	//工作人员授权设定列表
	@ResponseBody
	@RequestMapping("/staffIndex")
	public PageInfo<Map<String,Object>> staffIndex(HttpSession session,Integer pageNo,Integer pageSize,Door_Auth_Staff  mas){
		try{
			//查询当前小区的工作人员列表
			List<Map<String,Object>> listmap = doorAuthSettingOptionServiceImpl.getSysUserByVid(mas.getVid());
			//创建map对象来保存工作人员数据进行插入到业主表中sys_member 更改 isowner = 5
			HashMap<String, Object>  tempmap  = new HashMap<String, Object>();
			for (Map<String, Object> map : listmap) {
				//依据小区id 和 微信 Id 来查找 该工作人员是否在业主表中 有就跳过，没有就行新增到业主表中
				Integer count = doorAuthSettingOptionServiceImpl.selectSysuserInSysmember(mas.getVid(),String.valueOf(map.get("wxid")));
				if(count>0)
					continue;
				//不存在就将工作人员插入sys_member 表中
				tempmap.put("phone", map.get("phone"));
				tempmap.put("idnumber", map.get("idnumber"));
				tempmap.put("address", map.get("address"));
				tempmap.put("tname", map.get("tname"));
				tempmap.put("wxid", map.get("wxid"));
				tempmap.put("wxname", map.get("wxname"));
				tempmap.put("isowner",5);
				tempmap.put("vid",mas.getVid());
				//将工作人员数据保存到sys_member 表中
				doorAuthSettingOptionServiceImpl.insertSysUserToSysMember(tempmap);
				
			}
			return doorAuthSettingOptionServiceImpl.staffIndex(pageNo, pageSize, mas);
		}catch(RuntimeException e){
			logger.error("DoorAuthSettingController staffIndex Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorAuthSettingController staffIndex Exception Error", e);
			return null;
		}
		
	}
	
	//依据当前人员和 楼栋  id 来查找door_list  用来展示该用户有哪些门的权限
	@ResponseBody
	@RequestMapping("/getDoorList")
	public PageInfo<Map<String,Object>>  getDoorListByParam(HttpSession session,Integer pageNo,Integer pageSize,Integer vid,
			Integer userid,Integer range,String doortype,Integer bid){
		try{
			return doorOptionServcieImpl.selectDoorListByParams(pageNo, pageSize,vid, userid, range, doortype, bid);
		}catch(RuntimeException e){
			logger.error("DoorAuthSettingController getDoorListByParam Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorAuthSettingController getDoorListByParam Exception Error", e);
			return null;
		}
		
	}
	
	//批量授权，将 人员 id 以及 门 id  保存到 door_list 中
	@ResponseBody
	@RequestMapping("/saveDoorList")
	public String  saveDoorList(Integer userid,Integer[] params){
		try{
			doorAuthOptionServiceImpl.saveDoorList(userid, params);
			return "授权成功";
		}catch(RuntimeException e){
			logger.error("DoorAuthSettingController saveDoorList Runtime Error", e);
			return "授权失败";
		}catch(Exception e){
			logger.error("DoorAuthSettingController saveDoorList Exception Error", e);
			return "授权失败";
		}
		
	}
	
	//上传业主权限模板数据
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/owner/excelUpload")
	public String  excelUpload(HttpServletRequest request,String filePre){
		try {
			//解析Excel  封装数据到Map 中
			Map<String, Object> map = new UploadController().excelUploadList(request, filePre,OwnerTempleteData.class);
			List<OwnerTempleteData> ts   = (List<OwnerTempleteData>) map.get("datalist");
			List<String>  idnumbers = new LinkedList<String>();
			for (OwnerTempleteData ownerTempleteData : ts) {
				//将身份证号取出做一次查询，返回业主 id，用于查询人员信息
				idnumbers.add(ownerTempleteData.getOwnercard());
			}
			//依据身份证号来查找人员信息
			List<Map<String,Object>>  userindfo = doorAuthSettingOptionServiceImpl.getUseridMap(idnumbers);
			//获得的人员信息 通过身份证号来比对查找 用户 userid
			Integer vid =null,mid =null;
			for (OwnerTempleteData ownerTempleteData : ts) {
				//通过身份证比较去获取用户 userid
				for(Map<String,Object> usermap:userindfo){
					if(usermap.get("idnumber").toString().equalsIgnoreCase(ownerTempleteData.getOwnercard())){
						vid = (Integer) usermap.get("vid");
						mid = (Integer) usermap.get("id");
						break;
					}
				}
				//通过门名称去查找门id
				List<Map<String,Integer>>  doorids  = doorOptionServcieImpl.getDoorid(vid,ownerTempleteData.getDoor());
				//将返回的 门  id  放在数组 进行插入数据处理
				Integer[] dooridarray = new Integer[doorids.size()];
				for(int i =0;i<doorids.size();i++){
					dooridarray[i] =doorids.get(i).get("id");
				}
				//保存数据
				doorAuthOptionServiceImpl.saveDoorList(mid, dooridarray);
			}
			return "导入成功！";
		}catch(RuntimeException e){
			logger.error("DoorAuthSettingController excelUpload Runtime Error", e);
			return "导入失败,请检查格式是否正确";
		}catch (Exception e) {
			logger.error("DoorAuthSettingController excelUpload Runtime Error", e);
			return "导入失败,请检查格式是否正确";
		}
	}
	
}