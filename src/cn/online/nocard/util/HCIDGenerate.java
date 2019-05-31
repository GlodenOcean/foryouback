package cn.online.nocard.util;

import java.util.Random;
import java.util.UUID;

/**
 * ID生成器
 * @date 2015年11月2日
 */
public class HCIDGenerate {
	
	//纯数字验证码
	public static final String VERIFY_CODES_INT = "0123456789";
	
	/**
	 * 生成32位UUID
	 * @return
	 */
	public static String UUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 下一个订单号
	 * @return
	 */
	public static String nextOrderNo(){
		return "g" + String.valueOf(IdWorker.getNext());//所有订单前面都加字符串g，在同步交易数据到前置网时使用
	}
	
	/**
	 * 下一个虚账订单号
	 * @return
	 */
	public static String nextVtradeNo(){
		return "t" + String.valueOf(IdWorker.getNext());//所有订单前面都加字符串t
	}
	
	/**
	 * 下一个分润订单号
	 * @return
	 */
	public static String nextShareTradeNo(){
		return "s" + String.valueOf(IdWorker.getNext());//所有订单前面都加字符串s
	}
	
	/**
	 * 生成纯数字验证码
	 * @param length 生成验证码的长度
	 * @return
	 */
	public static String getIntRandomCode(int length){
		int codesLen = VERIFY_CODES_INT.length();
		Random rand = new Random(System.currentTimeMillis());
		StringBuilder verifyCode = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			verifyCode.append(VERIFY_CODES_INT.charAt(rand.nextInt(codesLen - 1)));
		}
		return verifyCode.toString();
	}
}
