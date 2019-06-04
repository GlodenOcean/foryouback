package cn.online.shop.interceptors;

import java.util.Map;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import cn.es.common.ESController;
import cn.online.shop.config.R;
import cn.online.shop.web.model.User;
import sun.awt.AppContext;

/**
 * @Description: TODO
 * @author: ocean
 * @date: 2017年6月15日 上午10:22:39
 * @version: V1.0
 */
public class SessionListener extends ESController implements HttpSessionListener {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpSessionListener#sessionCreated(javax.servlet.http.
	 * HttpSessionEvent)
	 */
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpSessionListener#sessionDestroyed(javax.servlet.
	 * http.HttpSessionEvent)
	 */
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {

		try {
			User user = (User) getSession().getAttribute("loginUser");
			@SuppressWarnings("unchecked")
			Map<String, String> loginUserMap = (Map<String, String>) AppContext.getAppContext().get(R.LOGIN_USER_MAP);
			if (loginUserMap.containsKey(user.getId()))
				loginUserMap.remove(user.getId());
			AppContext.getAppContext().put(R.LOGIN_USER_MAP, loginUserMap);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}
