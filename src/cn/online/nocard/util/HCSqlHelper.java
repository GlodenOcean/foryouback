package cn.online.nocard.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * SQL语句, 可以进行SQL语句拼装和参数拼装,提供一些便利操作,免去再手动拼SQL的错误
 * 2015年8月4日
 */
public class HCSqlHelper {
	
	private StringBuffer baseSql;
	private List<Object> parameters;
	
	public HCSqlHelper(String baseSql){
		this.baseSql = new StringBuffer(baseSql);
		parameters = new ArrayList<Object>();
	}
	
	
	/**
	 * 拼装排序语句   sql.append(" order by orderField orderDirection , orderField2 orderDirection ..“)  前后带空格 <br/>
	 * 如果orderField为null,不做排序
	 * @param orderField  排序字段
	 * @param orderDirection 排序操作，asc 或 desc
	 */
	public void orderBy(String orderField,String orderDirection){
		if(HCBoolean.isNotEmpty(orderField)){
			if(HCBoolean.isEmpty(orderDirection)){
				orderDirection = "asc";
			}
			
			if(baseSql.indexOf("order by") != -1){
				baseSql.append(" , ");
			}else{
				baseSql.append(" order by ");
			}
			
			baseSql.append(orderField);
			baseSql.append(" ");
			baseSql.append(orderDirection);
		}
	
	}
	
	/**
	 * 拼接 like 语句,参数集合已经在此添加
	 * <br/>注意：若参数的值为Null或""是不会加入条件的
	 * @param filedName  字段名
	 * @param filedValue 字段对应的值
	 */
	public void like(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" like ? ");
			parameters.add("%"+filedValue+"%");
		}
	}
	
	/**
	 * 拼接 like 语句,  like 'value%'
	 * @param filedName
	 * @param filedValue
	 */
	public void startLike(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" like ? ");
			parameters.add(filedValue+"%");
		}
	}
	
	/**
	 * 拼接 like 语句,  like '%value'
	 * @param filedName
	 * @param filedValue
	 */
	public void endLike(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" like ? ");
			parameters.add("%"+filedValue);
		}
	}
	
	
	/**
	 * 拼接 like 语句,   not like '%value%'
	 * @param filedName
	 * @param filedValue
	 */
	public void notLike(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" not like ? ");
			parameters.add("%"+filedValue+"%");
		}
	}
	
	/**
	 * 拼接 like 语句,   not like 'value%'
	 * @param filedName
	 * @param filedValue
	 */
	public void startNotLike(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" not like ? ");
			parameters.add(filedValue+"%");
		}
	}
	
	/**
	 * 拼接 like 语句,   not like '%value'
	 * @param filedName
	 * @param filedValue
	 */
	public void endNotLike(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" not like ? ");
			parameters.add("%"+filedValue);
		}
	}
	
	
	/**
	 * 拼接=语句,参数集合已经在此添加
	 * <br/>注意：若参数的值为Null或""是不会加入条件的
	 * @param filedName  字段名
	 * @param filedValue 字段对应的值
	 */
	public void equals(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" = ? ");
			parameters.add(filedValue);
		}
	}
	
	public void notEquals(String filedName,Object filedValue){
		if(HCBoolean.isNotNull(filedValue)){
			baseSql.append(" AND "+filedName+" != ? ");
			parameters.add(filedValue);
		}
	}
	
	/**
	 * 拼接日期条件,自动根据begin和end是否为空来拼接是between、>=、<=
	 * @param filedName 字段名
	 * @param begin 开始时间
	 * @param end	结束时间
	 */
	public void date(String filedName,String begin,String end){
		if(HCBoolean.isNotEmpty(begin) && HCBoolean.isNotEmpty(end)){
			baseSql.append(" AND ");
			baseSql.append(filedName);
			baseSql.append(" BETWEEN ? and ? ");
			parameters.add(begin);
			parameters.add(end);
		}
		if(HCBoolean.isNotEmpty(begin) && HCBoolean.isEmpty(end)){
			baseSql.append(" AND ");
			baseSql.append(filedName);
			baseSql.append(" >= ?");
			parameters.add(begin);
		}
		if(HCBoolean.isEmpty(begin) && HCBoolean.isNotEmpty(end)){
			baseSql.append(" AND ");
			baseSql.append(filedName);
			baseSql.append(" <= ?");
			parameters.add(end);
		}
	}
	
	public void in(String fileName,Object... values){
		baseSql.append(" AND ");
		baseSql.append(fileName);
		baseSql.append(" in (");
		
		for(int i = 0; i < values.length;i++){
			if(i == values.length - 1){
				baseSql.append("?)");
			}else{
				baseSql.append("?,");
			}
			
			parameters.add(values[i]);
		}
	}
	/**
	 * 拼接日期条件,自动根据begin和end是否为空来拼接是between、>=、<=
	 * @param filedName 字段名
	 * @param begin 开始时间
	 * @param end	结束时间
	 */
	public void dateReal(String filedName,Date begin,Date end){
		baseSql.append(" AND ");
		baseSql.append(filedName);
		if(HCBoolean.isEmpty(begin) && !HCBoolean.isEmpty(end) ){
			baseSql.append("<=");
			baseSql.append(end);
		}
		if(!HCBoolean.isEmpty(begin) && HCBoolean.isEmpty(end) ){
			baseSql.append(">=");
			baseSql.append(begin);
		}
		if(!HCBoolean.isEmpty(begin) && !HCBoolean.isEmpty(end) ){
			baseSql.append(" between ? and ?");
			parameters.add(begin);
			parameters.add(end);
		}
		
	}
	public void append(String sql ){
		baseSql.append(" AND ");
		baseSql.append(sql);
	}

	@Override
	public String toString() {
		return baseSql.toString();
	}

	public Object[] getParams() {
		return parameters.toArray();
	}

	public List<Object> getParameters() {
		return parameters;
	}
	
	public void groupBy(String field ){	
		baseSql.append(" GROUP BY " + field);
	}
	
}


