package cn.online.nocard.interceptors;

import java.io.PrintWriter;
import java.io.StringWriter;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;

import cn.es.common.ESResponser;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESDate;
import cn.es.utils.ESIDGenerate;
import cn.online.nocard.config.R;
import cn.online.nocard.web.model.ExceptionLog;
import cn.online.nocard.web.model.User;

/**
 * 统一异常处理类,记录异常日志
 * @author ocean
 *
 * 2015年8月24日
 */
public class ExceptionInterceptor implements Interceptor {
	
	private static Log log = Log.getLog("");

	@Override
	public void intercept(Invocation inv) {
		try {
			inv.invoke();
		} catch (Exception e) {
			e.printStackTrace();
			//保存日志信息
            saveExceptionLog(e, inv);
            renderWhenHasException(inv);
            StringBuffer sb = new StringBuffer("\n-------------------------------------" + inv.getController().getClass().getName() + "-------------------------------------\n");
            sb.append(e.getMessage());
            log.error(sb.toString());
		}
	}
	
	/**
	 * 当发生异常时返回数据
	 * @param inv
	 */
	public void renderWhenHasException(Invocation inv){
		Controller controller = inv.getController();
		String requestPage = controller.getPara("requestPage");
		String toModal = controller.getPara("toModal");
		//是否通过Ajax请求HTML页面,如果是则返回自定义500页面
		if(ESBoolean.isNotEmpty(requestPage)){
			controller.render("/WEB-INF/view/error/500.jsp");
		}else if(ESBoolean.isNotEmpty(toModal)){
			controller.render("/WEB-INF/view/error/modal-error.jsp");
		}else{
			controller.renderJson(ESResponser.exception());
		}
		
	}
	
	/**
	 * 保存异常信息
	 * @param throwMessage 抛出的信息
	 * @param inv
	 */
	public void saveExceptionLog(Exception e,Invocation inv){
		User loginUser = (User) inv.getController().getSession().getAttribute("loginUser");
		if(loginUser != null){
			StringWriter sw = new StringWriter(); 
	        e.printStackTrace(new PrintWriter(sw, true)); 
	        String throwMessage = sw.toString();  
			ExceptionLog log = new ExceptionLog();
			log.setId(ESIDGenerate.getUUID());
			log.setActionKey(inv.getActionKey());
			log.setThrowDate(ESDate.getDate());
			log.setThrowTime(ESDate.getTime());
			log.setThrowMessage(throwMessage);
			log.setUserLoginId(loginUser.getLoginId());
			log.setFrom(getExceptionFrom(inv));
			log.save();
		}
	}
	
	public int getExceptionFrom(Invocation inv){
		String actionKey = inv.getActionKey();
		if(actionKey.indexOf("api") > 0){
			return R.FROM_API;
		}
		return R.FROM_WEB;
	}

}
