<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/path.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" href="/nocard/build/custom/css/wechat/login.css"/>
    <link rel="stylesheet" href="/nocard/build/custom/css/wechat/common.css"/>
    <style>
        .login_bg{
            background: #ffffff;
        }
        .login_btn{
            width: 80%;
            margin: 10%;
        }
        .other_login{
            top: 70%;
        }
        .other_choose{
            top: 80%;
        }
    </style>
     <script type="text/javascript">
        //用户点击跳转地址（非静默授权） 参数appid为公众号的id redirect_uri为微信回调接口 state为可携带的参数
        window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxafece9f54b788518&redirect_uri=http://online.icloudful.com/shop/public/createOrderView&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";

  </script>
</head>
<body>
<!-- <div class="login_bg">
    <div id="logo">
        <img src="/shop/build/custom/images/wechat/logo.png" alt=""/>
    </div>
    <a class="login_btn" href="createOrderView">下单</a>
</div> -->
</body>
</html>