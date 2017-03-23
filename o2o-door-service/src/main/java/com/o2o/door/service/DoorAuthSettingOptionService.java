package com.o2o.door.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.o2o.door.model.Door_Auth_Owner;
import com.o2o.door.model.Door_Auth_Staff;


public interface DoorAuthSettingOptionService {
   
	/**
	 * 业主权限列表
	 * @param mao
	 * @return
	 */
    PageInfo<Map<String,Object>>  ownerIndex(Integer pageNo,Integer pageSize,Door_Auth_Owner mao);
    
    /**
	 * 工作人员权限列表
	 * @param mao
	 * @return
	 */
    PageInfo<Map<String,Object>>  staffIndex(Integer pageNo,Integer pageSize,Door_Auth_Staff mao);
    
    /**
     * 通过用户身份证去查找用户id
     * @param ownercard
     * @return
     */
    List<Map<String,Object>>  getUseridMap(List<String> ownercard);
    
    /**
     * 查询当前楼盘人员
     * @param vid
     * @return
     */
    List<Map<String,Object>>  getSysUserByVid(Integer vid);
    
    /**
     * 通过 微信 id  去查找  sys_member 表看工作人员是否存在，不存在就新增
     * @param wxid
     * @return
     */
    Integer  selectSysuserInSysmember(Integer vid,String wxid);
    
    /**
     * 将工作人员插入 sys_member 表中
     * @param wxid
     * @return
     */
    Integer  insertSysUserToSysMember(HashMap<String,Object> map);
    
}
