package cn.online.nocard.config;

import cn.online.nocard.web.model.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * 实体映射
 * 
 * @author ocean
 *
 *         2017年4月24日
 */
public class ModelMappingConfig {

	public static void mapping(ActiveRecordPlugin arp) {

		// 用户表
		arp.addMapping("sys_user", User.class);

		// 角色表
		arp.addMapping("sys_role", Role.class);

		// 操作日志表
		arp.addMapping("sys_log", Log.class);

		// 操作日志表
		arp.addMapping("sys_log_detail", LogDetail.class);

		// 系统资源表
		arp.addMapping("sys_source", Source.class);

		// 异常日志
		arp.addMapping("sys_exception_log", ExceptionLog.class);

		// 商户表
//		arp.addMapping("shop_merch", "MerchId", Merch.class);

		// 当天订单表
//		arp.addMapping("shop_order", "OrderNo", Order.class);

		// 商品表
		arp.addMapping("shop_goods", "id", Goods.class);

	}

}
