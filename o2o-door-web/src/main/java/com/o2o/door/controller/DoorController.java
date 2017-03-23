package com.o2o.door.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.o2o.door.model.Door;
import com.o2o.door.model.DoorOpenListCondition;
import com.o2o.door.service.DoorOptionService;


@Controller
@RequestMapping("/door")
public class DoorController {
	private Logger logger = Logger.getLogger(DoorController.class.getName());
	
	@Resource
	private DoorOptionService  doorOptionServcieImpl;
	
	
	//跳转至门禁管理界面
	@RequestMapping("/indexjsp")
	public String index(){
		return "door/doorManager";
	}
	
	//跳转至开门记录查询界面
	@RequestMapping("/doorOpenIndexjsp")
	public String doorOpenIndex(){
		return "door/doorOpenList";
	}
	
	/**
	 * 显示查询列表
	 * @param name       门名称
	 * @param doortype   门类型
	 * @param rketype    门禁类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/index")
	public PageInfo<Door> index(HttpSession session,Integer pageNo,Integer pageSize,Integer vid,String name,String doortype,String rketype) {
		try{
			return  doorOptionServcieImpl.selectByParams(pageNo,pageSize,vid,name, doortype, rketype);
		}catch(RuntimeException e){
			logger.error("DoorController index Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorController index Exception Error", e);
			return null;
		}
	}
	
	/**
	 * 详细记录
	 * @param id  门id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/index/Detail")
	public Door indexDetail(Integer id) {
		try{
			return doorOptionServcieImpl.selectByPrimaryKey(id);
		}catch(RuntimeException e){
			logger.error("DoorController indexDetail Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorController indexDetail Exception Error", e);
			return null;
		}
	}
	
	/**
	 * 添加门信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add/Door")
	public String addDoor(Door  record){
		try { 
			doorOptionServcieImpl.insertSelective(record);
			return "保存成功";
		}catch(RuntimeException e){
			logger.error("DoorController addDoor Runtime Error", e);
			return "保存失败";
		}catch(Exception e){
			logger.error("DoorController addDoor Exception Error", e);
			return "保存失败";
		}
	}
	
	/**
	 * 更改门信息
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update/Door")
	public String updateDoor(Door record){
		try {
		    doorOptionServcieImpl.updateByPrimaryKeySelective(record);
		    return "保存成功";
		}catch(RuntimeException e){
			logger.error("DoorController updateDoor Runtime Error", e);
			return "保存失败";
		}catch(Exception e){
			logger.error("DoorController updateDoor Exception Error", e);
			return "保存失败";
		}
	}
	
	/**
	 * 删除门信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delete/Door")
	public String deleteByPrimaryKey(Integer id){
		try { 
			doorOptionServcieImpl.deleteByPrimaryKey(id);
			return "删除成功";
		}catch(RuntimeException e){
			logger.error("DoorController deleteByPrimaryKey Runtime Error", e);
			return "删除失败";
		}catch(Exception e){
			logger.error("DoorController deleteByPrimaryKey Exception Error", e);
			return "删除失败";
		}
	}
	
    /**
     * 回调接口用于令令传送日志
     * @param request
     * @return
     */
	@ResponseBody
	@RequestMapping("/uploadDoorOpenLog")
	public String getDoorOpenLog(HttpServletRequest  request){
		String date  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		//获取 回调的日志信息，去里面的唯一标识来找到相应的人员，获取人员之后进行存储过程调用来创建当天的开门信息表，和插入当天的开门记录。
		try{
			String noticeMsg = request.getParameter("noticeMsg");  //依据消息头获取返回的信息
			JSONObject  json1 = JSONObject.parseObject(noticeMsg);
			String msg = json1.getString("msg");  //获取存有开门信息的消息体
			JSONObject  json2 = JSONObject.parseObject(msg);
			//调用业务层去获取数据进行保存到数据库
			String linglingid = json2.getString("lingLingId");  //获取令令 id
			Long openTIme =  json2.getLong("openTime");  //获取开门时间
			Date openDateTime  = new Date(openTIme);   
			//依据令令 id 去业主表中查询 用户id  唯一存在
			Map<String, Integer>  map = doorOptionServcieImpl.getSysMemberId(linglingid);
			Integer userid = map.get("id");
			//调用存储过程去进行保存数据
			doorOptionServcieImpl.callCreate_door_open_list();
			doorOptionServcieImpl.callInsert_door_open_insert(userid, openDateTime);
			return "上传开门日志成功------------------------------"+date;
		}catch(Exception e){
			return "上传开门日志失败---------------------"+e.getMessage()+date;
		}
		
	}
	
	/**
	 * 返回开门日志查询结果
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param conditions
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doorOpenListIndex")
	public PageInfo<Map<String,Object>> doorOpenListIndex(HttpSession session,Integer pageNo,Integer pageSize,DoorOpenListCondition  conditions) {
		try{
			return  doorOptionServcieImpl.selectDoorOpenList(pageNo, pageSize, conditions);
		}catch(RuntimeException e){
			logger.error("DoorController doorOpenListIndex Runtime Error", e);
			return null;
		}catch(Exception e){
			logger.error("DoorController doorOpenListIndex Exception Error", e);
			return null;
		}
	}
	
}
