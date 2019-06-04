package cn.online.shop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;

/**
 * 日期类
 * 
 * 2015年8月25日
 */
public class HCDate {

	// 由于SimpleDateFormat不是线程安全的，并发时会出问题，所有用到的地方直接new出来
	/**
	 * 将yyyyMMddHHmmss转换成日期对象
	 * 
	 * @param source
	 * @return
	 */
	public static String monTimeFormat(Date source) {
		SimpleDateFormat monTimeFormat = new SimpleDateFormat("MMddHHmmss");
		return monTimeFormat.format(source);
	}

	/**
	 * 将yyyyMMddHHmmss转换成日期对象
	 * 
	 * @param source
	 * @return
	 */
	public static Date parseDateFromNumber(String source) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			return format.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date parseDateTimeString(String source) {
		try {
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return dateTimeFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 获取时间戳
	 * 
	 * @return
	 */
	public static String getTimeStamp() {
		return String.valueOf(new Date().getTime());
	}

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public static String getDateTime() {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateTimeFormat.format(new Date());
	}

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public static String getDateTime(Date date) {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateTimeFormat.format(date);
	}

	/**
	 * yyyyMMddHHmmss
	 * 
	 * @return
	 */
	public static String getDateTimeNumber() {
		SimpleDateFormat dateTimeNumberFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		return dateTimeNumberFormat.format(new Date());
	}

	/**
	 * yyyyMMddHHmmss
	 * 
	 * @return
	 */
	public static String getDateTimeNumber(Date date) {
		SimpleDateFormat dateTimeNumberFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		return dateTimeNumberFormat.format(date);
	}

	/**
	 * 将yyyy-MM-dd HH:mm:ss 转换成 yyyyMMddHHmmss
	 * 
	 * @return
	 */
	public static String getDateTimeNumber(String source) {
		try {
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat dateTimeNumberFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date parse = dateTimeFormat.parse(source);
			return dateTimeNumberFormat.format(parse);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 将 yyyyMMddHHmmss 转换成 yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public static String getDateTimeFormat(String source) {
		try {
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat dateTimeNumberFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date parse = dateTimeNumberFormat.parse(source);
			return dateTimeFormat.format(parse);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * yyyyMMdd
	 * 
	 * @return
	 */
	public static String getDateNumber() {
		SimpleDateFormat dateNumberFormat = new SimpleDateFormat("yyyyMMdd");
		return dateNumberFormat.format(new Date());
	}

	/**
	 * yyyyMMdd
	 * 
	 * @return
	 */
	public static String getDateNumber(Date date) {
		SimpleDateFormat dateNumberFormat = new SimpleDateFormat("yyyyMMdd");
		return dateNumberFormat.format(date);
	}

	/**
	 * 
	 * @param source
	 * @return
	 */
	public static Date getDateNumber(String source) {
		try {
			SimpleDateFormat dateNumberFormat = new SimpleDateFormat("yyyyMMdd");
			return dateNumberFormat.parse(source);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * yyyy-MM-dd
	 * 
	 * @return
	 */
	public static String getDate() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(new Date());
	}

	/**
	 * yyyy-MM-dd
	 * 
	 * @return
	 */
	public static String getDate(Date source) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(source);
	}

	public static String getDateTime(String source) throws ParseException {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateTimeNumberFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = dateTimeNumberFormat.parse(source);
		String dateTime = dateTimeFormat.format(date);

		return dateTime;
	}

	/**
	 * yyyy-MM-dd
	 * 
	 * @return
	 * @throws ParseException
	 */
	public static Date getDate(String source) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.parse(source);
	}

	/**
	 * 获取当前日期的HH:mm:ss
	 * 
	 * @return
	 */
	public static String getTime() {
		SimpleDateFormat timeForamt = new SimpleDateFormat("HH:mm:ss");
		return timeForamt.format(new Date());
	}

	/**
	 * 获取日期的HH:mm:ss
	 * 
	 * @return
	 */
	public static String getTime(Date source) {
		SimpleDateFormat timeForamt = new SimpleDateFormat("HH:mm:ss");
		return timeForamt.format(source);
	}

	/**
	 * 获取yyyy-MM-dd HH:mm:ss的HHmmss
	 * 
	 * @return
	 */
	public static String getHourTime(String source) {
		Date date = parseDateTimeString(source);
		SimpleDateFormat timeForamt = new SimpleDateFormat("HHmmss");

		return timeForamt.format(date);
	}

	/**
	 * 在指定的日期加上second秒
	 * 
	 * @param source
	 * @param second
	 * @return
	 */
	public static Date addSecond(Date source, int second) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(source);
		calendar.add(Calendar.SECOND, second);
		return calendar.getTime();
	}

	/**
	 * 格式转换，比replace方法高效10倍
	 * 
	 * @param date
	 *            yyyy-MM-dd或yyyy-MM-dd HH:mm:ss
	 * @return yyyyMMdd或yyyyMMddHHmmss
	 */
	public static String dateToNumber(String date) {
		char[] arr;
		if (date.length() == 10) {
			arr = new char[8];
		} else if (date.length() == 19) {
			arr = new char[14];
		} else {
			return date;
		}
		arr[0] = date.charAt(0); // 年，第1位
		arr[1] = date.charAt(1); // 年，第2位
		// 从“年”最后两位开始，每取两位会遇到一个分隔符
		for (int i = 2, c = 0; i < arr.length; i += 2, c++) {
			arr[i] = date.charAt(i + c);
			arr[i + 1] = date.charAt(i + 1 + c);
		}
		return new String(arr);
	}

	/**
	 * 获取信用卡有效期年份MAP，当前年份开始的10年
	 * 
	 * @return
	 */
	public static LinkedHashMap<String, String> getCreditYears() {
		LinkedHashMap<String, String> years = new LinkedHashMap<String, String>(10);
		Calendar calendar = Calendar.getInstance();
		int begin = calendar.get(Calendar.YEAR);
		for (int i = 0; i < 12; i++) {
			String year = Integer.toString(begin + i);
			years.put(year, year.substring(2));
		}
		return years;
	}

	public static boolean isToday(Object obj) {
		if (HCBoolean.isEmpty(obj)) {
			return false;
		}
		Date compareDate = null;
		if (obj instanceof Date) {
			compareDate = (Date) obj;
		} else if (obj instanceof String) {
			compareDate = parseDateTimeString(obj.toString());
		}

		Calendar cal = Calendar.getInstance();
		cal.setTime(compareDate);

		Calendar cal2 = Calendar.getInstance();

		boolean isSameYear = cal.get(Calendar.YEAR) == cal2.get(Calendar.YEAR);
		boolean isSameMonth = isSameYear && cal.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
		boolean isSameDate = isSameMonth && cal.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);

		return isSameDate;

	}

	/**
	 * 计算两个时间相差的天数
	 * 
	 * @param fDate
	 * @param oDate
	 * @return
	 */
	public static int getIntervalDays(Date fDate, Date oDate) {
		Calendar aCalendar = Calendar.getInstance();
		aCalendar.setTime(fDate);
		int day1 = aCalendar.get(Calendar.DAY_OF_YEAR);
		aCalendar.setTime(oDate);
		int day2 = aCalendar.get(Calendar.DAY_OF_YEAR);
		return day2 - day1;
	}

	public static void main(String[] args) throws ParseException {
		int a = getIntervalDays(new Date(), HCDate.getDate("2018-03-17 13:53:10"));
		System.out.println(a);

	}
}
