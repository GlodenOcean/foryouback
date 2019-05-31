<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="es"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-header">
	<h5 class="modal-title">查看冻结/解冻详情</h5>
</div>
<div class="modal-body">

	<div class="row">
		<div class="col-md-12">
			<div class="widget">
				<div class="widget-content">
					<form class="row-border" action="#">
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">交易名称:</label> <label
									class="control-text col-md-8">${order.TransName }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单时间:</label> <label
									class="control-text col-md-8"> <fmt:formatDate
										value="${order.TransTime }" pattern="yyyy-MM-dd HH:mm:ss" /></label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">前置订单号:</label> <label
									class="control-text col-md-8">${order.OrderNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户订单号:</label> <label
									class="control-text col-md-8"> ${order.MerchOrderNo }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">原商户订单号:</label> <label
									class="control-text col-md-8">${order.OriMerchOrderNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">商户名称:</label> <label
									class="control-text col-md-8"> ${order.MerchName }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">汇卡商户号:</label> <label
									class="control-text col-md-8">${order.MerchId }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">订单状态:</label> <label
									class="control-text col-md-8"> 成功</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">交易金额:</label> <label
									class="control-text col-md-8">${order.Amount }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">发送机构:</label> <label
									class="control-text col-md-8"> ${order.SendInst }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">商户备注:</label> <label
									class="control-text col-md-8">${order.ReMark }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">创建主机序号:</label> <label
									class="control-text col-md-8"> ${order.CreateHost }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">交易类型:</label> <label
									class="control-text col-md-8">${order.TransType }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">入账类型:</label> <label
									class="control-text col-md-8"> <c:if test="${order.InCommType eq 0}">入账到商户</c:if>
									<c:if test="${order.InCommType eq 1}">入账到机构</c:if></label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">实际冻结或解冻金额:</label> <label
									class="control-text col-md-8">${order.ActualAmount }</label>
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
