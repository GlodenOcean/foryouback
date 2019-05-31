package cn.online.nocard.web.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESSearchCondition;
import cn.es.utils.ESSQLHelper;
import cn.online.nocard.util.HCSqlHelper;
import cn.online.nocard.web.model.base.BaseMerch;

/**
 * @Description: 商户查询dao
 * @author: ocean
 * @date: 2017年4月24日 下午6:05:06
 * @version: V1.0
 */
@SuppressWarnings("serial")
public class Merch extends BaseMerch<Merch> {
	public static final Merch dao = new Merch();

	/**
	 * 分页查询
	 * 
	 * @param sc
	 * @return
	 */
	public Page<Merch> search(ESSearchCondition sc) {
		int pageNumber = sc.page.getIndex();
		int pageSize = sc.page.getSize();

		ESSQLHelper sql = new ESSQLHelper(" from t_merch WHERE 1 = 1");
		sql.equals("MerchId", sc.getString("MerchId"));
		sql.equals("MerchName", sc.getString("MerchName"));
		sql.equals("UpMerchId", sc.getString("UpMerchId"));
		sql.equals("InstNo", sc.getString("InstNo"));
		sql.equals("MerchStatus", sc.getString("MerchStatus"));
		sql.equals("IsT1YECZ", sc.getString("IsT1YECZ"));
		sql.orderBy(sc, "AddTime", "desc");
		return super.paginate(pageNumber, pageSize, "select *", sql.toString(), sql.getParams());

	}

	/**
	 * 查询所有商户
	 * 
	 * @param sc
	 * @return
	 */
	public List<Merch> searchAll() {
		String sql = "SELECT * FROM t_merch";
		return super.find(sql);
	}

	/**
	 * 根据用户登录ID查询
	 * 
	 * @param loginId
	 * @return
	 */
	public Merch findById(String MerchId) {
		return super.findFirst("select * from t_merch where MerchId = ?", MerchId);
	}

	public boolean batchDelete(Object... ids) {
		ESSQLHelper sql = new ESSQLHelper("DELETE FROM t_merch WHERE 1 = 1");
		sql.in("MerchId", ids);
		return Db.update(sql.toString(), sql.getParams()) > 0;
	}

	public boolean batchSetNullRoleIdByRoleId(Object... merchIds) {
		ESSQLHelper sql = new ESSQLHelper("UPDATE t_merch set roleId = null WHERE 1 = 1");
		sql.in("MerchId", merchIds);
		return Db.update(sql.toString(), sql.getParams()) > 0;
	}

	/**
	 * 统计预生成商户号中未使用的数量
	 * 
	 * @return
	 */
	public Long countUseMerchCode() {
		return Db.queryLong("SELECT COUNT(*) FROM t_merch WHERE useStatus = ?", "0");
	}

	/**
	 * 根据使用状态，流水号长度，生成数量,机构号查询商户列表
	 * 
	 * @param useStatus
	 *            使用状态
	 * @param len
	 *            流水号长度
	 * @param nums
	 *            生成数量
	 * @return List<Merch> 商户列表
	 * @author wsr
	 */
	public List<Merch> searchForCrePic(String useStatus, int len, int nums, String orgId) {
		return super.find(
				"SELECT * FROM t_merch where isExport = ? AND LENGTH(serialNo) = ? AND InstNo = ? AND UpdateTime > ? ORDER BY UpdateTime DESC LIMIT ?",
				useStatus, len, orgId, "2016-09-20 20:30:00", nums);
	}

	// 查找最大的serialNo并且长度为6位的数字
	public String searchMaxSerialNo() {
		return Db.queryStr(
				"SELECT serialNo FROM t_merch WHERE serialNo  REGEXP '^[0-9]+$' AND LENGTH(serialNo) = 6 ORDER  BY serialNo DESC LIMIT 1;");
	}

	/**
	 * 根据商户编号查询商户信息
	 * 
	 * @param code
	 * @return
	 */
	public Merch searchByMerchId(String merchId) {
		return super.findFirst("SELECT * FROM t_merch WHERE MerchId = ?", merchId);
	}

	/**
	 * 根据流水号查询商户信息
	 * 
	 * @param serialNo
	 * @return
	 */
	public Merch searchBySerialNo(String serialNo) {
		return super.findFirst("SELECT * FROM t_merch WHERE serialNo = ?", serialNo);
	}

	/**
	 * 根据openId查询商户信息
	 * 
	 * @param openId
	 *            商家的微信id
	 * @return List<Merch> 商户列表 一个微信号可以对应多个商户信息
	 */
	public List<Merch> searchByOpenId(String openId) {
		HCSqlHelper sql = new HCSqlHelper("SELECT * FROM t_merch WHERE 1 = 1");
		sql.like("openId", openId);
		return super.find(sql.toString(), sql.getParams());
	}

	/**
	 * 根据手机号码查询商户信息
	 * 
	 * @param phone
	 *            手机号码
	 * @return 一个商户信息
	 */
	public Merch searchByCellPhone(String phone) {
		return super.findFirst("SELECT * FROM t_merch WHERE MerchTel = ? LIMIT 1", phone);
	}
	
	/**
	 * 根据手机号码查询商户信息
	 * @param phone 手机号码
	 * @return 商户list
	 */
	public List<Merch> searchByPhone(String phone){
		return super.find("SELECT * FROM t_merch WHERE MerchTel = ?", phone);
	}

	public List<Merch> searchByCodes(Object[] codes) {
		HCSqlHelper sql = new HCSqlHelper("SELECT * FROM t_merch WHERE 1 = 1");
		sql.in("MerchId", codes);
		return super.find(sql.toString(), sql.getParams());
	}

}