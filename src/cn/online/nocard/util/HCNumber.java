package cn.online.nocard.util;

import java.math.BigDecimal;

public class HCNumber {

	public static Double formatDoubleByN(Double value, Integer num)
	{
		BigDecimal b = new java.math.BigDecimal(value);  
		double myNum3 = b.setScale(num, java.math.BigDecimal.ROUND_HALF_UP).doubleValue(); 
		return myNum3;
	}
	
	/**
	 * 将String类型数据放大multiple倍后返回Integer类型数据
	 * @param totalFee
	 * @param multiple
	 * @return
	 */
	public static Long enlargementFactor(String totalFee , int multiple){
		BigDecimal b1 = new BigDecimal(totalFee);
	    BigDecimal b2 = new BigDecimal(multiple);
	    return b1.multiply(b2).longValue();
		
	}
	/**
	 * 将String类型数据缩小narrow倍后返回String类型数据
	 * @param totalFee
	 * @param multiple
	 * @return
	 */
	public static String minification(String totalFee , int narrow){
		Double douFee = Double.valueOf(totalFee)/ narrow;
		String strFee = douFee.toString();
		return strFee;
	}
}
