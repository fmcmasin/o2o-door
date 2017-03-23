package com.o2o.door.common.copy;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

public class DataExcel {
	
	/*
	 * 自定义返回字段方法
	 */
	private String getTitle(Field field) {
		if (field.isAnnotationPresent(ExcelTitle.class)) {
			String str = field.getAnnotation(ExcelTitle.class).title();
			if (!"".equals(str)) {
				return str;
			}
		}
		return "";
	}
	
	public <T> Map<String, Object> getDataExcelCellList(String fileExcel, Class<T> type)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// 创建新集合对象
		List<T> ts = new ArrayList<T>();
		// 创建单个对象
		T obj = null;
		// 反射所有字段
		Field[] fs = type.getDeclaredFields();
		List<String> checkTitle= new ArrayList<String>(0);
		// set方法集合
		List<Method> lms = new ArrayList<Method>();
		// 对set方法集合输入值
		for (int i = 0; i < fs.length; i++) {
			String name = fs[i].getName();
			Class<?> fType = fs[i].getType();
			checkTitle.add(this.getTitle(fs[i]));
			lms.add(type.getMethod(
					"set" + name.substring(0, 1).toUpperCase()
							+ name.substring(1), fType));
		}
		List<String[]>  list = new ArrayList<String[]>();
		//创建输入流  
        InputStream stream = new FileInputStream(fileExcel);  
        //获取Excel文件对象  
        Workbook  rwb = Workbook.getWorkbook(stream);  
        //获取文件的指定工作表 默认的第一个  
        Sheet sheet = rwb.getSheet(0);    
        //行数(表头的目录不需要，从1开始)  
        for(int i=1; i<sheet.getRows(); i++){
        	if(i==2||i==3)
        		continue;
             //创建一个数组 用来存储每一列的值  
            String[] str = new String[sheet.getColumns()];  
            Cell cell = null;  
            //列数  
            for(int j=0; j<sheet.getColumns(); j++){  
              //获取第i行，第j列的值  
              cell = sheet.getCell(j,i);      
              str[j] = cell.getContents();  
            }  
          //把刚获取的列存入list  
          list.add(str);  
        }
        LinkedList<String>  doorlist = new LinkedList<String>();   //门列表
        LinkedList<LinkedList<String>>  userlist = new LinkedList<LinkedList<String>>();   //用户列表
        boolean isFirst = true;
        for (String[] strings : list) {
        	if(!isFirst){
        		LinkedList<String>  li = new LinkedList<String>();   
        		for (int i=0;i<strings.length;i++) {
        		    li.add(strings[i]);
        		}
        		userlist.add(li);
        	}
        	if(isFirst){
	        	for (int i=0;i<strings.length;i++) {
	        		doorlist.add(strings[i]);
				}
	        	isFirst = false;
        	}
		}
        //组装 门和用户列表对应
        List<String>  authlist = new ArrayList<String>();
        for(LinkedList<String>  _list:userlist){
        	// 反射获取示例,存储人员信息，门信息单独反射
			 obj = type.newInstance();
			 for (int j = 0; j < checkTitle.size()-1; j++) {
				Method m = lms.get(j);
				m.invoke(obj, _list.get(j));
			 }
			 for(int i=5;i<_list.size();i++){
				 if(Integer.valueOf(_list.get(i))==1){
					 authlist.add(doorlist.get(i));
				 }
			 }
			 Method m = lms.get(checkTitle.size()-1);
			 m.invoke(obj, authlist);
			 ts.add(obj);
        }
        map.put("datalist", ts);
	    return map;
	}
	

}
