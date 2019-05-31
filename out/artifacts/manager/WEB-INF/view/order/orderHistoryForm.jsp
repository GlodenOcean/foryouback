<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="es"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal-header">
	<h5 class="modal-title">查看订单详情</h5>
</div>
<div class="modal-body">

	<div class="row">
		<div class="col-md-12">
			<div class="widget">
				<div class="widget-content">
					<form class="row-border" action="#">
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">交易名称:</label> 
								<label class="control-text col-md-8">${orderHistory.TransName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单时间:</label> 
								<label class="control-text col-md-8">
								<fmt:formatDate value="${orderHistory.TransTime }" pattern="yyyy-MM-dd HH:mm:ss"/></label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">前置订单号:</label> 
								<label class="control-text col-md-8">${orderHistory.OrderNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户订单号:</label> 
								<label class="control-text col-md-8">${orderHistory.MerchOrderNo }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道订单号:</label> 
								<label class="control-text col-md-8">${orderHistory.UpChOrderNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户名称:</label> 
								<label class="control-text col-md-8">${orderHistory.MerchName }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">前端商户号:</label> 
								<label class="control-text col-md-8">${orderHistory.MerchId }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单状态:</label>
								<label class="control-text col-md-8">
									<%-- <select name="orderHistory.OrderNoStatus" class="form-control">
										<option value="99" ${orderHistory.OrderNoStatus == '99' ? 'selected' : '' }>结果未知</option>
										<option value="00" ${orderHistory.OrderNoStatus == '00' ? 'selected' : '' }>支付成功</option>
										<option value="01" ${orderHistory.OrderNoStatus == '01' ? 'selected' : '' }>支付失败</option>
										<option value="02" ${orderHistory.OrderNoStatus == '02' ? 'selected' : '' }>已撤销</option>
										<option value="03" ${orderHistory.OrderNoStatus == '03' ? 'selected' : '' }>已退货</option>
									</select> --%>
									<c:if test="${orderHistory.OrderStatus eq '99' }">结果未知</c:if>
									<c:if test="${orderHistory.OrderStatus eq '00' }">支付成功</c:if>
									<c:if test="${orderHistory.OrderStatus eq '01' }">支付失败</c:if>
									<c:if test="${orderHistory.OrderStatus eq '02' }">已撤销</c:if>
									<c:if test="${orderHistory.OrderStatus eq '03' }">已退货</c:if>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">错误描述:</label> 
								<label class="control-text col-md-8">${orderHistory.OrderNoErrorMsg }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">上游渠道回调状态:</label> 
								<label class="control-text col-md-8">${orderHistory.上游渠道回调状态 }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">交易金额:</label> 
								<label class="control-text col-md-8">${orderHistory.b4_amt }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户回调状态:</label> 
								<label class="control-text col-md-8">${orderHistory.MerchCallBackStaus }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">商户回调次数:</label> 
								<label class="control-text col-md-8">${orderHistory.MerchCallBackCount }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">支付方式:</label> 
								<label class="control-text col-md-8">
									<c:forEach items="${payTypeEnumList }" var="payTypeEnum">
										<c:if test="${orderHistory.PayType eq payTypeEnum.value }">
											${payTypeEnum.desc}
										</c:if>
									</c:forEach>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">是否T0:</label> 
								<label class="control-text col-md-8">
									<%-- <select name="orderHistory.IsT0" class="form-control">
										<option value="99" ${orderHistory.IsT0 == '0' ? 'selected' : '' }>否</option>
										<option value="00" ${orderHistory.IsT0 == '1' ? 'selected' : '' }>是</option>
									</select> --%>
									<c:if test="${orderHistory.IsT0 eq '1' }">是</c:if>
									<c:if test="${orderHistory.IsT0 ne '1' }">否</c:if>
								</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道清算日期:</label> 
								<label class="control-text col-md-8">${orderHistory.ChSettleDate }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道名称:</label> 
								<label class="control-text col-md-8">${orderHistory.ChName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道子商户号:</label> 
								<label class="control-text col-md-8">${orderHistory.ChSubMerId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道机构号:</label> 
								<label class="control-text col-md-8">${orderHistory.ChInstNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道商户号:</label> 
								<label class="control-text col-md-8">${orderHistory.ChMerchId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">微信openId:</label> 
								<label class="control-text col-md-8">${orderHistory.Openid }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">支付宝商户门店编号:</label> 
								<label class="control-text col-md-8">${orderHistory.StoreId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">支付商户识别id:</label> 
								<label class="control-text col-md-8">${orderHistory.SubMerNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">支付收款商户名称:</label> 
								<label class="control-text col-md-8">${orderHistory.SubMerName }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">外部商户注册时间:</label> 
								<label class="control-text col-md-8">${orderHistory.OmRt }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">外部商户行业:</label> 
								<label class="control-text col-md-8">${orderHistory.OmType }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">外部商户地址:</label> 
								<label class="control-text col-md-8">${orderHistory.OmAdd }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">付款银行:</label> 
								<label class="control-text col-md-8">${orderHistory.BankType }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">支付宝交易号:</label> 
								<label class="control-text col-md-8">${orderHistory.TradeNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">用户号:</label> 
								<label class="control-text col-md-8">${orderHistory.ChnlUserId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">二维码:</label> 
								<label class="control-text col-md-8">${orderHistory.QrCode }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">授权码:</label> 
								<label class="control-text col-md-8">${orderHistory.AuthCode }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">商户回调地址:</label> 
								<label class="control-text col-md-8">${orderHistory.MerchCallBackUrl }</label>
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
