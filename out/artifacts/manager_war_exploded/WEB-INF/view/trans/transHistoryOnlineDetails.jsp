<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="es" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="modal-header">
	<h5 class="modal-title">
		交易明细
	</h5>
</div>
<div class="modal-body">

<div class="row">
	<div class="col-md-12">
		<div class="widget">
                <div class="widget-content">
					<form  class="row-border" action="#">
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">前端商户号:</label>
									<label class="control-text col-md-3">${trans.MerchId }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">商户名称:</label>
									<label class="control-text col-md-3">${trans.MerchName }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">支付方式:</label>
									<label class="control-text col-md-4">${trans.PayType }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">交易日期:</label>
									<label class="control-text col-md-4">${trans.transDate + trans.transTime }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">交易名称:</label>
									<label class="control-text col-md-4">${trans.TransName }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">交易金额:</label>
									<label class="control-text col-md-9">￥${trans.Amount }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">前端终端号:</label>
									<label class="control-text col-md-4">${trans.TermId }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">机构号:</label>
									<label class="control-text col-md-4">${trans.InstNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3"> 订单号:</label>
									<label class="control-text col-md-4">${trans.OrderNo }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">商户订单号:</label>
									<label class="control-text col-md-4">${trans.MerchOrderNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道订单号:</label>
									<label class="control-text col-md-4">${trans.UpChOrderNo }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道返回码:</label>
									<label class="control-text col-md-4">${trans.ChRsp }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">用户号:</label>
									<label class="control-text col-md-4">${trans.ChnlUserId }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">原商户订单号:</label>
									<label class="control-text col-md-4">${trans.OriMerchOrderNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">原 订单号:</label>
									<label class="control-text col-md-4">${trans.OriOrderNo }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">原渠道订单号:</label>
									<label class="control-text col-md-4">${trans.OriUpChOrderNo }</label>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道清算日期:</label>
									<label class="control-text col-md-4">${trans.ChSettleDate }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道名称:</label>
									<label class="control-text col-md-4">${trans.ChName }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道号:</label>
									<label class="control-text col-md-4">${trans.ChInstNo }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道商户号:</label>
									<label class="control-text col-md-4">${trans.ChMerchId }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道子商户号:</label>
									<label class="control-text col-md-4">${trans.ChSubMerId }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">商品名称:</label>
									<label class="control-text col-md-4">${trans.GoodNames }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">微信openId:</label>
									<label class="control-text col-md-4">${trans.Openid }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">支付宝商户门店编号:</label>
									<label class="control-text col-md-4">${trans.StoreId }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">支付收款商户名称:</label>
									<label class="control-text col-md-4">${trans.subMerName }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">支付商户识别id:</label>
									<label class="control-text col-md-4">${trans.subMerNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">外部商户注册时间:</label>
									<label class="control-text col-md-4">${trans.omRt }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">外部商户行业:</label>
									<label class="control-text col-md-4">${trans.omType }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">外部商户地址:</label>
									<label class="control-text col-md-4">${trans.omAdd }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">支付宝交易号:</label>
									<label class="control-text col-md-4">${trans.TradeNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">结算标志:</label>
									<label class="control-text col-md-4">${trans.TransEnd }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">二维码链接:</label>
									<label class="control-text col-md-4">${trans.qrCode }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">授权码:</label>
									<label class="control-text col-md-4">${trans.AuthCode }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">交易金额:</label>
									<label class="control-text col-md-4">${trans.B4Amt }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">内部错误码:</label>
									<label class="control-text col-md-4">${trans.InterErrCode }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">详细出错信息:</label>
									<label class="control-text col-md-4">${trans.RuleError }</label>
							</div>
						</div>
						
					</form>
                </div>
         </div>
                
	</div>
</div>
<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
</div>
</div>
