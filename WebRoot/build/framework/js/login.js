$(function() {
	
	var failCode = "fail";
	
    $.backstretch([
                   "build/framework/images/login/login-bg-1.jpg",
                   "build/framework/images/login/login-bg-2.jpg",
                   "build/framework/images/login/login-bg-3.jpg",
                   "build/framework/images/login/login-bg-4.jpg"
                   ], {
                     fade: 1000,
                     duration: 8000
               }
     );
    
    $("input[name='user.loginId']").focus();
	
	$("#login-form").submit(function(){
		var loginId = $("input[name='user.loginId']");
		var password = $("input[name='user.loginPassword']");
		var captchaCode = $("input[name='captchaCode']");
		
		if(isEmpty(loginId.val())){
			showErrorNotice("请输入用户名.");
			loginId.focus();
			return false;
		}
		
		if(isEmpty(password.val())){
			showErrorNotice("请输入密码.");
			password.focus();
			return false;
		}
		
		if(isEmpty(captchaCode.val())){
			showErrorNotice("请输入验证码.");
			captchaCode.focus();
			return false;
		}
		
		var sender = $("#login-form");
		var url = sender.prop("action");
		var data = serializeObject(sender);
		showLoading();
		$.ajax({
			type : "POST",
			timeout:timeoutSecond,
			url : url,
			data : data,
			dataType : "json",
			success : function(resp) {
				if(resp.code == failCode){
					showErrorNotice(resp.message);
					hideLoading();
					loginId.focus();
				}else{
					window.location.href = "index";	
				}
			}
		});
		
		return false;
	});
	
	function showErrorNotice(message){
		$("#alert-div-message").html("<i class='icon-warning-sign'></i>&nbsp;"+message);
		$("#alert-div").show();
	}
	
	/**
	 * 序列化Form表单内容为对象
	 * @param formObj
	 * @returns 结果
	 */
	function serializeObject(formObj) {
		var o = {};
		$.each(formObj.serializeArray(), function(index) {
			if (o[this["name"]]) {
				o[this["name"]] = o[this["name"]] + "," + this["value"];
			} else {
				o[this["name"]] = this["value"];
			}
		});
		return o;
	} 
	
	/**
	 * 显示加载中
	 */
	function showLoading(){
		$("#login-btn").html("登录中..")
		$("#login-btn").attr("disabled","disabled");
	}

	/**
	 * 隐藏加载中
	 */
	function hideLoading(){
		$("#login-btn").html("登录"+"&nbsp;<i class='icon-signin'></i>")
		$("#login-btn").removeAttr("disabled");
	}
	
	//更换验证码
	$("#captchaCodeImg").click(function(){
		changeCode();
	});
	
	//更换验证码
	$("#changeCaptchCode").click(function(){
		changeCode();
	});
	
	function changeCode(){
		var src = $("#captchaCodeImg").prop("src") + "?random=" + generateMixed(7);
		$("#captchaCodeImg").prop("src",src);
		$("#captchaCode").val("");
	}
	
});