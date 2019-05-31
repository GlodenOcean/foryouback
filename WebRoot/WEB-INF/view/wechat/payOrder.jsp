<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/path.jsp"%>
<script type="text/javascript" src="/nocard/build/custom/js/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title></title>
<link rel="stylesheet" href="/nocard/build/custom/css/wechat/login.css" />
<link rel="stylesheet" href="/nocard/build/custom/css/wechat/common.css" />
<style>
.login_bg {
	background: #ffffff;
}

.login_btn {
	width: 80%;
	margin: 10%;
}

.other_login {
	top: 70%;
}

.other_choose {
	top: 80%;
}
</style>
</head>
<body>
	<div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="/nocard/build/custom/images/wechat/logo.png" alt=""/>
        </div>
        <form action="createOrder">
                <input type="hidden" name="appId" id="appId" value="${appId}" />
                <input type="hidden" name="timeStamp" id="timeStamp" value="${timeStamp}" />
                <input type="hidden" name="nonceStr" id="nonceStr" value="${nonceStr}" />
                <input type="hidden" name="packages" id="packages" value="${packages}" />
                <input type="hidden" name="signType" id="signType" value="${signType}" />
                <input type="hidden" name="paySign" id="paySign" value="${paySign}" />
            <!-- <div class="passWord">
                <lable>交易金额：</lable>
                <input type="amount" name="amount" placeholder="请输入金额" pattern="[0-9]{1,9}" required/>
            </div> -->
            
            <button class="login_btn" type="submit" style="margin-top: 15px;" onclick="onBridgeReady();">确定</button>
        </form>
    </div>
</body>
<script>
/* $(function(){alert(0);
	
}); */
function onBridgeReady() {
var timeStamp = $("#timeStamp").val()+"";
	WeixinJSBridge.invoke('getBrandWCPayRequest', {
		"appId" : $("#appId").val(), //公众号名称，由商户传入     
		"timeStamp" : timeStamp, //时间戳，自1970年以来的秒数     
		"nonceStr" : $("#nonceStr").val(), //随机串     
		"package" : $("#packages").val(),
		"signType" : $("#signType").val(), //微信签名方式：     
		"paySign" : $("#paySign").val() //微信签名 
	}, function(res) {
		//alert(JSON.stringify(res));
		if (res.err_msg == "get_brand_wcpay_request:ok") {
		} // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
	});
}
if (typeof WeixinJSBridge == "undefined") {
	if (document.addEventListener) {
		document.addEventListener('WeixinJSBridgeReady', onBridgeReady,
				false);
	} else if (document.attachEvent) {
		document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
		document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
	}
} else {
	onBridgeReady();
}
</script>
</html>
