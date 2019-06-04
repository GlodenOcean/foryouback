package cn.online.shop.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.google.gson.Gson;

import cn.es.utils.ESBoolean;
import net.sf.json.JSONObject;

/**
 * JSON工具
 */
public class HCJson {
	
	private static Gson gson = new Gson();
	
	/**
	 * 将对象转换成json字符串
	 * @param source
	 * @return
	 */
	public static String toString(Object source){
		return gson.toJson(source);
	}
	
	/**
	 * 将json字符串转换成对象
	 * @param source
	 * @param cls
	 * @return
	 */
	public static <T> T toObject(String source,Class<T> cls){
		return gson.fromJson(source, cls);
	}
	
	/**
	 * 将form请求过来的参数转换成某个对象
	 * @param formString 格式 key=value&key...
	 * @param cls
	 * @return
	 */
	public static <T> T toObjectByFormString(String formString,Class<T> cls){
		String[] keyValueArray = formString.split("&");
		Map<String, Object> tempMap = new HashMap<String, Object>();
		for (String temp : keyValueArray) {
			String[] kvArray = temp.split("=");
			if(kvArray.length < 2 || ESBoolean.isEmpty(kvArray[1])){
				tempMap.put(kvArray[0], "");
			}else{
				tempMap.put(kvArray[0], kvArray[1]);
			}
		}
		return toObject(toString(tempMap), cls);
	}
	
	/**
	 * json转map
	 */
	public static Map<String, String> jsonToMapString(Object object){
		
		Map<String, String> data = new HashMap<String, String>();	
	    JSONObject jsonObject = JSONObject.fromObject(object);  
        Iterator<?> it = jsonObject.keys();  
        // 遍历jsonObject数据，添加到Map对象  
        while (it.hasNext()){  
           String key = String.valueOf(it.next());  
           String value = jsonObject.getString(key);  
           data.put(key, value);  
       }  
       return data;  

	}
	
	/**
	 * json转map
	 */
	public static Map<String, Object> jsonToMap(Object object){
		
		Map<String, Object> data = new HashMap<String, Object>();	
	    JSONObject jsonObject = JSONObject.fromObject(object);  
        Iterator<?> it = jsonObject.keys();  
        // 遍历jsonObject数据，添加到Map对象  
        while (it.hasNext()){  
           String key = String.valueOf(it.next());  
           String value = jsonObject.getString(key);  
           data.put(key, value);  
       }  
       return data;  

	}
	
}
