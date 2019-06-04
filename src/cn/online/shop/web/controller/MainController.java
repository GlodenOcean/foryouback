package cn.online.shop.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import cn.es.common.ESController;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESMD5;
import cn.online.shop.config.R;
import cn.online.shop.web.model.Role;
import cn.online.shop.web.model.Source;
import cn.online.shop.web.model.User;
import sun.awt.AppContext;

public class MainController extends ESController {

	public void index() {
		render("index.jsp");
	}

	public void logout() {

//		User user = (User) getSession().getAttribute("loginUser");
//		@SuppressWarnings("unchecked")
//		Map<String, String> loginUserMap = (Map<String, String>) AppContext.getAppContext().get(R.LOGIN_USER_MAP);
//		if (loginUserMap.containsKey(user.getId())) {
//			loginUserMap.remove(user.getId());
//		}
		getSession().removeAttribute("loginUser");
		getSession().removeAttribute("removeControlId");
		render("login.jsp");
	}

	public void logout2() {

		HttpSession session = getSession(true);
		try {
			long lastAccessedTime1 = session.getLastAccessedTime(); // 离开当前页面的时间
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			long lastAccessedTime2 = session.getLastAccessedTime(); // 重新加载当前页面的时间(刷新和重定向)
			System.out.println(lastAccessedTime1);
			System.out.println(lastAccessedTime2);
			if (lastAccessedTime1 != lastAccessedTime2) {
				User user = (User) getSession().getAttribute("loginUser");
				@SuppressWarnings("unchecked")
				Map<String, String> loginUserMap = (Map<String, String>) AppContext.getAppContext()
						.get(R.LOGIN_USER_MAP);
				if (loginUserMap.containsKey(user.getId())) {
					loginUserMap.remove(user.getId());
				}
				getSession().removeAttribute("loginUser");
				getSession().removeAttribute("removeControlId");
				render("login.jsp");
			}
		} catch (IllegalStateException e) {
			System.out.println(e.getMessage());
		}
	}

	public void loginpage() {
		render("login.jsp");
	}

	public void welcome() {
		render("welcome.jsp");
	}

	public void loginDialog() {
		setAttr("preRequestType", getPara("preRequestType"));
		render("loginDialog.jsp");
	}

	public void timeoutPage() {
		render("timeout.jsp");
	}

	public void icon() {
		render("icon.jsp");
	}

	public void login() {
//		if (!CaptchaRender.validate(this, getPara("captchaCode"))) {
//			renderFailJson("验证码不正确.");
//			return;
//		}
		String s = getPara("loginId");
		System.out.println("===================="+s );
		User user = User.dao.searchByloginId(s);
		System.out.println("==================user=="+ JSON.toJSONString(user) );
		String loginPassword = ESMD5.codeFor(getPara("loginPassword"));
		if (user == null || !user.getPassword().equals(loginPassword)) {
			renderFailJson("用户名/密码错误.");
		} else {
			if (ESBoolean.isEmpty(user.getRoleId())) {
				renderFailJson("此用户没有分配角色,无法登录.");
			} else {

				// 判断是否重复登录
				boolean isloginexists = false;
				boolean ifsessioninvalidate = false;
				@SuppressWarnings("unchecked")
				Map<String, String> loginUserMap = (Map<String, String>) AppContext.getAppContext()
						.get(R.LOGIN_USER_MAP);
				if (loginUserMap == null) {
					loginUserMap = new HashMap<String, String>();
				}
				String sessionId = getSession(false).getId();
				System.out.println("sessionId" + sessionId);
				for (String userlogicId2 : loginUserMap.keySet()) {
					if (!userlogicId2.equals(user.getId()) && !loginUserMap.containsValue(sessionId)) { // 不同浏览器不允许相同用户重复登录
						continue;
					}

					if (userlogicId2.equals(user.getId()) && !loginUserMap.containsValue(sessionId)) {
						ifsessioninvalidate = true;
					}
					isloginexists = true;
					break;
				}
				if (isloginexists) {
					renderFailJson("用户已登录.");
					if (ifsessioninvalidate == true) {
						getSession(false).invalidate();
					}

				} else {

					loginUserMap.put(user.getId(), sessionId);
					AppContext.getAppContext().put(R.LOGIN_USER_MAP, loginUserMap);
					saveAccess(user.getRoleId());
					getSession().setAttribute("loginUser", user);
					renderSuccessJson();
				}
				saveAccess(user.getRoleId());
				getSession().setAttribute("loginUser", user);
				renderSuccessJson();
			}
		}
	}

	/**
	 * 获取用户没有的权限ID,用于隐藏.
	 * 
	 * @param roleId
	 */
	private void saveAccess(String roleId) {
		List<Source> all = Source.dao.searchAll();

		List<String> hasTemp = new ArrayList<String>();
		List<String> allTemp = new ArrayList<String>();

		for (Source source : all) {
			allTemp.add(source.getControlId());
		}

		Role role = Role.dao.findById(roleId);
		if (ESBoolean.isNotEmpty(role.getSource())) {
			String[] ctrIds = role.getSource().split(",");
			for (String ctr : ctrIds) {
				hasTemp.add(ctr);
			}
		}

		// 获取没有权限的ID,用于删除
		allTemp.removeAll(hasTemp);

		String removeControlId = "";
		for (String cid : allTemp) {
			removeControlId += cid + ",";
		}

		getSession().setAttribute("removeControlId", removeControlId);
	}

	public void getCaptchaCode() throws IOException {
		renderCaptcha();
	}
	
	/**
	 * 操作手册
	 */
	public void download() {
		File file = new File(getWebRootPath() + "/upload/file/ 交易综合管理后台操作指引20170619.doc");
		renderFile(file);
	}
}
