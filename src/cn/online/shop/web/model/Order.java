package cn.online.shop.web.model;

import java.util.List;

import cn.online.shop.web.model.base.BaseOrder;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import cn.es.common.ESSearchCondition;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESSQLHelper;

/**
 * @Description: 当天订单历史
 * @author: ocean
 * @date: 2017年4月26日 上午11:05:52
 * @version: V1.0
 */
public class Order extends BaseOrder<Order> {

	private static final long serialVersionUID = 1L;

	public static final Order dao = new Order();

	/**
	 * 分页查询
	 * 
	 * @param sc
	 * @return
	 */
	public Page<Order> search(ESSearchCondition sc) {
		int pageNumber = sc.page.getIndex();
		int pageSize = sc.page.getSize();
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");

		ESSQLHelper sql = new ESSQLHelper(" from t_order  WHERE PayType != '035' ");

		sql.date("TransTime", startCreateTime, endCreateTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("OrderNo", sc.getString("OrderNo"));
		sql.equals("BussID", sc.getString("BussID"));
		sql.equals("MerchOrderNo", sc.getString("MerchOrderNo"));
		sql.equals("ChName", sc.getString("ChName"));
		sql.equals("UpChOrderNo", sc.getString("UpChOrderNo"));
//		String payType = sc.getString("PayType");
//		if("055".equals(payType)){
//			sql.equals("PayType", "015");
//			sql.equals("ChTransName", "网关支付");
//		}else if("056".equals(payType)){
//			sql.equals("PayType", "015");
//			sql.like("ChTransName", "银联在线");
//		}else{
			sql.equals("PayType", sc.getString("PayType"));
//		}
		String orderStatus = sc.getString("OrderStatus");
		if(ESBoolean.isEmpty(orderStatus)){
		}else if("01".equals(orderStatus)){
			sql.notEquals("OrderStatus", "00");
			sql.notEquals("OrderStatus", "99");
		}else{
			sql.equals("OrderStatus", sc.getString("OrderStatus"));
		}
		sql.equals("ChId", sc.getString("ChId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		sql.equals("PayCretNum", sc.getString("PayCretNum"));
		sql.equals("Amount", sc.getString("Amount"));
		sql.equals("ChMerchId", sc.getString("ChMerchId"));

		sql.orderBy("TransTime", "desc");
		return super.paginate(pageNumber, pageSize, "select *", sql.toString(), sql.getParams());
	}


	public List<Record> sumSuccessMoney(ESSearchCondition sc) {
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");
		ESSQLHelper sql = new ESSQLHelper("SELECT count(*) as totalCount ,SUM(Amount) as sumSuccessMoney,SUM(Fee) sumFee FROM t_order WHERE PayType != '035' ");
		sql.date("TransTime", startCreateTime, endCreateTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("OrderNo", sc.getString("OrderNo"));
		sql.equals("MerchOrderNo", sc.getString("MerchOrderNo"));
		sql.equals("ChName", sc.getString("ChName"));
		sql.equals("ChMerchId", sc.getString("ChMerchId"));
		sql.equals("UpChOrderNo", sc.getString("UpChOrderNo"));
			sql.equals("PayType", sc.getString("PayType"));
		String orderStatus = sc.getString("OrderStatus");
		if(ESBoolean.isEmpty(orderStatus)){
		}else if("01".equals(orderStatus)){
			sql.notEquals("OrderStatus", "00");
			sql.notEquals("OrderStatus", "99");
		}else{
			sql.equals("OrderStatus", sc.getString("OrderStatus"));
		}
		sql.equals("ChId", sc.getString("ChId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		sql.equals("TransName", sc.getString("TransName"));
		sql.equals("PayCretNum", sc.getString("PayCretNum"));
		return Db.find(sql.toString(), sql.getParams());
	}

	public List<Record> sumSuccessMoneyDaiFu(ESSearchCondition sc) {
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");
		ESSQLHelper sql = new ESSQLHelper("SELECT count(*) as totalCount, SUM(Amount) as sumSuccessMoney,SUM(Fee) sumFee FROM t_order WHERE PayType = '035' ");
		sql.date("TransTime", startCreateTime, endCreateTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("OrderNo", sc.getString("OrderNo"));
		sql.equals("BussID", sc.getString("BussID"));
		sql.equals("ChMerchId", sc.getString("ChMerchId"));
		sql.equals("MerchOrderNo", sc.getString("MerchOrderNo"));
		sql.equals("ChName", sc.getString("ChName"));
		sql.equals("UpChOrderNo", sc.getString("UpChOrderNo"));
		String orderStatus = sc.getString("OrderStatus");
		if(ESBoolean.isEmpty(orderStatus)){
		}else if("01".equals(orderStatus)){
			sql.notEquals("OrderStatus", "00");
			sql.notEquals("OrderStatus", "99");
		}else{
			sql.equals("OrderStatus", sc.getString("OrderStatus"));
		}
		String IsT0 = sc.getString("IsT0");
		if(ESBoolean.isEmpty(IsT0)){
		}else if("1".equals(IsT0)){
			sql.equals("IsT0", "1");
		}else{
			sql.notEquals("IsT0", "1");
		}
		sql.equals("ChId", sc.getString("ChId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		sql.equals("PayCretNum", sc.getString("PayCretNum"));
		return Db.find(sql.toString(), sql.getParams());
	}

	public List<Record> debitAndCredit(ESSearchCondition sc) {
		String startTime = sc.getString("startTime");
		String endTime = sc.getString("endTime");
		ESSQLHelper sql = new ESSQLHelper(
				"SELECT BankType,count(*) as num FROM `t_order`  WHERE OrderStatus = '00' and Amount > 1");
		sql.date("TransTime", startTime, endTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		return Db.find(sql.toString() + " GROUP BY BankType ", sql.getParams());
	}

	public List<Record> countChannel(ESSearchCondition sc) {
		String startTime = sc.getString("startTime");
		String endTime = sc.getString("endTime");
		ESSQLHelper sql = new ESSQLHelper(
				"SELECT ChMerchId, count(*) as num  FROM `t_order` WHERE OrderStatus = '00' and ChMerchId in('850440053011220','850440053011304') ");
		sql.date("TransTime", startTime, endTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		return Db.find(sql.toString() + " GROUP BY ChMerchId ", sql.getParams());
	}

	public Order searchByMerchOrderNo(String merchOrderNo) {
		return super.findFirst("SELECT * FROM t_order WHERE MerchOrderNo = ? ", merchOrderNo);
	}

	/**
	 * 风险交易排查
	 * 
	 * @param sc
	 *            条件
	 * @param ids
	 *            子商户号
	 * @return
	 */
	public List<Record> countChMerchInfo(String startTime, String endTime, Object... ids) {
		ESSQLHelper sql = new ESSQLHelper(
				"SELECT MerchId, MerchName, COUNT(*) num, SUM(Amount) amount from t_order where ");
		sql.date("TransTime", startTime, endTime);
		sql.in("ChSubMerId", ids);
		return Db.find(sql.toString().replaceFirst("AND", "") + " GROUP BY MerchId ORDER BY COUNT(*) DESC ",
				sql.getParams());
	}

	/**
	 * 非代付导出
	 * 
	 * @param sc
	 * @return
	 */
	public List<Order> searchAll(ESSearchCondition sc) {
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");

		ESSQLHelper sql = new ESSQLHelper("select * from t_order  WHERE PayType != '035' ");

		sql.date("TransTime", startCreateTime, endCreateTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("OrderNo", sc.getString("OrderNo"));
		sql.equals("BussID", sc.getString("BussID"));
		sql.equals("MerchOrderNo", sc.getString("MerchOrderNo"));
		sql.equals("ChName", sc.getString("ChName"));
		sql.equals("UpChOrderNo", sc.getString("UpChOrderNo"));
		sql.equals("ChMerchId", sc.getString("ChMerchId"));
//		String payType = sc.getString("PayType");
//		if("055".equals(payType)){
//			sql.equals("PayType", "015");
//			sql.equals("ChTransName", "网关支付");
//		}else if("056".equals(payType)){
//			sql.equals("PayType", "015");
//			sql.like("ChTransName", "银联在线");
//		}else{
			sql.equals("PayType", sc.getString("PayType"));
//		}
		String orderStatus = sc.getString("OrderStatus");
		if(ESBoolean.isEmpty(orderStatus)){
		}else if("01".equals(orderStatus)){
			sql.notEquals("OrderStatus", "00");
			sql.notEquals("OrderStatus", "99");
		}else{
			sql.equals("OrderStatus", sc.getString("OrderStatus"));
		}
		sql.equals("ChId", sc.getString("ChId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		sql.equals("PayCretNum", sc.getString("PayCretNum"));
		sql.equals("Amount", sc.getString("Amount"));
		return super.find(sql.toString(), sql.getParams());
	}

	public List<Order> searchDaifuAll(ESSearchCondition sc) {
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");

		ESSQLHelper sql = new ESSQLHelper("select *  from t_order  WHERE PayType = '035' ");

		sql.date("TransTime", startCreateTime, endCreateTime);
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("OrderNo", sc.getString("OrderNo"));
		sql.equals("BussID", sc.getString("BussID"));
		sql.equals("MerchOrderNo", sc.getString("MerchOrderNo"));
		sql.equals("ChName", sc.getString("ChName"));
		sql.equals("UpChOrderNo", sc.getString("UpChOrderNo"));
		sql.equals("ChMerchId", sc.getString("ChMerchId"));
		String orderStatus = sc.getString("OrderStatus");
		if(ESBoolean.isEmpty(orderStatus)){
		}else if("01".equals(orderStatus)){
			sql.notEquals("OrderStatus", "00");
			sql.notEquals("OrderStatus", "99");
		}else{
			sql.equals("OrderStatus", sc.getString("OrderStatus"));
		}
		sql.equals("ChId", sc.getString("ChId"));
		sql.equals("SendInst", sc.getString("SendInst"));
		sql.equals("PayCretNum", sc.getString("PayCretNum"));
		sql.equals("Amount", sc.getString("Amount"));
		return super.find(sql.toString(), sql.getParams());
	}

	/**
	 * 交易成功率
	 */
	public List<Record> countSuccess(ESSearchCondition sc) {
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");
		ESSQLHelper sql = new ESSQLHelper(
				"select DATE_FORMAT(TransTime,'%H') as hour,count(*) as sum FROM t_order WHERE 1 = 1 ");
		sql.date("TransTime", startCreateTime, endCreateTime);
		sql.equals("OrderStatus", "00");
		return Db.find(sql.toString() + " group by DATE_FORMAT(TransTime,'%H')", sql.getParams());
	}

	public List<Record> count(ESSearchCondition sc) {
		String startCreateTime = sc.getString("startCreateTime");
		String endCreateTime = sc.getString("endCreateTime");
		ESSQLHelper sql = new ESSQLHelper(
				"select DATE_FORMAT(TransTime,'%H') as hour,count(*) as sum FROM t_order WHERE 1 = 1 ");
		sql.date("TransTime", startCreateTime, endCreateTime);
		return Db.find(sql.toString() + " group by DATE_FORMAT(TransTime,'%H')", sql.getParams());
	}
}
