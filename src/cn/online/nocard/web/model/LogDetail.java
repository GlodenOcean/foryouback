package cn.online.nocard.web.model;


import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESSearchCondition;
import cn.es.utils.ESSQLHelper;
import cn.online.nocard.web.model.base.BaseLogDetail;

/**
 * 系统操作日志
 * @author ocean
 * by 2017年5月3日
 */
public class LogDetail extends BaseLogDetail<LogDetail>{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 非线程安全,只供查询使用
	 */
	public static final LogDetail dao = new LogDetail();
	
	public Page<LogDetail> search(ESSearchCondition sc){
		int pageNumber = sc.page.getIndex();
		int pageSize = sc.page.getSize();
		//组装查询条件
		ESSQLHelper sql = new ESSQLHelper("FROM sys_log_detail WHERE 1 = 1");
		sql.in("detailId", sc.getString("detailId"));
		sql.orderBy("AddTime","desc");
		
		return super.paginate(pageNumber, pageSize, "select *", sql.toString(),sql.getParams());
	}
	
	
	
	
}
