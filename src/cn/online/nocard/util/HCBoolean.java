package cn.online.nocard.util;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 简单的判断工具
 *
 * 2015年8月21日
 */
public class HCBoolean {
	
	/**
	 * 判断传入对象是否为空或值为空
	 *
	 * @param obj 需要判断是否为空的对象
	 * @return true-如果对象为空，false-如果对象非空
	 */
	public static boolean isEmpty(Object obj) {
		// 判断是否为空
		if (obj == null)
			return true;
		// ----------------根据各种对象类型判断是否值为空--------------
		if (obj instanceof String)
			return ((String) obj).trim().equals("");
		if (obj instanceof Collection) {
			Collection coll = (Collection) obj;
			return coll.size() == 0;
		}
		if (obj instanceof Map) {
			Map map = (Map) obj;
			return map.size() == 0;
		}
		if (obj.getClass().isArray())
			return Array.getLength(obj) == 0;
		else
			return false;
	}
	
	/**
	 * 是Null或 ""
	 * @param source
	 * @return
	 */
	public static boolean isEmpty(String source){
		return (source == null || source.trim().isEmpty());
	}
	
	/**
	 * 不为Null和 ""
	 * @param source
	 * @return
	 */
	public static boolean isNotEmpty(String source){
		return (source != null && !source.trim().isEmpty());
	}
	
	/**
	 * Null或 长度=0 
	 * @param source
	 * @return
	 */
	public static boolean isEmpty(String[] source){
		return (source == null || source.length == 0);
	}
	
	/**
	 * 非Null 并且 长度>0 返回true
	 * @param source
	 * @return
	 */
	public static boolean isNotEmpty(String[] source){
		return (source != null && source.length > 0);
	}
	
	/**
	 * Null 或 长度=0 返回true
	 * @param source
	 * @return
	 */
	public static boolean isEmpty(List<Object> source){
		return (source == null || source.size() == 0);
	}
	
	/**
	 * 非Null 并且 长度>0 返回true
	 * @param source
	 * @return
	 */
	public static boolean isNotEmpty(List<Object> source){
		return (source != null && source.size() > 0);
	}
	
	/**
	 * 非Null
	 * @param source
	 * @return
	 */
	public static boolean isNotNull(Object source){
		return source != null;
	}
	
	/**
	 * 是Null
	 * @param source
	 * @return
	 */
	public static boolean isNull(Object source){
		return source == null;
	}
	
}
