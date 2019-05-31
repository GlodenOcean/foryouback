package cn.online.nocard.config;

import com.jfinal.config.Routes;

import cn.online.nocard.web.controller.ExceptionLogController;
import cn.online.nocard.web.controller.FileController;
import cn.online.nocard.web.controller.LogController;
import cn.online.nocard.web.controller.MainController;
import cn.online.nocard.web.controller.MerchController;
import cn.online.nocard.web.controller.RoleController;
import cn.online.nocard.web.controller.SmsClientController;
import cn.online.nocard.web.controller.SourceController;
import cn.online.nocard.web.controller.UserController;

/**
 * 配置路由规则,相当于配置action访问地址
 * 
 * @author ocean
 *
 *         2016年3月17日
 */
public class RouteConfig extends Routes {

	@Override
	public void config() {
		// 商户
		super.add("/merch", MerchController.class, "/");

		// 用户
		super.add("/user", UserController.class, "/");

		// 角色
		super.add("/role", RoleController.class, "/");

		// 资源
		super.add("/source", SourceController.class, "/");

		// 操作日志
		super.add("/log", LogController.class, "/");

		// 异常日志
		super.add("/exceptionlog", ExceptionLogController.class, "/");

		// 异常日志
		super.add("/file", FileController.class, "/");

		// 主控制器
		super.add("/", MainController.class);

		// 发送短信验证码
		super.add("/smsMessage", SmsClientController.class, "/");


	}

}
