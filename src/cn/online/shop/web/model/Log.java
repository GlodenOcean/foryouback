package cn.online.shop.web.model;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESSearchCondition;
import cn.es.utils.ESSQLHelper;
import cn.online.shop.web.model.base.BaseLog;

/**
 * 系统日志
 * @author ocean
 * by 2019年6月6日
 */
public class Log extends BaseLog<Log>{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 非线程安全,只供查询使用
	 */
	public static final Log dao = new Log();
	
	public Page<Log> search(ESSearchCondition sc){
		int pageNumber = sc.page.getIndex();
		int pageSize = sc.page.getSize();
		String startDate = sc.getString("startDate");
		String endDate = sc.getString("endDate");
		
		//组装查询条件
		ESSQLHelper sql = new ESSQLHelper("FROM sys_log WHERE 1 = 1");
		sql.date("date", startDate, endDate);
		sql.equals("loginId", sc.getString("userLoginId"));
		sql.like("remark", sc.getString("content"));
		sql.orderBy("date","desc");
		sql.orderBy("time","desc");
		
		return super.paginate(pageNumber, pageSize, "select *", sql.toString(),sql.getParams());
	}
	
	public boolean batchDelete(Object... ids){
		ESSQLHelper sql = new ESSQLHelper("DELETE FROM sys_log WHERE 1 = 1");
		sql.in("id", ids);
		return Db.update(sql.toString(), sql.getParams()) > 0;
	}
	
}
