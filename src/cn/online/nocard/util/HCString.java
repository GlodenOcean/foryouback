package cn.online.nocard.util;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HCString {
	
	public static String textConvertToCodeHtml(String source){
		String[] lines = source.split("\n");
		StringBuffer sb = new StringBuffer();
		for (String line : lines) {
			if(line.indexOf("(") > 0 && line.indexOf(")") > 0){
				String replace = line.substring(line.indexOf("(")+1,line.lastIndexOf(")"));
				line = line.replaceAll(replace, "<span class='codeKeyWord'>"+replace+"</span>");
			}else{
				line = "<span class='codeKeyWord'>"+line+"</span>";
			}
			line = line.replaceAll("\t", "&emsp;");
			sb.append(line);
			sb.append("<br/>");
		}
		return sb.toString();
	}
	
	/**
	 * 将一个map转换成key=value&key...url格式
	 * @param source
	 * @return
	 */
	public static String convertMapToUrlParameter(Map<String, String> source){
		StringBuffer sb = new StringBuffer();
		for(Entry<String, String> entry : source.entrySet()){ 
			sb.append(entry.getKey());
			sb.append("=");
			sb.append(entry.getValue());
			sb.append("&");
		}
		return sb.toString();
	}
	
	/**
	 * 将一个key=value&key...url转换成map格式<br/>
	 * <b>注意：此方法的返回参数必须是有序的</b>
	 * @param source
	 * @return
	 */
	public static LinkedHashMap<String, String> convertUrlParameterToMap(String urlParams){
	       String params[] = urlParams.split("&");
	       LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	        for (int i = 0; i < params.length; i++) {
	        	// 0-key, 1-value
	            String kv[] = params[i].split("=", 2);
	            map.put(kv[0], kv[1]);
	        }
	        return map;
	}
	
	  /**
     * 半角转全角
     * 〈功能详细描述〉
     * @param input
     * @return
     */
    public static String ToSBC(String input)
    {
        char c[] = input.toCharArray();
        for (int i = 0; i < c.length; i++)
        {
            if (c[i] == ' ')
            {
                c[i] = '\u3000';
            }
            else if (c[i] < '\177')
            {
                c[i] = (char)(c[i] + 65248);
                
            }
        }
        return new String(c);
    }
    
    /**
     * 隐藏字符串，head头部显示明文长度，tail尾部显示明文长度
     */
    public static String hide(String str, int head, int tail){
    	if(str == null){
    		return "";
    	}
    	if(str.length() < head+tail){
    		return str;
    	}
    	char[] chars = str.toCharArray();
		for (int i = head; i < chars.length-tail; i++) {
			chars[i] = '*';
		}
		return new String(chars);
    }
    
   /**
    * 请求的参数转换为有序的map
    * @param requestData getParaMap()获取的值
    * @return 有序的map
    */
    public static Map<String, String> requestToMap(Map<String, String[]> requestData) {
		Map<String, String> data = new TreeMap<>();
		if (requestData != null) {
			for (Map.Entry<String, String[]> entry : requestData.entrySet()) {
				String[] values = entry.getValue();
				if (values != null && values.length > 0) {
					data.put(entry.getKey(), values[0]);
				}
			}
		}
		return data;
	}
    /**
     * 判断字符串是否为数字 包含小数点
     * @param str 字符串
     * @return true 数字  false  
     */
    public static boolean isNumeric(String str){ 
    	   Pattern pattern = Pattern.compile("[0-9]+.*[0-9]*"); 
    	   Matcher isNum = pattern.matcher(str);
    	   return isNum.matches();
    	  
    }   
}
