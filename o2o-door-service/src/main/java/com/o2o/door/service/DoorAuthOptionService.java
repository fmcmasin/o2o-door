package com.o2o.door.service;

import java.util.Date;
import java.util.Map;

import com.github.pagehelper.PageInfo;


public interface DoorAuthOptionService {
   
	    /**
	    * 权限申请列表
	    * @param bid  楼栋
	    * @param uid  单元
	    * @param hid  房号
	    * @param username   姓名
	    * @param tel        电话
	    * @param status     状态
	    * @return
	    */
	   PageInfo<Map<String,Object>>  selectDoorAuthData(Integer pageNo,
				Integer pageSize,Integer vid,Integer bid,Integer uid,Integer hid,
			   String username,String tel,String status);
	   /**
	    * 更改人员权限
	    * @param userid
	    * @param doorid
	    * @param status  
	    * @return
	    */
	   int updateDoorAuth(Integer userid,Integer doorid,String status,Date date);
	   
	   /**
	    * 权限查询列表
	    * @param username   姓名
	    * @param tel 电话 
	    * @param bid 楼栋
	    * @param uid 单元
	    * @param hid 房号
	    * @param doortype  门类型
	    * @param identity  身份
	    * @return
	    */
	   PageInfo<Map<String,Object>> selectDoorAuthQueryData(Integer pageNo,
				Integer pageSize,Integer vid,String  username,String  tel,Integer bid,Integer uid,Integer hid,String doortype,Integer isowner);
	   
	   /**
	    * 给业主增加门权限
	    * @param userid
	    * @param params
	    * @return
	    */
	   Integer  saveDoorList(Integer userid,Integer[] params);
	   
	   /**
	    * 更改用户的二维码
	    * @param userid
	    * @param qrcode
	    * @return
	    */
	   Integer  updatUserQrcode(Integer userid,String qrcode);
	   
	   
	   /**
	    * 查询人员是否有这个门的door_auth记录
	    * @param userid
	    * @param doorid
	    * @return
	    */
	   Integer selectDoorAuthByUserid(Integer userid);   
	   
	   /**
	    * 插入人员对应这个门的二维码记录
	    * @param userid
	    * @param qcode 二维码
	    * @return
	    */
	   Integer insertDoorAuthByUserid(Integer userid,String qcode);
	   
	   /**
	    * 获取业主二维码
	    * @param userid
	    * @return
	    */
	   String getQrcode(Integer  userid,Integer doorid);
	   
}
