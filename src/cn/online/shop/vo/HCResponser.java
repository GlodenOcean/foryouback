package cn.online.shop.vo;

import java.io.Serializable;


/**
 * 控制器响应
 * @date 2015年11月30日
 */
public class HCResponser implements Serializable{
	
	public static final String CODE_EXCEPTION = "exception";
	public static final String MSG_EXCEPTION = "系统发生异常,请联系管理人员.";
	
	public static final String CODE_FAIL = "fail";
	public static final String MSG_FAIL = "操作失败.";
	
	public static final String CODE_SUCCESS = "success";
	public static final String MSG_SUCCESS = "操作成功.";
	
	public static final String CODE_TIME_OUT = "timeout";
	public static final String MSG_TIME_OUT = "登录超时.";
	
	public HCResponser(){
		
	}
	
	public HCResponser(String code,String message){
		this.code = code;
		this.message = message;
	}
	
	public HCResponser(String code,String message,Object data){
		this.code = code;
		this.message = message;
		this.data = data;
	}
	
	private static final long serialVersionUID = 1L;

	//响应码
	private String code;
	
	//响应信息
	private String message;
	
	//返回的数据
	private Object data;
	
	public static HCResponser success(){
		return new HCResponser(CODE_SUCCESS, MSG_SUCCESS);
	}
	
	public static HCResponser success(String message){
		return new HCResponser(CODE_SUCCESS,message);
	}
	
	public static HCResponser success(Object data){
		return new HCResponser(CODE_SUCCESS, MSG_SUCCESS,data);
	}
	
	public static HCResponser fail(){
		return new HCResponser(CODE_FAIL, MSG_FAIL);
	}
	
	public static HCResponser fail(String message){
		return new HCResponser(CODE_FAIL, message);
	}
	
	public static HCResponser fail(Object data){
		return new HCResponser(CODE_FAIL,MSG_FAIL, data);
	}
	
	public static HCResponser exception(){
		return new HCResponser(CODE_EXCEPTION, MSG_EXCEPTION);
	}
	
	public static HCResponser timeout(){
		return new HCResponser(CODE_TIME_OUT, MSG_TIME_OUT);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public void set(String code,String message){
		this.code = code;
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
