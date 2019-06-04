package cn.online.shop.util;

/**
 * 结果和说明
 */
public class Result {

	private boolean success;
	private String code;
	private String message;
	private Object data;
	
	public Result(){}
	
	public Result(boolean success, String message){
		this.success = success;
		this.message = message;
	}
	
	public static Result success(String message){
		return new Result(true, message);
	}
	
	public static Result fail(String message){
		return new Result(false, message);
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
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

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
		
}
