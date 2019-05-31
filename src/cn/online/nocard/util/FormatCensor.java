package cn.online.nocard.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* 多种格式检查工具
 * @创建日期：2016-07-30
 */
public class FormatCensor {
	/**
	 * 测试一个字符串是否为合法文件名(Linux 下约束比 Windows 少，考虑兼容问题，以 Windows 为准)
	 * @param text 待测试文本
	 * @return 文本可表示为合法文件名返回 true
	 */
	public static boolean isFileName(String text){
		String regex = "[\\\\/:*?\"<>|]";
		return !Pattern.compile(regex).matcher(text.trim()).find();
	}

	
	/**
	 * 测试一个字符串是否含有保留字符(标准 ASCII 码表中除去数字和字母以外的字符不允许出现)
	 * @param text 待测试文本
	 * @return 文本包含保留字符返回 true
	 */
	public static boolean isExistingIllegalCharacter(String text){
		String regex = "[\\x00-\\x2F\\x3A-\\x40\\x5B-\\x60\\x7B-\\x7F]";
		return Pattern.compile(regex).matcher(text.trim()).find();
	}
	
	
	/**
	 * 测试文本是否可表示为整数。
	 * 除两段空白字符外，中间出现空白字符或者其它与数字无关的字符都将放回 false 。
	 * @param text 待测试文本
	 * @return 文本能正确表示一个整返回 true
	 */
	public static boolean isInteger(String text){
		String regex = "\\s*\\d+\\s*";
		return Pattern.matches(regex, text.trim());
	}
	
	
	/**
	 * 测试文本是否可表示为数字。
	 * 除两段空白字符外，中间出现空白字符或者其它与数字无关的字符都将放回 false 。
	 * @param text 待测试文本
	 * @return 文本能正确表示一个数字返回 true
	 */
	public static boolean isNumber(String text){
		String regex = "\\s*\\d+(\\.\\d+)?\\s*";
		return Pattern.matches(regex, text.trim());
	}
	
	
	/**
	 * 测试文本是否为正确的邮件格式。
	 * 忽略前后空白字符。仅将邮件后缀为 com,cn,net 认为是正确后缀。
	 * @param text 待测试文本
	 * @return 文本为正确的邮件格式返回 true
	 */
	/* 待确认邮箱命名规法
	public static boolean isEmail(String text){
		String regex = "\\s*\\w+@[\\w&&[^_]]+\\.(com|cn|net)\\s*";
		return Pattern.compile(regex, Pattern.CASE_INSENSITIVE).matcher(text).matches();
	}
	*/
	
	
	/**
	 * 测试文本是否为日期格式。
	 * 忽略前后空白字符。仅将“-”，“/”，“.”认为是正确的年月日分隔符。年月日的出现顺序必须依次为：年，月，日。
	 * 若文本不能正确表示一个日期，包括错误日期，如：2014-02-29，都将返回 false 。
	 * @param text 待测试文本
	 * @return 文本能正确表示为一个日期则返回 true
	 */
	public static boolean isDate(String text){
		// 日期仅允许这三种分隔符：-/.
		final String divide = "[-\\/\\.]";
		String regex = "\\s*(\\d{1,4})" + divide + "(0?[1-9]|1[0-2])" + divide + "(0?[1-9]|[12]\\d|3[01])\\s*";
		Matcher m = Pattern.compile(regex).matcher(text);
		if(!m.matches()){
			return false;
		}
		// 格式没问题，就检查两个分隔符是否一样
		m = Pattern.compile(divide).matcher(text);
		m.find();
		String firstDivide = m.group();
		m.find();
		if(!firstDivide.equals(m.group())){
			return false;
		}
		// 最后检查日期是否在月份的天数范围内
		int firstIndex = text.indexOf(firstDivide);
		int lastIndex = text.lastIndexOf(firstDivide);

		int year = Integer.parseInt(text.substring(0,firstIndex).trim());
		int month = Integer.parseInt(text.substring(firstIndex+1,lastIndex));
		int day = Integer.parseInt(text.substring(lastIndex+1).trim());
		if(month<8 && month%2==1 || month>=8 && month%2==0){
			return day<=31;
		}else if(month==2){
			if(year%4==0 && year%100!=0 || year%400==0){
				return day<=29;
			}else{
				return day<=28;
			}
		}else{
			return day<=30;
		}
	}
	
	
	/**
	 * 测试文本是否能为时间格式。
	 * 时间格式可以包含日期，若有日期部分，必须在时分前面，格式要求同 isDate() 。
	 * 忽略前后空白字符。仅将“:”认为是正确的时间（时:分:秒）分隔符。仅将空格（一个）认为是正确的年月日部分和时分部分之间的分隔符。
	 * @param text 待测试文本
	 * @return 文本能正确表示一个时间时返回 true
	 * 另参见： @see isDate()  
	 */
	public static boolean isTime(String text){
		String[] time = text.trim().split(" ");
		if(time.length>2){
			return false;
		}
		String regex = "([01]?\\d|2[0-3])(:[0-5]?\\d){1,2}";
		if(time.length==2){
			if(!isDate(time[0])){
				return false;
			}	
			return Pattern.matches(regex, time[1]);
		}
		return Pattern.matches(regex, time[0]);
	}
	
	
	/**
	 * 检查IP串是否合法
	 * 
	 * @param ips
	 * @param limit
	 *            分隔符
	 * @return
	 */
	public static boolean isIps(String ips, String limit) {
		Pattern pattern = Pattern
				.compile("^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\\.){1,3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])?$");
		boolean pass = false;
		String[] ipArray = ips.split(limit, 0);
		for (String ip : ipArray) {
			if (ip != null && ip.length() > 0) {
				if (pattern.matcher(ip).matches()) {
					pass = true;
				} else {
					pass = false;
					break;
				}
			}
		}
		return pass;
	}

	
	/**
	 * 校验手机号码是否合法
	 * 
	 * @param mobile
	 * @return
	 */
	public static boolean isMobile(String mobile) {
//		String regex = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		String regex = "\\d{11}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mobile);
		return matcher.matches();
	}
	
	
	/**
	 * 校验邮箱是否合法
	 * 
	 * @param strEmail
	 * @return
	 */
	public static boolean isEmail(String email) {
		String checkemail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(checkemail);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}
	
	
	/**
	 * 校验金额，小数点后面只能保留两位
	 * @param money
	 * @return
	 */
	public static boolean isMoney(String money){
		String checkMoney="^(-)?(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";
		Pattern pattern = Pattern.compile(checkMoney);
		Matcher matcher=pattern.matcher(money);
		return matcher.matches();
	}
}
