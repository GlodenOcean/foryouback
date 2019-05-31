package cn.online.nocard.web.model;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESSearchCondition;
import cn.es.utils.ESSQLHelper;
import cn.online.nocard.web.model.base.BaseExceptionLog;

/**
 * 异常日志类
 * @author 钟展峰
 *
 * 2016年1月8日
 */
public class ExceptionLog extends BaseExceptionLog<ExceptionLog>{

	private static final long serialVersionUID = 1L;
	public static ExceptionLog dao = new ExceptionLog();

	public Page<ExceptionLog> search(ESSearchCondition sc){
		int pageNumber = sc.page.getIndex();
		int pageSize = sc.page.getSize();
		String startDate = sc.getString("startDate");
		String endDate = sc.getString("endDate");
		
		//组装查询条件
		ESSQLHelper sql = new ESSQLHelper("FROM sys_exception_log WHERE 1 = 1");
		sql.equals("userLoginId", sc.getString("userLoginId"));
		sql.date("throwDate", startDate, endDate);
		sql.orderBy("throwDate","desc");
		sql.orderBy("throwTime","desc");
		
		return super.paginate(pageNumber, pageSize, "select *", sql.toString(),sql.getParams());
	}
	
	public boolean batchDeleteById(Object... ids){
		ESSQLHelper sql = new ESSQLHelper("delete from sys_exception_log where 1 = 1");
		sql.in("id", ids);
		return Db.update(sql.toString(), sql.getParams()) > 0;
	}
	
	
}
