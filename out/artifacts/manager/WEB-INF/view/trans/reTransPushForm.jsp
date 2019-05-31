<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="es"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-header">
	<h5 class="modal-title">查看推送详情</h5>
</div>
<div class="modal-body">

	<div class="row">
		<div class="col-md-12">
			<div class="widget">
				<div class="widget-content">
					<form class="row-border" action="#">
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">前端商户号:</label> <label
									class="control-text col-md-8">${reTransPush.MerchId }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">前置订单号:</label> <label
									class="control-text col-md-8">${reTransPush.OrderNo }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">商户订单号:</label> <label
									class="control-text col-md-8">${reTransPush.MerchOrderNo }</label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">添加时间:</label> <label
									class="control-text col-md-8"> <fmt:formatDate
										value="${reTransPush.AddDate }" pattern="yyyy-MM-dd HH:mm:ss" /></label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">推送类型:</label> <label
									class="control-text col-md-8"><c:if
										test="${reTransPush.PushType eq '0' }">推送前端</c:if> <c:if
										test="${reTransPush.PushType eq '1' }">推送商户</c:if></label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">推送次数:</label> <label
									class="control-text col-md-8">${reTransPush.ResendTimes }</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">推送成功时间:</label> <label
									class="control-text col-md-8"> <fmt:formatDate
										value="${reTransPush.SuccessPushDate }"
										pattern="yyyy-MM-dd HH:mm:ss" /></label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">创建主机顺序号:</label> <label
									class="control-text col-md-8">${reTransPush.CreateHost }</label>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">最后推送时间:</label> <label
									class="control-text col-md-8"> <fmt:formatDate
										value="${reTransPush.LastPushDate }"
										pattern="yyyy-MM-dd HH:mm:ss" /></label>
							</div>
							<div class="col-md-6">
								<label class="control-label col-md-4">推送地址:</label> <label
									class="control-text col-md-8">${reTransPush.PushAddr }</label>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<label class="control-label col-md-4">推送数据:</label> <label
									class="control-text col-md-8"> <textArea
										style="width: 800px; height: 130px;" readonly="readonly">${reTransPush.PushData }</textArea>
								</label>
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
