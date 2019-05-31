<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" id="close-btn" class="close" data-dismiss="modal">×</button>
	<h5 class="modal-title">
		<i class="fa fa-time"></i>&nbsp;登录超时,请重新登录
	</h5>
</div>
<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<form id="login-form" action="login" class="form-horizontal">
				<input type="hidden" id="preRequestType" value="${preRequestType }"/>
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-7">
							<span id="alertMessage" class="red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">用户名<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="loginId" id="loginId" class="form-control" type="text"  autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">密码<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="loginPassword" id="loginPassword" class="form-control" type="password" maxlength="16">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">验证码<span class="red">*</span></label>
						<div class="col-md-7">
							<input id="captchaCode" name="captchaCode" class="form-control" type="text" maxlength="4"  autocomplete="off" style="width:40%;display:inline-block;">
							<img src="getCaptchaCode" id="captchaCodeImg"  title="点击换一张">&nbsp;<a href="javascript:;" id="changeCaptchCode">换一张</a>
						</div>
					</div>
				</div>
			</form>
				
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn" onclick="cancleLogin();" data-dismiss="modal">关 闭</button>
	<button type="button" class="btn btn-info" onclick="login();">登 录</button>
</div>

<script>

	function cancleLogin(){
		var preRequestType = $("#preRequestType").val();
		if(preRequestType == requestTypeTab){
			$ESTab.closeTab();
		}
	}

	function login(){
		if(validate()){
			var loginId = $("input[name='loginId']");
			var loginPassword = $("input[name='loginPassword']");
			 //开始请求登陆
			formAjaxRequest("login-form", function success(resp){
				var preRequestType = $("#preRequestType").val();
				$("#dialog-page").modal("hide");
				if(preRequestType == requestTypeTab){
					$ESTab.refreshTab();
					document.onkeydown = undefined;
				}
			}); 
		}
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
	
	function validate(){
		var loginId = {senderId:"loginId",ruler:{require:true}};
		var loginPassword = {senderId:"loginPassword",ruler:{require:true}};
		var captchaCode = {senderId:"captchaCode",ruler:{require:true}};
		var array = [loginId,loginPassword,captchaCode];
		return $ES.validate(array);
	}
	
	//监听Enter
	document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
			login();
        };
    };  
	
</script>
