package com.o2o.door.common.lingling;

import java.io.IOException;
import java.util.Properties;

public class Door_Config {
	private static Properties properties;
	
	public static final String CONFIG_NAME = "Accessconfig.properties";   //配置文件
	
	public static final String SIGNATURE = "signature";   //签名
	public static final String TOKEN = "token";    //token
	
	public static final String REQUEST_PARAM = "requestParam";   //请求体
	public static final String RESPONSE_RESULT = "responseResult";  //响应体
	public static final String HEADER = "header";  
	
	public static final String HOST_METHOD_ADD_DEVICE = "device/addDevice";//添加设备
	public static final String HOST_METHOD_DEL_DEVICE = "device/delDevice";//删除设备
	public static final String HOST_METHOD_UPDATE_DEVICE = "device/updateDevice";//更新设备
	public static final String HOST_METHOD_GET_DEVICE_LIST = "device/queryDeviceList";//查询设备列表
	public static final String HOST_METHOD_MAKE_SDK_KEY = "key/makeSdkKey";//生成开门密钥
	public static final String HOST_METHOD_GET_LLID = "qrcode/getLingLingId";//获取令令ID
	public static final String HOST_METHOD_GET_LLID_LIST = "qrcode/getLingLingIds";//批量获取令令ID
	public static final String HOST_METHOD_ADD_OWNER_QRCODE = "qrcode/addOwnerQrCode";//生成业主二维码
	public static final String HOST_METHOD_ADD_VISITOR_QRCODE = "qrcode/addVisitorQrCode";//添加门禁访客二维码
	public static final String HOST_METHOD_DEL_VISITOR_QRCODE = "qrcode/delVisitorQrCode";//删除访客二维码
	public static final String HOST_METHOD_GET_OPENDOORLOG = "openDoorLog/selectOpenDoorLog";//日志查询
	
	public static final String SMART_door = "smrdoor";    //智能门禁
	public static final String MAC_door = "macdoor";   //机械门禁
	public static final String OTHER_door = "other";   //其它
	
	public static final String STATUS_appr = "appr";     //已通过
	public static final String STATUS_wappr = "wappr";   //待审批
	public static final String STATUS_rappr = "rappr";   //已拒绝
	static{
		try {
			properties = new Properties();
			properties.load(Door_Config.class.getClassLoader().getResourceAsStream(CONFIG_NAME));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Door_Config() {
	}

	private static Door_Config config = null;

	public static synchronized Door_Config getInstance() {
		if (config == null) {
			config = new Door_Config();
		}
		return config;
	}

	public String getProperty(String key) {
		return properties.getProperty(key);
	}
}
