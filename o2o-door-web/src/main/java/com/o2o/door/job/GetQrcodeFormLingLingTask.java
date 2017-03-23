package com.o2o.door.job;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.o2o.door.common.lingling.GetDataFromLingLing;
import com.o2o.door.model.Door;
import com.o2o.door.service.DoorAuthOptionService;
import com.o2o.door.service.DoorOptionService;

/**
 * 定时获取二维码任务类  令令开门 密钥 sdkey 默认 180天，且生成二维码时传入的结果分钟也是有限的，无法生成永久的二维码数据
 * 针对业主需要生成永久的二维码数据 ，做定时任务每天晚上去生成二维码数据，已保证业主的二维码数据不失效
 * 1-每周去定时更新 sdk   保证 sdk  永不失效
 * 2-每天去定时更新二维码  保证二维码数据  永不失效
 * @author masin
 *
 */
@Component("taskjob")
public class GetQrcodeFormLingLingTask{
	
	private static final Logger logger = LoggerFactory.getLogger(GetQrcodeFormLingLingTask.class);
	
	private static final SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Resource
	private DoorAuthOptionService   doorAuthOptionServiceImpl;
	
	@Resource
	private DoorOptionService   doorOptionService;
	
	//每周日晚上23点更新门的sdkey
	@Scheduled(cron="0 0 23 ? * SUN")
    public void updateSdkeyFromLingLing(){
		
		try{
			//获取智能门禁列表的数据遍历更新sdk
			List<Door>  doorList = doorOptionService.getSmrDoorList();
			List<String>  list = new ArrayList<String>();
			for (Door door : doorList) {
				list.add(door.getDeviceid());
			}
			String[] deviceids = list.toArray(new String[list.size()]);
			String  result  = GetDataFromLingLing.makeSdkKey(deviceids, 180);   //获取sdkey数组
			//依据设备的id  更新门的sdkey
			JSONObject  json = GetDataFromLingLing.analyResult(result);
			Set<String> key= json.keySet();
			for (String string : key) {
				doorOptionService.updateSdkey(string, json.getString(string));
			}
			logger.info("更新设备sdkey成功 :"+sdf.format(new Date()));
		}catch(Exception e){
			logger.error("更新设备sdkey失败 :"+sdf.format(new Date()),e);
		}
    }
	
	
	//每天晚上23點去更新二維碼
	@Scheduled(cron = "0 0 23 * * ?")  
	public void updateQrcodeFromLingLing(){
		
		try{
			// 获取业主信息列表
			List<Map<String,Integer>>  ownerlist =doorOptionService.getSysmemberData(); //获取业主列表信息
			for (Map<String, Integer> owner : ownerlist) {
				List<Map<String,Object>> listmap = doorOptionService.getSdkByUserid(owner.get("userid"));   //获取该业主拥有的门列表
				String qrcode = null;
				if(!listmap.isEmpty()){
					String linglingid = String.valueOf(listmap.get(0).get("linglingid"));   //linglingid为操作对象，没有实在意义，取一次就行
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
					String result = GetDataFromLingLing.getOwnerQrcode(linglingid, sdk, 4095, "499602d3");  //4095分钟有效 时间为  68.25小时   sdk  有效期为 180天，创建定时任务 使之不失效
					JSONObject  json = GetDataFromLingLing.analyResult(result);
					qrcode = json.getString("qrcodeKey");
				}
				//更改用户的二维码
				doorAuthOptionServiceImpl.updatUserQrcode(owner.get("userid"),qrcode);
			}
			logger.info("更新业主二维码成功 :"+sdf.format(new Date()));
		}catch (Exception e) {
			logger.error("更新业主二维码失败 :"+sdf.format(new Date()),e);
		}
	}
	
    //每天凌晨 一点去创建当天的开门日志表
	@Scheduled(cron = "0 0 01 * * ?")  
	public void createDoorOpenList(){
		//调用存储过程， 去创建表结构 有两处调用此存储过程，在新增开门日志时也会创建表，防止后台任务没有刚好生成当天的开门日志表
		try{
			doorOptionService.callCreate_door_open_list();
			logger.info("创建开门记录表成功 :"+sdf.format(new Date()));
		}catch(Exception e){
			logger.error("创建开门记录表失败 :"+sdf.format(new Date()),e);
		}
	}
	
}