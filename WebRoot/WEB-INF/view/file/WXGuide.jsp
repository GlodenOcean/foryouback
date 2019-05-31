<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="widget box">
	<div class="widget-content  no-padding">
		<div style="margin-left: 30px; margin-right: 30px;">
			<div>
				<font color="red" style="text-align: center;"><h3>
						<b>微信公众号支付接入指南</b>
					</h3></font>
			</div>
			<div style="margin-top: 6px;">
				<b>微信公众号支付</b>的接入步骤：
			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、在公众号上配置授权目录。（详情请查看：https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_3）</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、获取code</div>
			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID8&redirect_uri=http://online.icloudful.com/nocard/public/createOrderView&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";

			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、通过code+APPID+SECRET生成OpenId（可参考下图代码）</div>
			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				https://api.weixin.qq.com/sns/oauth2/access_token?appid=***&secret=***&code=***&grant_type=authorization_code
			</div>
			<div style="margin-top: 16px;">
				<img src="build/custom/images/guide/weixin1.png"></img>
			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、调用前置生成订单接口生成订单（详情请查看：普通接口接入指南）</div>
			
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、通过H5调起支付（如下图，详情请查看微信官方文档：https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_7&index=6）</div>
			
			<div style="margin-top: 16px;">
				<img src="build/custom/images/guide/weixin2.png"></img>
			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		</div>
	</div>
</div>
