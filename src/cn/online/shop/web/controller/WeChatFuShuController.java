package cn.online.shop.web.controller;

import cn.es.common.ESController;
import cn.es.common.ESSearchCondition;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESDate;
import cn.es.utils.ESIDGenerate;
import cn.es.utils.ESMD5;
import cn.online.shop.config.R;
import cn.online.shop.web.model.Goods;
import cn.online.shop.web.model.Order;
import cn.online.shop.web.model.Role;
import cn.online.shop.web.model.User;
import com.alibaba.fastjson.JSON;
import com.jfinal.plugin.activerecord.Page;
import org.apache.log4j.Logger;

import java.util.Date;
import java.util.List;


/**
 * 富叔粮油控制器
 * @author ocean
 */
public class WeChatFuShuController extends ESController{

	private static Logger logger = Logger.getLogger(R.LOG_SYS);

	/**
	 * 分页查询goods
	 */
	public void searchGoods(){
		Page<Goods> page = Goods.dao.searchMerchGoodsList(super.getSearchCondition());
		setPageResultToRequest("goodsList", page);
		renderSuccessJson(page);
	}

	/**
	 * 下单接口
	 */

	public void createOrder(){
		ESSearchCondition sc = super.getSearchCondition();
		logger.info("sc= "+JSON.toJSONString(sc));
		logger.info("param= "+getPara("order"));
		Order order1 =JSON.parseObject(getPara("order"),Order.class);
		Order order = getModel(Order.class,"order");
		logger.info("order1= "+JSON.toJSONString(order1));
		logger.info("order= "+JSON.toJSONString(order));
		order.setOrderId(System.currentTimeMillis()+"13533640825");
		order.setCreateTime(new Date());
//		order.save();
		renderSuccessJson("下单成功，等待送货");
	}
	
}
