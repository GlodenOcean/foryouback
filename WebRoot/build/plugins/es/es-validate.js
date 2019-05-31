//验证数据完整性默认提示语
var zh_message = {
		require:"必填",
		int:"只能是正整数",
		double:"只能是带小数点的整数",
		mobile:"手机号码格式不正确",
		email:"邮箱地址不正确",
		startWithLetter:"字母加数字,字母开头",
		maxLength:"最大长度{maxLength}",
		minLength:"最小长度{minLength}"
}

function ES(){
	var es = new Object; 
	//验证数据完整性
	es.validate = function(array){
		cleanError();
		
		if(!array || array.length == 0){
			return;
		}
		
		var count = 0;
		
		$.each(array,function(n,item){
			
			var ruler = item.ruler;
			var message = item.message;
			
			if(!ruler) return;
			if(!message){
				message = {};
			}
			
			var sender = $("#"+item.senderId);
			var value = sender.val();
			
			//是否必填
			if(ruler.require){
				if(isEmpty(value)){
					if(!message.require){
						message.require = zh_message.require;
					}
					showError(sender,message.require);
					count ++;
				}
			}
			
			//是否整数
			if(ruler.int && !isEmpty(value)){
				if(!isInt(value)){
					if(!message.int){
						message.int = zh_message.int;
					}
					showError(sender,message.int);
					count ++;
				}
			}
			
			//是否小数点整数
			if(ruler.double && !isEmpty(value)){
				if(!isDouble(value)){
					if(!message.double){
						message.double = zh_message.double;
					}
					showError(sender,message.double);
					count ++;
				}
			}
			
			//是否手机号码格式
			if(ruler.mobile && !isEmpty(value)){
				if(!isMobile(value)){
					if(!message.mobile){
						message.mobile = zh_message.mobile;
					}
					showError(sender,message.mobile);
					count ++;
				}
			}
			
			//是否邮箱地址格式
			if(ruler.email && !isEmpty(value)){
				if(!isEmail(value)){
					if(!message.email){
						message.email = zh_message.email;
					}
					showError(sender,message.email);
					count ++;
				}
			}
			
			//是否字母开头
			if(ruler.startWithLetter && !isEmpty(value)){
				if(!isStartWithLetter(value)){
					if(!message.startWithLetter){
						message.startWithLetter = zh_message.startWithLetter;
					}
					showError(sender,message.startWithLetter);
					count ++;
				}
			}
			
			//最大长度
			if(ruler.maxLength && !isEmpty(value)){
				if(maxLength(value,ruler.maxLength)){
					if(!message.maxLength){
						message.maxLength = zh_message.maxLength.replace("{maxLength}", ruler.maxLength);
					}
					showError(sender,message.maxLength);
					count ++;
				}
			}
			
			//最大长度
			if(ruler.minLength && !isEmpty(value)){
				if(minLength(value,ruler.minLength)){
					if(!message.minLength){
						message.minLength = zh_message.minLength.replace("{minLength}", ruler.minLength);
					}
					showError(sender,message.minLength);
					count ++;
				}
			}
			
			
		});
		
		if(count > 0){
			return false;
		}
		
		return true;
		
	}
	
	return es;
}

/**
 * 显示错误提示语
 * @param sender
 * @param message
 */
function showError(sender,message){
	sender.closest(".form-group").append("<span class='help-block'>" + message + "</span>");
	sender.closest(".form-group").addClass("has-error");
}

/**
 * 清理错误提示语
 */
function cleanError(){
	$(".form-group").find(".help-block").remove();
	$(".form-group").removeClass('has-error');
}

var $ES = ES();


