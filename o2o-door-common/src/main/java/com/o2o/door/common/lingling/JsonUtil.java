package com.o2o.door.common.lingling;

import com.alibaba.fastjson.JSONObject;
import com.o2o.door.common.lingling.Door_Config;

public class JsonUtil {
	
	/**
	 * 生成发送消息
	 * @param requestParam
	 * @return
	 */
	public static String makeMessage(JSONObject requestParam){
		Door_Config config = Door_Config.getInstance();
		
		JSONObject message = new JSONObject();
		message.put(Door_Config.REQUEST_PARAM, requestParam);
		// 生成消息头
		JSONObject header = new JSONObject();
		header.put(Door_Config.SIGNATURE, config.getProperty(Door_Config.SIGNATURE));
		header.put(Door_Config.TOKEN, config.getProperty(Door_Config.TOKEN));
		message.put(Door_Config.HEADER, header);
		
		System.out.println(message.toString());
		return message.toString();
	}
}
