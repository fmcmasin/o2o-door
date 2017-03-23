package com.o2o.door.common.copy;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

//获取图存储地址的实体类
public class DBSession {
	private static Logger logger = Logger.getLogger(DBSession.class.getName());
	public static final Properties _ps;
	
	static {
		_ps = new Properties();
		try {
			InputStream is = DBSession.class.getClassLoader()
					.getResourceAsStream("url-config.properties");
			try {
				_ps.load(is);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("读取文件流出错");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	
	public static String getImageUrl() {
		return _ps.getProperty("imageUrl");
	}
	
	public static String getSmallImageUrl() {
		return _ps.getProperty("smallImageUrl");
	}
	
	/**
	 * excel表格的模板路径
	 * */
	public static String getexcelTemplate() {
		return _ps.getProperty("excelTemplate");
	}
	
	/**
	 * excel表格的存储路径
	 * */
	public static String getstoragexcelUrl() {
		return _ps.getProperty("excelUrl");
	}
	
	
	/**
	 * 获取配置文件中增值服务的ip地址
	 * */
	public static String getAssest() {
		return _ps.getProperty("assest");
	}
	
	/**
	 * 获取配置文件中物业缴费的ip地址
	 * */
	public static String getEstate() {
		return _ps.getProperty("estate");
	}
	
	/**
	 * 获取配置文件中收房验房的ip地址
	 * */
	public static String getCaa() {
		return _ps.getProperty("caa");
	}
	
	/**
	 * 获取配置文件中投诉建议的ip地址
	 * */
	public static String getSuggest() {
		return _ps.getProperty("suggest");
	}
	
	/**
	 * 获取配置文件中报事报修的ip地址
	 * */
	public static String getAffair() {
		return _ps.getProperty("affair");
	}
	
	/**
	 * 获取配置文件中广告公告的ip地址
	 * */
	public static String getNotice() {
		return _ps.getProperty("notice");
	}
	
	
	//获取项目路径的绝对地址，基于tomcat的webapp
	public static String getLocalhostIp(HttpServletRequest request) {
		String basePath = request.getContextPath()+"/uploadtrademark/";
		return basePath;
	}
	
	//通过request获取客户端的 ip地址
	public static String getRemoteIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getRemoteAddr();
		}
		return ip;
	}
}
