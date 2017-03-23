package com.o2o.door.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.o2o.door.common.lingling.Door_Config;
import com.o2o.door.service.DoorAuthOptionService;
import com.o2o.door.service.DoorOptionService;

@Controller
@RequestMapping("/doorAuth")
public class DoorAuthController {
	
	private Logger logger = Logger.getLogger(DoorAuthController.class.getName());
    
	@Autowired
	private DataSourceTransactionManager txManager;
	
	@Resource
	private DoorAuthOptionService   doorAuthOptionServiceImpl;
	
	@Resource
	private DoorOptionService   doorOptionService;
	
	//跳转至权限管理界面
	@RequestMapping("/indexjsp")
	public  String index(){
		return "door/doorAuthApply";
	}
	
	
	//跳转至权限查询界面
	@RequestMapping("/indexQueryjsp")
	public String indexQuery(){
		return "door/doorAuthQuery";
	}
	
	
	/**
	 * 查询门禁申请权限列表
	 * @param bid
	 * @param uid
	 * @param hid
	 * @param username
	 * @param tel
	 * @param status
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/index")
	public PageInfo<Map<String,Object>> index(HttpSession session,Integer pageNo,Integer pageSize,Integer vid,
			Integer bid,Integer uid,Integer hid,String username,String tel,String status){
		try{
			return doorAuthOptionServiceImpl.selectDoorAuthData(pageNo,pageSize,vid,bid, uid, hid, username, tel, status);
		}catch(RuntimeException e){
			logger.error("DoorAuthController index Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorAuthController index Exception Error", e);
			return null;
		}
	}
	
	/**
	 * 更改门禁权限
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateStatus")
	public String updateStatus(Integer userid,Integer doorid,String status){
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);			// 事物隔离级别，开启新事务
		TransactionStatus txstatus = txManager.getTransaction(def); 						// 获得事务状态
		try{
			//更改状态   需要加上事务对两个更新进行控制
			doorAuthOptionServiceImpl.updateDoorAuth(userid, doorid, status,new Date());
			//审批通过之后新增一条 door_list 记录，用于查看人员拥有的门列表
			if(Door_Config.STATUS_appr.equalsIgnoreCase(status))
				doorAuthOptionServiceImpl.saveDoorList(userid, new Integer[]{doorid});
			txManager.commit(txstatus);
			return "更改状态成功";
		}catch(RuntimeException e){
			logger.error("DoorAuthController updateStatus Runtime Error", e);
			txManager.rollback(txstatus);
			return "更改状态失败";
		}catch(Exception e){
			logger.error("DoorAuthController updateStatus Exception Error", e);
			txManager.rollback(txstatus);
			return "更改状态失败";
		}
	}
	
	/**
	 * 门禁权限查询列表
	 * @param username  姓名
	 * @param tel   电话
	 * @param bid   楼栋
	 * @param uid   单元
	 * @param hid   房号
	 * @param doortype   门类型
	 * @param identity   身份
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/indexQuery")
	public PageInfo<Map<String,Object>> indexQuery(HttpSession session,Integer pageNo,Integer pageSize,Integer vid,String  username,
			String  tel,Integer bid,Integer uid,Integer hid,String doortype,Integer isowner){
		try{
			return doorAuthOptionServiceImpl.selectDoorAuthQueryData(pageNo,pageSize,vid,username, tel, bid, uid, hid, doortype, isowner);
		}catch(RuntimeException e){
			logger.error("DoorAuthController indexQuery Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorAuthController indexQuery Exception Error", e);
			return null;
		}
	}
	
}
