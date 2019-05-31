package cn.online.nocard.web.controller;


import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESController;
import cn.online.nocard.web.model.Log;
import cn.online.nocard.web.model.LogDetail;

/**
 * 日志控制器
 * @author 钟展峰 
 * by 2015年8月4日
 */
public class LogController extends ESController{

	public void search(){
		Page<Log> page = Log.dao.search(super.getSearchCondition());
		setPageResultToRequest("logList", page);
		render("log/logList.jsp");
	}
	
	public void delete(){
		Object[] ids = getPara("ids").split(",");
		Log.dao.batchDelete(ids);
		search();
	}
	
	public void searchDetail(){
		Page<LogDetail> page = LogDetail.dao.search(super.getSearchCondition());
		setPageResultToRequest("logDetailList", page);
		render("log/logDetailList.jsp");
	}
}
