package cn.online.shop.interceptors;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import cn.es.common.ESResponser;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESConfig;
import cn.es.utils.ESDate;
import cn.es.utils.ESIDGenerate;
import cn.online.shop.config.R;
import cn.online.shop.web.model.Log;
import cn.online.shop.web.model.LogDetail;
import cn.online.shop.web.model.Role;
import cn.online.shop.web.model.User;

/**
 * 全局拦截器,主要记录操作日志,登录超时验证
 * 
 * @author 钟展峰
 *
 *         2015年8月25日
 */
public class GloBalInterceptor implements Interceptor {

	private static HashMap<String, Integer> notFilterActionKey = new HashMap<String, Integer>();
	private static HashMap<String, String> contentMap = new HashMap<String, String>();
	static {
		notFilterActionKey.put("/logout", 1);
		notFilterActionKey.put("/loginpage", 1);
		notFilterActionKey.put("/login", 1);
		notFilterActionKey.put("/timeoutPage", 1);
		notFilterActionKey.put("/loginDialog", 1);
		notFilterActionKey.put("/getCaptchaCode", 1);
		//小程序接口
		notFilterActionKey.put("/fushu", 1);
		notFilterActionKey.put("/fushu/searchGoods", 1);

		contentMap.put("login", "登录");
		contentMap.put("/user/delete", "删除用户");
		contentMap.put("/user/update", "新增/修改用户");
		contentMap.put("/user/resetPassword", "重置用户密码");
		contentMap.put("/role/add", "新增角色");
		contentMap.put("/role/update", "修改角色");
		contentMap.put("/role/delete", "删除角色");
		contentMap.put("/role/allotAccess", "修改角色权限");
		contentMap.put("/log/delete", "删除操作日志");
		contentMap.put("/businessrule/add", "新增业务规则");
		contentMap.put("/businessrule/addTemplate", "新增规则模板");
		contentMap.put("/businessrule/update", "修改业务规则");
		contentMap.put("/businessrule/updateTemplate", "修改规则模板");
		contentMap.put("/businessrule/delete", "删除业务规则");
		contentMap.put("/businessrule/deleteTemplate", "移除规则模板关系");
		contentMap.put("/merch/add", "添加商户");
		contentMap.put("/merch/update", "更新商户信息");
		contentMap.put("/merch/delete", "删除商户");
		contentMap.put("/reTransPush/push", "推送信息");
		contentMap.put("/reTransPush/delete", "删除推送");
		contentMap.put("/channelMerch/add", "添加渠道商户");
		contentMap.put("/channelMerch/update", "更新渠道商户");
		contentMap.put("/channelMerch/delete", "删除渠道商户");
		contentMap.put("/bankCode/add", "添加银行接口");
		contentMap.put("/bankCode/update", "更新银行接口");
		contentMap.put("/bankCode/delete", "删除银行接口");

	}

	@Override
	public void intercept(Invocation inv) {
		log(inv);

		User user = (User) inv.getController().getSession().getAttribute("loginUser");
		if (user != null) {
			inv.invoke();
			return;
		}

		// 过滤不拦截的请求,如登录、退出、跳转到登录页面
		String actionKey = inv.getActionKey();
		if (isNotFiler(actionKey)) {
			inv.invoke();
			return;
		}

		// 超时时根据不同的请求类型做不同的返回处理
		String requestType = getRequestType(inv);
		if (R.REQ_NORMAL.equals(requestType)) {
			inv.getController().redirect("/loginpage");
		} else if (R.REQ_TAB.equals(requestType)) {
			inv.getController().redirect("/timeoutPage");
		} else if (R.REQ_DIALOG.equals(requestType)) {
			inv.getController().redirect("/loginDialog");
		} else {
			inv.getController().renderJson(ESResponser.timeout());
		}

	}

	/**
	 * 获取请求类型,如是url跳转,异步页面
	 * 
	 * @param inv
	 * @return
	 */
	private String getRequestType(Invocation inv) {
		HttpServletRequest request = inv.getController().getRequest();
		// 非ajax请求
		if (!(request.getHeader("accept").indexOf("application/json") > -1
				|| (request.getHeader("X-Requested-With") != null
						&& request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
			return R.REQ_NORMAL;
		}
		return request.getParameter("requestType");
	}

	/**
	 * 判断哪些不需要过滤
	 * 
	 * @param actionKey
	 * @return
	 */
	public boolean isNotFiler(String actionKey) {
		Integer value = notFilterActionKey.get(actionKey);

		if (ESBoolean.isNotNull(value)) {
			return true;
		}

		return false;
	}

	/**
	 * 记录操作日志
	 * 
	 * @param inv
	 */
	private void log(Invocation inv) {
		User user = (User) inv.getController().getSession().getAttribute("loginUser");
		String actionKey = inv.getActionKey();
		String content = contentMap.get(actionKey);

		if (content != null) {
			if (user != null && ESConfig.getBoolean("needLog")) {

				Log log = new Log();
				if (actionKey.indexOf("/businessrule") > -1) {
					content += convertBusinessRuleContent(inv);
				} else if (actionKey.contains("update") || actionKey.contains("add") || actionKey.contains("delete")) {
					try {
						saveOperationLog(inv, log);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

				log.setId(ESIDGenerate.getUUID());
				log.setLoginId(user.getLoginId());
				log.setUserName(user.getUserName());
				log.setRemark(content);
				log.setDate(ESDate.getDate());
				log.setTime(ESDate.getTime());
				log.setIp(getRequestIP(inv.getController().getRequest()));
				log.save();
			}
		}

	}

	protected String getRequestIP(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("Proxy-Client-IP");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("WL-Proxy-Client-IP");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getRemoteAddr();
		return ip;
	}

	/**
	 * 业务规则的操作内容需要添加参数
	 * 
	 * @return
	 */
	private String convertBusinessRuleContent(Invocation inv) {
		String actionKey = inv.getActionKey();
		Controller controller = inv.getController();

//		if (actionKey.equals("/businessrule/delete") || actionKey.equals("/businessrule/deleteTemplate")) {
//			String uuid = controller.getPara("uuid");
//			BusinessRule br = BusinessRule.dao.findById(uuid);
//			return "->名称:" + br.getBusiName();
//		}

		if (actionKey.indexOf("add") > -1) {
			String busiName = controller.getPara("busiName");
			return "->名称:" + busiName;
		}

		return "";
	}

	/**
	 * 如果存在差异，则插入操作日志详情表
	 * 
	 */
	public void saveLogDetail(String table, Map<String, String> nmap, Map<String, String> omap, String detailId,
			String type) {
		for (Entry<String, String> entry : nmap.entrySet()) {
			LogDetail logDetail = new LogDetail();
			if (type.equals("delete")) {
				logDetail.setColumn("删除");
				logDetail.setNewValue(null);
				logDetail.setOldValue(nmap.get(entry.getKey()));
				logDetail.setOperateTable(table);
				logDetail.setAddTime(ESDate.parseDate(ESDate.getDateTime(), "yyyy-MM-dd HH:mm:ss"));
				logDetail.setId(ESIDGenerate.getUUID());
				logDetail.setDetailId(detailId);
				logDetail.save();
			} else if (type.equals("update")) {
				if (ESBoolean.isEmpty(nmap.get(entry.getKey())) && ESBoolean.isEmpty(omap.get(entry.getKey()))
						|| nmap.get(entry.getKey()).equals(omap.get(entry.getKey()))) {
					// 没有改变值，不做日志记录
				} else {
					if ((nmap.get(entry.getKey()) != null && omap.get(entry.getKey()) != null)
							&& !nmap.get(entry.getKey()).equals(omap.get(entry.getKey()))) {
						logDetail.setColumn(entry.getKey());
						logDetail.setNewValue(entry.getValue());
						logDetail.setOldValue(omap.get(entry.getKey()));
					} else if (nmap.get(entry.getKey()) != null && omap.get(entry.getKey()) == null) {
						logDetail.setColumn(entry.getKey());
						logDetail.setNewValue(entry.getValue());
						logDetail.setOldValue("");
					} else if (nmap.get(entry.getKey()) == null && omap.get(entry.getKey()) != null) {
						logDetail.setColumn(entry.getKey());
						logDetail.setNewValue("");
						logDetail.setOldValue(omap.get(entry.getKey()));
					} else if (nmap.get(entry.getKey()) == null && omap.get(entry.getKey()) == null) {
						continue;
					}
					logDetail.setOperateTable(table);
					logDetail.setAddTime(ESDate.parseDate(ESDate.getDateTime(), "yyyy-MM-dd HH:mm:ss"));
					logDetail.setId(ESIDGenerate.getUUID());
					logDetail.setDetailId(detailId);
					logDetail.save();
				}
			}
		}

	}

	/**
	 * 添加操作记录 TODO
	 * 
	 * @return
	 * @throws Exception
	 */
	private void saveOperationLog(Invocation inv, Log log) throws Exception {
		String actionKey = inv.getActionKey();
		Controller controller = inv.getController();

		if (actionKey.contains("update")) {
			if (controller.getClass().getSimpleName().equals("MerchController")) { // 商户
//				Merch nMerch = controller.getModel(Merch.class, "merch");
//				Merch oMerch = Merch.dao.findById(nMerch.getMerchId());
				// 添加详细日志
				String detailId = ESIDGenerate.getUUID();
				HashMap<String, String> nMap = new HashMap<String, String>();
				HashMap<String, String> oMap = new HashMap<String, String>();
				// 封装进map里
//				nMap.put("InstNo", nMerch.getInstNo());
//				oMap.put("InstNo", oMerch.getInstNo());
//				nMap.put("UpMerchId", nMerch.getUpMerchId());
//				oMap.put("UpMerchId", oMerch.getUpMerchId());
//				nMap.put("TermId", nMerch.getTermId());
//				oMap.put("TermId", oMerch.getTermId());
//				nMap.put("MerchStatus", nMerch.getMerchStatus());
//				oMap.put("MerchStatus", oMerch.getMerchStatus());
//				nMap.put("T0_Contorl", nMerch.getT0Contorl());
//				oMap.put("T0_Contorl", oMerch.getT0Contorl());
//				nMap.put("EncKey", nMerch.getEncKey());
//				oMap.put("EncKey", oMerch.getEncKey());
//				nMap.put("TransModel", nMerch.getTransModel());
//				oMap.put("TransModel", oMerch.getTransModel());
//				nMap.put("MerchPool", nMerch.getMerchPool());
//				oMap.put("MerchPool", oMerch.getMerchPool());
//				nMap.put("SyncSN", nMerch.getSyncSN());
//				oMap.put("SyncSN", oMerch.getSyncSN());
//				nMap.put("Business", nMerch.getBusiness());
//				oMap.put("Business", oMerch.getBusiness());
//				nMap.put("LinkName", nMerch.getLinkName());
//				oMap.put("LinkName", oMerch.getLinkName());
//				nMap.put("MerchTel", nMerch.getMerchTel());
//				oMap.put("MerchTel", oMerch.getMerchTel());
//				nMap.put("MerchAddr", nMerch.getMerchAddr());
//				oMap.put("MerchAddr", oMerch.getMerchAddr());
//				nMap.put("wxAssPayCh", nMerch.getWxAssPayCh());
//				oMap.put("wxAssPayCh", oMerch.getWxAssPayCh());
//				nMap.put("aliAssPayCh", nMerch.getAliAssPayCh());
//				oMap.put("aliAssPayCh", oMerch.getAliAssPayCh());
//				nMap.put("QQAssPayCh", nMerch.getQQAssPayCh());
//				oMap.put("QQAssPayCh", oMerch.getQQAssPayCh());
//				nMap.put("JDAssPayCh", nMerch.getJDAssPayCh());
//				oMap.put("JDAssPayCh", oMerch.getJDAssPayCh());
//				nMap.put("uniAssPayCh", nMerch.getUniAssPayCh());
//				oMap.put("uniAssPayCh", oMerch.getUniAssPayCh());
//				nMap.put("noCardAssPayCh", nMerch.getNoCardAssPayCh());
//				oMap.put("noCardAssPayCh", oMerch.getNoCardAssPayCh());
//				nMap.put("GoodsNameType", nMerch.getGoodsNameType());
//				oMap.put("GoodsNameType", oMerch.getGoodsNameType());
//				nMap.put("AppId", nMerch.getAppId());
//				oMap.put("AppId", oMerch.getAppId());
//				nMap.put("Pid", nMerch.getPid());
//				oMap.put("Pid", oMerch.getPid());
//				nMap.put("SettleKind", nMerch.getSettleKind());
//				oMap.put("SettleKind", oMerch.getSettleKind());
				// 保存详细日志
				saveLogDetail("t_merch", nMap, oMap, detailId, "update");
				log.setType("更新");
//				log.setOperationObjId(oMerch.getMerchId());
//				log.setOperationObjName(oMerch.getMerchName());
				log.setOperationObj("商户");
				log.setDetailId(detailId);
			} else if (controller.getClass().getSimpleName().equals("UserController")) { // 用户管理
				User nUser = controller.getModel(User.class, "user");
				User oUser = User.dao.findById(nUser.getId());
				// 添加详细日志
				String detailId = ESIDGenerate.getUUID();
				HashMap<String, String> nMap = new HashMap<String, String>();
				HashMap<String, String> oMap = new HashMap<String, String>();
				// 封装进map里
				nMap.put("userName", nUser.getUserName());
				oMap.put("userName", oUser.getUserName());
				nMap.put("roleId", nUser.getRoleId());
				oMap.put("roleId", oUser.getRoleId());
				nMap.put("area", nUser.getArea());
				oMap.put("area", oUser.getArea());
				nMap.put("department", nUser.getDepartment());
				oMap.put("department", oUser.getDepartment());
				nMap.put("useType", nUser.getUseType());
				oMap.put("useType", oUser.getUseType());

				// 保存详细日志
				saveLogDetail("sys_user", nMap, oMap, detailId, "update");
				log.setType("更新");
				log.setOperationObjId(oUser.getId());
				log.setOperationObjName(oUser.getUserName());
				log.setOperationObj("用户");
				log.setDetailId(detailId);
			} else if (controller.getClass().getSimpleName().equals("RoleController")) { // 角色管理
				Role nRole = controller.getModel(Role.class, "role");
				Role oRole = Role.dao.findById(nRole.getId());
				// 添加详细日志
				String detailId = ESIDGenerate.getUUID();
				HashMap<String, String> nMap = new HashMap<String, String>();
				HashMap<String, String> oMap = new HashMap<String, String>();
				// 封装进map里
				nMap.put("roleName", nRole.getRoleName());
				oMap.put("roleName", oRole.getRoleName());
				nMap.put("description", nRole.getDescription());
				oMap.put("description", oRole.getDescription());
				
				// 保存详细日志
				saveLogDetail("sys_role", nMap, oMap, detailId, "update");
				log.setType("更新");
				log.setOperationObjId(oRole.getId());
				log.setOperationObjName(oRole.getRoleName());
				log.setOperationObj("角色");
				log.setDetailId(detailId);
			}
		} else if (actionKey.contains("add")) { // TODO
			if (controller.getClass().getSimpleName().equals("MerchController")) { // 商户
//				Merch nMerch = controller.getModel(Merch.class, "merch");
				// 添加详细日志
				log.setType("添加");
//				log.setOperationObjId(nMerch.getMerchId());
//				log.setOperationObjName(nMerch.getMerchName());
				log.setOperationObj("商户");
			}  else if (controller.getClass().getSimpleName().equals("UserController")) { // 用户
				User user = controller.getModel(User.class, "user");
				// 添加详细日志
				log.setType("添加");
				log.setOperationObjId(user.getId());
				log.setOperationObjName(user.getUserName());
				log.setOperationObj("用户");
			} else if (controller.getClass().getSimpleName().equals("RoleController")) { // 角色
				Role role = controller.getModel(Role.class, "role");
				// 添加详细日志
				log.setType("添加");
				log.setOperationObjId(role.getId());
				log.setOperationObjName(role.getRoleName());
				log.setOperationObj("角色");
			}
		} else if (actionKey.contains("delete")) { // TODO
			String[] ids = controller.getParaValues("ids");
			HashMap<String, String> map = new HashMap<String, String>();
			String detailId = ESIDGenerate.getUUID();
			log.setDetailId(detailId);
			if (controller.getClass().getSimpleName().equals("MerchController")) { // 商户
				for (int i = 0; i < ids.length; i++) {
//					Merch merch = Merch.dao.findById(ids[i]);
//					map.put(ids[i], merch.getMerchId() + ":" + merch.getMerchName());
				}
				// 保存详细日志
				saveLogDetail("t_merch", map, null, detailId, "delete");
				// 添加详细日志
				log.setType("删除");
				log.setOperationObjName("删除前置商户");
				log.setOperationObj("前置商户");
			}  else if (controller.getClass().getSimpleName().equals("UserController")) { // 删除用户
				for (int i = 0; i < ids.length; i++) {
					User user = User.dao.findById(ids[i]);
					map.put(ids[i], user.getId() + ":" + user.getUserName());
				}
				// 保存详细日志
				saveLogDetail("sys_user", map, null, detailId, "delete");
				// 添加详细日志
				log.setType("删除");
				log.setOperationObjName("删除用户");
				log.setOperationObj("用户");
			} else if (controller.getClass().getSimpleName().equals("RoleController")) { // 删除用户
				for (int i = 0; i < ids.length; i++) {
					Role role = Role.dao.findById(ids[i]);
					map.put(ids[i], role.getId() + ":" + role.getRoleName());
				}
				// 保存详细日志
				saveLogDetail("sys_role", map, null, detailId, "delete");
				// 添加详细日志
				log.setType("删除");
				log.setOperationObjName("删除角色");
				log.setOperationObj("角色");
			}
		}

	}

}
