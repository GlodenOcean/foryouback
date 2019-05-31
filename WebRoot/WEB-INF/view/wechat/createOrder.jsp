<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/include/path.jsp" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" href="/nocard/build/custom/css/wechat/login.css"/>
    <link rel="stylesheet" href="/nocard/build/custom/css/wechat/common.css"/>
</head>
<body>
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="/nocard/build/custom/images/wechat/logo.png" alt=""/>
        </div>
        <form action="createOrder">
         	<input type="hidden" name="openid" value="${openid}" required/>
            <div class="userName">
                <label>协议版本：</label>
                <select name="version" id="version" style="width: 180px;height: 36px;">
					<option value="V001" >银联二维码</option>
					<option value="hyf" >汇云付</option>
					<option value="ms-yr" >民生</option>
					<option value="hjf" >汇聚付</option>
				</select>
            </div>
            <div class="userName">
                <label>前端商户号：</label>
                <input type="text" name="hicardMerchNo" value="${hicardMerchNo}" />
            </div>
            <div class="userName">
                <label>AppId：</label>
                <input type="text" name="subAppId" value="${subAppId}" />
            </div>
            <div class="passWord">
                <label>交易金额：</label>
                <input type="text" name="amount" placeholder="请输入金额" pattern="[0-9]{1,9}" required/>
            </div>
            
            <button class="login_btn" type="submit" style="margin-top: 15px;">确定</button>
        </form>
    </div>
</body>
</html>
