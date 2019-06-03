<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/path.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta name=”renderer” content=”webkit” /> 
<title>交易系统管理后台</title>
<link rel="icon" href="build/custom/images/logo_o.png" type="image/x-icon"/>
<link href="build/plugins/fontawesome/css/font-awesome.min.css" rel="stylesheet" >
<link href="build/custom/css/login.css" rel="stylesheet"type="text/css" />
<link href="build/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="build/custom/js/jquery.min.js"></script>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<script type="text/javascript" src="build/plugins/es/es-common.js"></script>
<script type="text/javascript" src="build/plugins/es/es-ajax.js"></script>
<script type="text/javascript" src="build/custom/js/login.js"></script>
<script type="text/javascript" src="build/plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="build/plugins/backstretch/jquery.backstretch.min.js" ></script>

</head>
<body>

	<div class="logo">
		<!-- <img src="build/custom/images/logo.png" alt=""> -->
	</div>

	<div class="content">
		<form id="login-form" class="login-form" action="login" method="post">
		<h3 class="form-title">交易系统后台登录</h3>
		<div id="alert-div" class="alert alert-danger" style="display: none;">
			<span id="alert-div-message"></span>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" autocomplete="off" placeholder="用户名" name="loginId" type="text">
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control placeholder-no-fix" autocomplete="off" placeholder="密码" name="loginPassword" type="password">
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<input class="form-control" maxlength="4" id="captchaCode" name="captchaCode">
				<img src="getCaptchaCode" id="captchaCodeImg"  title="点击换一张">&nbsp;<a href="javascript:;" id="changeCaptchCode">换一张</a>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn blue pull-right" id="login-btn">
				登录 <i class="fa fa-sign-in"></i>
			</button>
		</div>
		</form>
		</div>


</body>
</html>
