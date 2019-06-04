package cn.online.shop.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

/**
 * 发送短信客户端<br>
 * 用post方式将四个字段（密钥/手机号码/短信内容/发送方的发送时间）发到指定地址<br>
 * 每个字段具体说明请看后面doPost方法的参数说明<br>
 * 使用到的jar包：<br>
 * 1.httpcore-4.3.2.jar<br>
 * 2.httpclient-4.3.4.jar<br>
 */
public class SmsClient {

	public static String url = "http://113.108.195.242:40000/WebPage/Interaction";// 生产
	public static String password = "905e068ae847476b8b402613477a8161";

	/**
	 * 发送短信
	 * 
	 * @param url服务器地址，http://183.62.43.246/sms/send，这个是生产地址，没有测试地址
	 * @param password密钥,每个项目一个密钥，请联系开发人员获取
	 * @param phone手机号码，暂时每次只能发送一个手机号
	 * @param content短信内容(每次最多发送500个字符，运营商会自动给我们分割短信，70个字符一条短信)
	 * @param sendtime发送方的发送时间(格式yyyy-MM-dd HH:mm:ss,SSS)，非必填，但最好加上，用于查询日志
	 * @return 状态,流水号,说明<br>
	 *         返回内容包含三个字段，用英文逗号分隔<br>
	 *         状态:0表示成功，其他表示失败。<br>
	 *         流水号:每条短信发送成功后会生成唯一的值。<br>
	 *         说明:成功或者失败的提示语。<br>
	 * 
	 */
	public static String doPost(String url, String password, String phone, String content, String sendtime) {
		String result = "";
		HttpPost httpRequst = new HttpPost(url);// 创建HttpPost对象
		RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(50 * 1000).setConnectTimeout(2 * 60 * 000)
				.build();// 设置请求和传输超时时间
		httpRequst.setConfig(requestConfig);

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("password", password));
		params.add(new BasicNameValuePair("phone", phone));
		params.add(new BasicNameValuePair("content", content));
		params.add(new BasicNameValuePair("sendtime", sendtime));
		try {
			httpRequst.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
			
			for(int i =0 ; i<httpRequst.getAllHeaders().length;i++){

				System.out.println("httpRequst = "+httpRequst.getAllHeaders()[i].getValue());
			}
			HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequst);
			
			System.out.println(httpResponse.getStatusLine().getStatusCode());
			
			if (httpResponse.getStatusLine().getStatusCode() == 200) {
				HttpEntity httpEntity = httpResponse.getEntity();
				result = EntityUtils.toString(httpEntity);// 取出返回字符串
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			result = e.getMessage().toString();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			result = e.getMessage().toString();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 测试方法
	 */
	public static void main(String[] args) {
		try {
			String phone = "13533640825";
			String sendtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,SSS").format(new Date());
			String content = "测试sdfsd";
			String result = doPost(url, password, phone, content, sendtime);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}