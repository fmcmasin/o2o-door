package com.o2o.door.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface DoorAuthMapper {
   
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
   List<Map<String,Object>>  selectDoorAuthData(HashMap  map);
   /**
    * 更改人员门禁权限
    * @param userid
    * @return
    */
   int updateDoorAuth(Integer userid,Integer doorid,String status,Date date);
   
   /**
    * 权限查询列表
    * @param map
    * @return
    */
   List<Map<String,Object>>  selectDoorAuthQueryData(HashMap  map);
   
   /**
    * 查询人员是否有这个门的list记录
    * @param userid
    * @param doorid
    * @return
    */
   Integer selectDoorListByUseridAndDoorid(Integer userid,Integer doorid);   
   
   /**
    * 插入人员对应这个门的记录
    * @param userid
    * @param doorid
    * @return
    */
   Integer insertDoorListByUseridAndDoorid(Integer userid,Integer doorid);
   
   /**
    * 查询人员是否有这个门的auth记录
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
    * 更改用户的二维码
    * @param userid
    * @param qrcode
    * @return
    */
   Integer  updatUserQrcode(Integer userid,String qrcode);
}
