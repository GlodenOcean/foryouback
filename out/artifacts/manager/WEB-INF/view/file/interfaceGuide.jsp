<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="widget box">
	<div class="widget-content  no-padding">
		<div style="margin-left: 30px; margin-right: 30px;">
			<div>
				<font color="red" style="text-align: center;"><h3>
						<b>普通接口接入指南</b>
					</h3></font>
			</div>
			<div style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;普通接口包括订单生成、订单查询、扫码支付（被扫）、银行卡要素认证、无卡消费和退货接口，微信公众号支付和无卡快捷支付除外。</div>
			<div style="margin-top: 6px;">
				以 <b>订单生成</b> 为例的接入步骤：
			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、请点击文档下载里面的接口文档下载，下载前置无卡支付接入指南。（如下图）</div>
			<div style="margin-top: 6px;">
				<img src="build/custom/images/guide/interface1.jpg"></img>
			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、请仔细阅读前置无卡支付接入指南。在订单生成接口文档里请注意“可空”和“签名顺序”这两列。可空表示请求到服务器是需要带上这些参数，但是参数的值可以为空。签名顺序表示这些数据都参与生成签名，且生成签名时参与签名的数据的顺序必须按照文档提供的顺序来，否则会提示“验签失败”。</div>
			<div style="margin-top: 6px;">
				<img src="build/custom/images/guide/interface2.jpg"></img>
			</div>
			<div style="margin-top: 16px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: blue">生成签名案例：</b>
			</div>
			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>参与签名数据</b>
				:version=V001&organNo=12999000&hicardMerchNo=104401569102119&payType=011&bizType=&merchOrderNo=504bddc9511840eb9e6cb457ffbb1953&showPage=0&amount=1&frontEndUrl=&backEndUrl=http://wx.12345.com&前置商户号
			</div>

			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>请求数据</b>
				:{"version":"V001","organNo":"12999000","hicardMerchNo":"104401569102119","payType":"011","bizType":"","goodsName":"wx","merchOrderNo":"504bddc9511840eb9e6cb457ffbb1953","showPage":"0","amount":"1","certsNo":"","frontEndUrl":"","backEndUrl":"http://wx.12345.com","openId":"","subAppId":"null","isT0":"0","remark":"","reserved":"","sign":"6de9dde35049017185416f9d36d517fc"}
			</div>

			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>服务器返回数据</b>
				:{"version":"V001","organNo":"12999000","hicardMerchNo":"104401569102119","payType":"011","merchOrderNo":"504bddc9511840eb9e6cb457ffbb1953","hicardOrderNo":"4141706221187622","isHtml":"","html":"","qrURL":"weixin://wxpay/bizpayurl?pr=XNyjVjf","showPage":"0","amount":"1","createTime":"","payInfo":"","respCode":"00","respMsg":"成功","sign":"4baf32e009379eb4638e55d3ea1449c4"}
			</div>
			<div style="margin-top: 16px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: red">常见问题：</b>
			</div>
			<div style="margin-top: 6px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: blue">一、验签失败</b>
			</div>
			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>可能原因</b><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、验签数据顺序不对，必须按照文档上提供的数据的签名顺序进行MD5签名；<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、参与验签的数据不全，缺少签名的数据；<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、没加前置商户秘钥，在签名的数据后面需要加上前置商户秘钥
			</div>
			<div style="margin-top: 6px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: blue">二、没返回数据</b>
			</div>
			<div
				style="margin-top: 6px; word-wrap: break-word; word-break: break-all; display: block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>可能原因</b><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、上送方式必须为POST，不能为GET；<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、不能再界面采用Ajax或者其他方式异步上送；<br>
			</div>
			<div style="margin-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		</div>
	</div>
</div>
