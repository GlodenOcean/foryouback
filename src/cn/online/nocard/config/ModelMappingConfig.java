package cn.online.nocard.config;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

import cn.online.nocard.web.model.ExceptionLog;
import cn.online.nocard.web.model.Log;
import cn.online.nocard.web.model.LogDetail;
import cn.online.nocard.web.model.Merch;
import cn.online.nocard.web.model.Order;
import cn.online.nocard.web.model.Role;
import cn.online.nocard.web.model.Source;
import cn.online.nocard.web.model.User;

/**
 * 实体映射
 * 
 * @author ocean
 *
 *         2017年4月24日
 */
public class ModelMappingConfig {

	public static void mapping(ActiveRecordPlugin arp) {

//		// 商户表
//		arp.addMapping("t_merch", "MerchId", Merch.class);
//
//		// 当天订单表
//		arp.addMapping("t_order", "OrderNo", Order.class);
//
//		// 用户表
//		arp.addMapping("sys_user", User.class);
//
//		// 角色表
//		arp.addMapping("sys_role", Role.class);
//
//		// 操作日志表
//		arp.addMapping("sys_log", Log.class);
//
//		// 操作日志表
//		arp.addMapping("sys_log_detail", LogDetail.class);
//
//		// 系统资源表
//		arp.addMapping("sys_source", Source.class);
//
//		// 异常日志
//		arp.addMapping("sys_exception_log", ExceptionLog.class);


	}

}
