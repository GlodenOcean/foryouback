package cn.online.shop.config;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.ModelRecordElResolver;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

import cn.es.utils.ESConfig;
import cn.online.shop.interceptors.ExceptionInterceptor;
import cn.online.shop.interceptors.GloBalInterceptor;

/**
 * 整个系统配置
 * @author zhongzf
 * @date 2015年12月29日
 */
public class WebConfig extends JFinalConfig {
	
	private static final Prop db = PropKit.use("db.properties");
	
	/**
	 * 项目基本配置
	 */
	@Override
	public void configConstant(Constants me) {
		me.setDevMode(ESConfig.getBoolean("devMode"));
		me.setEncoding(ESConfig.get("encoding"));
		me.setViewType(ViewType.JSP);
		//返回页面基础路径
		me.setBaseViewPath("/WEB-INF/view/");
	}
	
	@Override
	public void afterJFinalStart() {
		super.afterJFinalStart();
		//设置为True, 则不使用JavaBean的getter方法,而是Model的get方法
		//主要是多表联查,不存在JavaBean的字段可以使用
		ModelRecordElResolver.setResolveBeanAsModel(true);
	}

	/**
	 * 配置路由规则</br>
	 * 如：IndexController,注册后访问地址为  /index/方法&参数
	 */
	@Override
	public void configRoute(Routes me) {
		me.add(new RouteConfig());
	}

	/**
	 * 配置插件,如数据源
	 */
	@Override
	public void configPlugin(Plugins me) {
		//配置C3P0数据源插件配置
		String jdbcUrl = db.get("jdbcUrl");
		String userName = db.get("userName");
		String password = db.get("password");
		int maxPoolSize = db.getInt("maxPoolSize", 10);
		int minPoolSize = db.getInt("minPoolSize", 5);
		C3p0Plugin cp = new C3p0Plugin(jdbcUrl,userName,password);
		cp.setMaxPoolSize(maxPoolSize);
		cp.setMinPoolSize(minPoolSize);
		me.add(cp);
		
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		arp.setShowSql(ESConfig.getBoolean("showSql"));
		me.add(arp);

		//映射实体
		ModelMappingConfig.mapping(arp);	
		  
	}

	/**
	 * 配置拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		//全局拦截插件
		me.add(new GloBalInterceptor());
		//统一异常处理
		me.add(new ExceptionInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {

	}

}
