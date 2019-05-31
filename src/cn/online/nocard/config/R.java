package cn.online.nocard.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.online.nocard.web.vo.Basic;

/**
 * 常量类
 * @author zhongzf
 * @date 2015年11月30日
 */
public class R {
	
	public static final int FROM_WEB = 0;
	public static final int FROM_API = 1;
	
	public static final String LOG_SYS = "system";
	
	
	public static final String REQ_AJAX = "ajax";
	public static final String REQ_TAB = "tab";
	public static final String REQ_DIALOG = "dialog";
	public static final String REQ_NORMAL = "normal";
	
	public static final String MERCH_ID = "10000001";
	
	public static final int SEARCH_PAGE_SIZE = 2000;//导出分批查询条数
	
	// 发送短信验证码
	public static String SMS_URL = "http://113.108.195.242:40000/WebPage/Interaction";// 生产
	public static String SMS_PASSWORD = "905e068ae847476b8b402613477a8161";
	
	// 微信APPID	秘钥	和授权URL
	public static final String WECHAT_APPID = "wx325e31a910f09035"; //	优壹城
	public static final String WECHAT_SECRET = "1953f3647fd8cab50abef42a26ad6502";//	优壹城
//	public static final String WECHAT_APPID = "wxafece9f54b788518";//	汇云付hciard
//	public static final String WECHAT_SECRET = "6199446b74ef2531df57210b3fdef471";//	汇云付hciard
	public static final String ACCESS_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APPSECRET&code=CODE&grant_type=authorization_code"; //这个是请求获取用户信息的URL  

	public static final String FROZEN_URL = "http://192.168.1.141:35990/trade/freeze";
	public static final String FROZEN_SECRET_KEY = "00e3f627721e6162bffdf2099ebbdd72";
	public static final String DB = ":DB";
	
	public static HashMap<Object, String> fromMap = new HashMap<Object, String>();
	
	public static HashMap<String, String> LOGIN_USER_MAP = new HashMap<String, String>();
	
	private static HashMap<String, List<Basic>> basicMap = new HashMap<String, List<Basic>>();
	
	static{
		fromMap.put(Integer.valueOf(0), "Web");
		fromMap.put(Integer.valueOf(1), "Api");
		
		//机构类型
		List<Basic> instTypeList = new ArrayList<Basic>();
		instTypeList.add(new Basic("CHANNEL", "渠道"));
		instTypeList.add(new Basic("RECV", "收单"));
		instTypeList.add(new Basic("ISSUE", "发卡"));
		basicMap.put("instType", instTypeList);
		
		//渠道通讯方式
		List<Basic> channelType = new ArrayList<Basic>();
		channelType.add(new Basic("0", "双工长连接"));
		channelType.add(new Basic("1", "单工长连接"));
		channelType.add(new Basic("2", "短连接"));
		channelType.add(new Basic("3", "http"));
		basicMap.put("channelType", channelType);
		
		//设备归属
		List<Basic> terOwn = new ArrayList<Basic>();
		terOwn.add(new Basic("0", "前置"));
		terOwn.add(new Basic("1", "自助终端"));
		terOwn.add(new Basic("2", "金色快车 "));
		basicMap.put("terOwn", terOwn);
		
		//币种
		List<Basic> curtype = new ArrayList<Basic>();
		curtype.add(new Basic("0", "人民币"));
		curtype.add(new Basic("1", "外币"));
		curtype.add(new Basic("2", "兼有 "));
		basicMap.put("curtype", curtype);
		
		//币种
		List<Basic> emvDownlodFlag = new ArrayList<Basic>();
		emvDownlodFlag.add(new Basic("0", "不下装"));
		emvDownlodFlag.add(new Basic("1", "更新公钥"));
		emvDownlodFlag.add(new Basic("2", "更新EMV参数"));
		emvDownlodFlag.add(new Basic("3", "更新公钥和EMV参数"));
		basicMap.put("emvDownlodFlag", emvDownlodFlag);
		
		//Lua脚本比较符号
		List<Basic> luaCompareChar = new ArrayList<Basic>();
		luaCompareChar.add(new Basic("=", "等于"));
		luaCompareChar.add(new Basic("~=", "不等于"));
		luaCompareChar.add(new Basic(">", "大于"));
		luaCompareChar.add(new Basic(">=", "大于等于"));
		luaCompareChar.add(new Basic("<", "小于"));
		luaCompareChar.add(new Basic("<=", "小于等于"));
		luaCompareChar.add(new Basic("and", "并且"));
		luaCompareChar.add(new Basic("or", "或者"));
		luaCompareChar.add(new Basic("not", "非"));
		basicMap.put("luaCompareChar", luaCompareChar);
	}
	
	public static List<Basic> getTypeList(String type){
		return basicMap.get(type);
	}
	
	public static List<Basic> getLuaCompareCharList(){
		return basicMap.get("luaCompareChar");
	}
	
}
