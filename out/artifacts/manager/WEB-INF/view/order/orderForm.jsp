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
								<label class="control-text col-md-8">${order.TransName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单时间:</label> 
								<label class="control-text col-md-8">
								<fmt:formatDate value="${order.TransTime }" pattern="yyyy-MM-dd HH:mm:ss"/></label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">前置订单号:</label> 
								<label class="control-text col-md-8">${order.OrderNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户订单号:</label> 
								<label class="control-text col-md-8">${order.MerchOrderNo }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">交易金额:</label> 
								<label class="control-text col-md-8"><font color="red">${order.Amount } 元</font></label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道订单号:</label> 
								<label class="control-text col-md-8">${order.UpChOrderNo }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">前端商户号:</label> 
								<label class="control-text col-md-8">${order.MerchId }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单状态:</label>
								<label class="control-text col-md-8">
									<c:if test="${order.OrderStatus eq '99' }">结果未知</c:if>
									<c:if test="${order.OrderStatus eq '00' }">支付成功</c:if>
									<c:if test="${order.OrderStatus eq '01' }">支付失败</c:if>
									<c:if test="${order.OrderStatus eq '02' }">已撤销</c:if>
									<c:if test="${order.OrderStatus eq '03' }">已退货</c:if>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">商户回调地址:</label> 
								<label class="control-text col-md-8">${order.MerchCallBackUrl }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户回调状态:</label> 
								<label class="control-text col-md-8">${order.MerchCallBackStaus }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">支付方式:</label> 
								<label class="control-text col-md-8">
								<c:if test="${order.PayType ne '003' }">
									<c:forEach items="${payTypeEnumList }" var="payTypeEnum">
										<c:if test="${order.PayType eq payTypeEnum.value }">
											<c:choose>
												<c:when
													test="${fn:contains(order.ChTransName, '爱农')}">
													${fn:substring(order.ChTransName,2,8)}
												</c:when>
												<c:otherwise> ${order.ChTransName}</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${order.PayType eq '003' }">
									支付宝扫码支付
								</c:if>
								</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">T0状态:</label> 
								<label class="control-text col-md-8">
									<c:if test="${fn:substring(order.T0Status, 2, 3) eq '2' }">是</c:if>
									<c:if test="${fn:substring(order.T0Status, 2, 3) ne '2' }">否</c:if>
								</label>
							</div>
						</div><div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">系统手续费:</label> <label
									class="control-text col-md-8">${order.Fee }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">计费描述:</label> <label
									class="control-text col-md-8">${order.Fee_des }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道清算日期:</label> 
								<label class="control-text col-md-8">${order.ChSettleDate }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道商户号:</label> 
								<label class="control-text col-md-8">${order.ChMerchId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道名称:</label> 
								<label class="control-text col-md-8">${order.ChName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道ID:</label> 
								<label class="control-text col-md-8">${order.ChId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道商户名称:</label> 
								<label class="control-text col-md-8">${order.ChMerName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道交易名称:</label> 
								<label class="control-text col-md-8">${order.ChTransName }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道返回码:</label> 
								<label class="control-text col-md-8">${order.ChReCode }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道子商户号:</label> 
								<label class="control-text col-md-8">${order.ChSubMerId }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">支付收款商户名称:</label> 
								<label class="control-text col-md-8">${order.ChSubMerName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">付款银行:</label> 
								<label class="control-text col-md-8">
									<c:if test="${fn:contains(order.BankType,'_DEBIT')}">
										${order.CardType } - 借记卡
									</c:if>
									<c:if test="${fn:contains(order.BankType,'CFT')}">
										${order.CardType } - 微信零钱 
									</c:if>
									<c:if test="${fn:contains(order.BankType,'PCREDIT')}">
										${order.CardType } -支付宝花呗
									</c:if>
									<c:if test="${fn:contains(order.BankType,'ALIPAYACCOUNT')}">
										${order.CardType } -支付宝余额宝
									</c:if>
									<c:if test="${fn:contains(order.BankType,'_CREDIT')}">
										${order.CardType } -信用卡
									</c:if>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">后端渠道系统流水:</label> 
								<label class="control-text col-md-8">${order.UpTransSSN }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单信息:</label> 
								<label class="control-text col-md-8">${order.OrderErrorMsg }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">付款凭证码:</label> 
								<label class="control-text col-md-8">${order.PayCretNum }</label>
							</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">路由描述:</label> 
								<label class="control-text col-md-8">${order.RuleError }</label>
							</div>
						</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">请求版本号:</label> 
								<label class="control-text col-md-8">${order.ReqVersion }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">发送机构:</label> 
								<label class="control-text col-md-8">${order.SendInst }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">受理机构:</label> 
								<label class="control-text col-md-8">${order.AccInst }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户备注:</label> 
								<label class="control-text col-md-8">${order.ReMark }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">最后查询更新时间:</label> 
								<label class="control-text col-md-8">
								<fmt:formatDate value="${order.LastQueryTime }" pattern="yyyy-MM-dd HH:mm:ss"/></label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">支付完成时间:</label> 
								<label class="control-text col-md-8">${order.PayTime }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">UUID:</label> 
								<label class="control-text col-md-8">${order.TRANS_UUID }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">终端流水号:</label> <label
									class="control-text col-md-8">${order.TermSsn }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">渠道回调时间:</label> <label
									class="control-text col-md-8">${order.UpCallBackTime }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">交易类型:</label> <label
									class="control-text col-md-8">${order.TransType }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">代付-入账姓名:</label> <label
									class="control-text col-md-8">${order.PayforOtherName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">代付-入账卡号:</label> <label
									class="control-text col-md-8">${order.PayforOtherCardNo }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">入账类型:</label> <label
									class="control-text col-md-8"> <c:if
										test="${order.InCommType eq '0' }">入账到商户</c:if> <c:if
										test="${order.InCommType eq '1' }">入账到机构</c:if></label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">付款卡号:</label> 
								<label class="control-text col-md-8">${order.PayAccNo }</label>
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
