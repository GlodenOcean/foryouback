package cn.online.nocard.web.controller;


import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESController;
import cn.es.utils.ESString;
import cn.online.nocard.config.R;
import cn.online.nocard.web.model.ExceptionLog;

/**
 * 异常日志
 * @author 钟展峰
 *
 * 2016年1月8日
 */
public class ExceptionLogController extends ESController{
	
	public void search(){
		Page<ExceptionLog> page = ExceptionLog.dao.search(super.getSearchCondition());
		for (ExceptionLog log : page.getList()) {
			log.put("fromString", R.fromMap.get(log.getFrom()));
		}
		setPageResultToRequest("logList", page);
		render("log/exceptionLogList.jsp");
	}

	public void find(){
		String id = getPara("id");
		ExceptionLog log = ExceptionLog.dao.findById(id);
		log.setThrowMessage(ESString.textConvertToCodeHtml(log.getThrowMessage()));
		setAttr("exceptionLog", log);
		render("log/exceptionLogDetail.jsp");
	}
	
	public void delete(){
		Object[] ids = getParaValues("ids");
		ExceptionLog.dao.batchDeleteById(ids);
		renderSuccessJson();
	}
}
