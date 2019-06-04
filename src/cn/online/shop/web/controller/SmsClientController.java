package cn.online.shop.web.controller;

import cn.es.common.ESController;
import cn.es.common.ESSearchCondition;
import cn.online.shop.config.R;
import cn.online.shop.util.SmsClient;

/**
 * @Description: 渠道业务映射 and 商户业务映射 Controller
 * @author: ocean
 * @date: 2017年5月24日 上午9:56:28
 * @version: V1.0
 */
public class SmsClientController extends ESController {

	/**
	 * 发送短信
	 */
	public void sendSms() {
		ESSearchCondition sc = super.getSearchCondition();
		String phone = sc.getString("phone");
		String content = sc.getString("content");
		String sendtime = sc.getString("sendtime");
		String result = SmsClient.doPost(R.SMS_URL, R.SMS_PASSWORD, phone, content, sendtime);
		if("200".equals(result)){
			renderSuccessJson("success");
		}else{
			renderFailJson("error");;
		}
	}


}
