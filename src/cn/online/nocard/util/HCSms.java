package cn.online.nocard.util;

import org.apache.log4j.Logger;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.BizResult;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

import cn.online.nocard.config.R;

public class HCSms {
	
	private static Logger logger = Logger.getLogger(R.LOG_SYS);
	
	public static void main(String[] args) {
		sendCodeForOnlinepay("883888", "15918872218");
	}
	
	/**
	 * 汇云付专用发送验证
	 * @param code
	 */
	public static Result sendCodeForOnlinepay(String code, String phoneNo){
		String url = HCConfig.get("sms_taobao_url");
		String appkey = HCConfig.get("sms_taobao_appkey");
		String secret = HCConfig.get("sms_taobao_secret");
		// 调用短信发送接口
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend( "" );	// 固定不变?
		req.setSmsType( "normal" );	// 固定不变
		req.setSmsFreeSignName( "汇耘富" );	// 固定不变
		req.setSmsParamString( "{code:'"+code+"',product:'信用卡消费'}" );	// code:验证码，product:产品名称
		req.setRecNum( phoneNo ); // 目标手机号
		req.setSmsTemplateCode( "SMS_11660157" );	// 固定不变
		logger.debug("即将发送验证码["+HCString.hide(code, 1, 2)+"]到手机号[" + HCString.hide(phoneNo, 3, 4) + "]");
		try {
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			logger.debug("短信发送返回:" + rsp.getBody());
			BizResult br = rsp.getResult();
			if(br != null && br.getSuccess()){
				return Result.success("SUCCESS");
			}
			logger.error("发送短信失败:" + rsp.getSubMsg());
			return Result.fail("发送短信失败:" + rsp.getSubMsg());
		} catch (ApiException e) {
			logger.error("发送短信异常:" + e.getErrMsg(), e);
			return Result.fail("发送短信出错，请稍候再试:" + e.getErrMsg());
		}
	}

}
