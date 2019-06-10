package cn.online.shop.web.vo;

/**
 * lua参数化脚本解析后保存对象
 * @author ocean
 *
 * 2016年4月7日
 */
public class LuaParameter {

	private String name;
	private String value;
	private String compareChar;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getCompareChar() {
		return compareChar;
	}
	public void setCompareChar(String compareChar) {
		this.compareChar = compareChar;
	}
	
	
}
