package com.o2o.door.common.lingling;

import org.apache.commons.httpclient.NameValuePair;

import com.alibaba.fastjson.JSONObject;

public class GetDataFromLingLing {
	/**
	 * 获取设备ID
	 * @param deiceName  设备名称
	 * @param deviceCode 设备序列号
	 * @return
	 */
	public static String addDecvice(String deviceName,String deviceCode) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("deviceName", deviceName); // 设备名称
		requestParam.put("deviceCode", deviceCode);// 设备的SN码（设备序列号）
		String result = doPost(Door_Config.HOST_METHOD_ADD_DEVICE,requestParam);
		
		return  result;
	}
    /**
     * 删除设备
     * @param deviceID
     * @return
     */
	public static String delDecvice(String deviceID) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("deviceId", deviceID);// 设备ID
		String result = doPost(Door_Config.HOST_METHOD_DEL_DEVICE,requestParam);
		
		return result;
	}
    /**
     * 更新设备
     * @param deviceID
     * @param newDeviceName
     * @return
     */
	public static String updateDecvice(String deviceID,String newDeviceName ) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("deviceId", deviceID);// 设备ID
		requestParam.put("newDeviceName", newDeviceName);// 新设备的名称（不填则不更改）
		// requestParam.put("newDeviceCode", "");// 新设备的SN码（不填则不更改，不建议修改SN码）
		String result = doPost(Door_Config.HOST_METHOD_UPDATE_DEVICE,requestParam);
		
		return result;
	}
    /**
     * 从令令服务器获取设备列表
     * @return
     */
	public static String getDecviceList() {
		JSONObject requestParam = new JSONObject();
		String result = doPost(Door_Config.HOST_METHOD_GET_DEVICE_LIST, requestParam);
		return result;
	}
    /**
     * 获取设备开门密钥
     * @param deviceIDs   设备ID
     * @param keyEffecDay  有效天数，默认180 最大180天
     * @return
     */
	public static String makeSdkKey(String[] deviceIDs,int keyEffecDay) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("deviceIds", deviceIDs);    // 设备ID数组
		requestParam.put("keyEffecDay", keyEffecDay);// Key的有效天数（单位：天；最大值180天，不填默认180天，填超过180天取默认值）
		String result = doPost(Door_Config.HOST_METHOD_MAKE_SDK_KEY,requestParam);
		
		return result;
	}
    /**
     * 获取linglingID
     * @return
     */
	public static String getLLID() {
		JSONObject requestParam = new JSONObject();
		String result = doPost(Door_Config.HOST_METHOD_GET_LLID,requestParam);
		return result;
	}
    /**
     * 获取业主二维码
     * @param linglingID   令令ID
     * @param sdkKeys    开门密钥
     * @param endTime  有效分钟
     * @param strKey   自定义的8位16进制数
     * @return
     */
	public static String getOwnerQrcode(String linglingID,String[] sdkKeys,int endTime,String strKey) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("lingLingId", linglingID); // 令令ID
		requestParam.put("sdkKeys", sdkKeys);// 控制设备的sdkKey
		requestParam.put("endTime", endTime); //（结果时间，单位：分钟；最大支持4095分钟）
		requestParam.put("strKey", strKey); // 自定义密钥（二维码加密用的key，8位16进制的字符串）
		String result = doPost(Door_Config.HOST_METHOD_ADD_OWNER_QRCODE, requestParam);
		
		return result;
	}
   /**
    * 获取游客二维码
    * @param linglingID  linglingID
    * @param sdkKeys   开门密钥
    * @param time    开始时间  时间戳格式
    * @param endTime   有效时间 分钟
    * @param effecNumber  有效次数
    * @param strKey   自定义的8位16进制数
    * @return
    */
	public static String getVistorQrcode(String linglingID,String[] sdkKeys,long time,int endTime,int effecNumber,String strKey) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("lingLingId", linglingID); // 令令ID
		requestParam.put("sdkKeys", sdkKeys);// 控制设备的sdkKey
		requestParam.put("startTime", time);// 开始时间（时间戳格式）
		requestParam.put("endTime", endTime); // （结果时间，单位：分钟；最大支持4095分钟，有效多少分钟）
		requestParam.put("effecNumber", effecNumber);  //（有效次数，取值0~255）
		requestParam.put("strKey", strKey); // 自定义密钥（二维码加密用的key，8位16进制的字符串）
		String result = doPost(Door_Config.HOST_METHOD_ADD_VISITOR_QRCODE, requestParam);
		
		return result;
	}
    /**
     * 删除游客二维码
     * @param codeID
     * @return
     */
	public static String delVistorQrcode(String codeID) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("codeId",codeID);// 二维码ID
		String result = doPost(Door_Config.HOST_METHOD_DEL_VISITOR_QRCODE, requestParam);
		return result;
	}
    /**
     * 获取开门日志
     * @param page
     * @param rows
     * @return
     */
	public static String getOpenDoorLog(int page,int rows) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("page", page);// 分页的第几页（不填默认为1）
		requestParam.put("rows", rows);// 每页几行数据（不填默认为10）
		String result = doPost(Door_Config.HOST_METHOD_GET_OPENDOORLOG, requestParam);
		return result;
	}
    /**
     * 获取linglingID
     * @param count
     * @return
     */
	public static String getLLIDS(int count) {
		JSONObject requestParam = new JSONObject();
		requestParam.put("count", 10);// 批量生成令令ID的个数(输入的个数在1~20)
		String result = doPost(Door_Config.HOST_METHOD_GET_LLID_LIST,requestParam);
		return result;
	}
	
	/**
	 * 请求令令接口
	 * @param method
	 * @param requestParam
	 * @return
	 */
    public static String  doPost(String method, JSONObject requestParam){
    	Door_Config config = Door_Config.getInstance();
    	String url = config.getProperty("hostSerivce")+method +"/"+config.getProperty("openToken");
		String param = JsonUtil.makeMessage(requestParam);
		HttpClientJson client = new HttpClientJson();
		JSONObject result = client.doPostJson(url,new NameValuePair[] { new NameValuePair("MESSAGE", param)});
		return result.toJSONString();
    }
    
    /**
     * 解析返回的JSON字符串  获取responseResult JSON  字符串
     * @param result
     * @return
     */
    public static JSONObject analyResult(String  result){
    	JSONObject json  = new JSONObject();
    	if(result==null||result.trim().length()==0){
    		return null;
    	}
        json = JSONObject.parseObject(result);
    	String responseResult = json.getString("responseResult");
    	if(responseResult==null||responseResult.trim().length()<1){
    		return json;
    	}
    	try{
    	    json  =JSONObject.parseObject(responseResult);
    		return json;
    	}catch(Exception e){
    		return json;
    	}
    	
    }
    public static void main(String[] args) {
		JSONObject  json = new JSONObject();
		json.put("qrcodeKey", "XXXX");
		JSONObject  json2 = new JSONObject();
		json2.put("statusCode", 1);
		json2.put("methodName", "addOwnerQrCode");
		json2.put("responseResult", json);
		System.out.println(json2.toString());
		System.out.println(analyResult(json2.toString()));
	}
}
