<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="widget box">

	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>交易推送管理
		</h4>
	</div>

	<div class="widget-content  no-padding">
		<!-- 查询 -->
		<div class="dataTables_header clearfix">
			<form class="searchForm" action="reTransPush/search" method="post"
				class="form-inline" target="tab">
				<table class="searchTable">
					<tr>
						<td nowrap="nowrap" class="col-md-1">前端商户号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="MerchId" value="${MerchId }"></td>
						<td nowrap="nowrap" class="col-md-1">前置订单号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="OrderNo" value="${OrderNo }"></td>
						<td nowrap="nowrap" class="col-md-1">推送状态</td>
						<td class="col-md-3"><select class="form-control"
							name="PushStatus">
								<option value="">所有</option>
								<option value="0" ${PushStatus eq '0' ? 'selected' : '' }>推送失败</option>
								<option value="1" ${PushStatus eq '1' ? 'selected' : '' }>推送成功</option>
						</select></td>
					</tr>
					<tr>
						<td nowrap="nowrap" class="col-md-1">交易起始日期</td>
						<td class="col-md-3"><input class="form-control date-picker"
							name="startDate" type="text" value="${startDate }"
							readonly="readonly"></td>
						<td nowrap="nowrap" class="col-md-1">交易结束日期</td>
						<td class="col-md-3"><input class="form-control date-picker"
							name="endDate" type="text" value="${endDate }"
							readonly="readonly"></td>
						<td nowrap="nowrap" class="col-md-1">推送类型</td>
						<td class="col-md-3"><select class="form-control"
							name="PushType">
								<option value="">所有</option>
								<option value="1" ${PushType eq '1' ? 'selected' : '' }>推送商户</option>
								<option value="0" ${PushType eq '0' ? 'selected' : '' }>推送前端</option>
								<option value="6" ${PushType eq '6' ? 'selected' : '' }>T0推送</option>
						</select></td>
						<td>
							<button type="submit" class="btn">
								<i class="fa fa-search"></i>&nbsp;查询
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!-- 操作按钮 -->
		<div class="button-group">
			<a href="reTransPush/pushMerch" target="selectAjax"><i
				class="fa fa-share"></i>回调给客户</a>
		</div>

		<!-- 内容 -->
		<table
			class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
			<thead>
				<tr>
					<th class="checkbox-column">
						<div class="checker">
							<span><input type="checkbox" class="group-checkbox"></span>
						</div>
					</th>
					<th nowrap="nowrap">序号</th>
					<th nowrap="nowrap">前端商户号</th>
					<th nowrap="nowrap">前置订单号</th>
					<th nowrap="nowrap">商户订单号</th>
					<th nowrap="nowrap">新增时间</th>
					<th nowrap="nowrap">推送类型</th>
					<th nowrap="nowrap">推送次数</th>
					<th nowrap="nowrap">推送状态</th>
					<th nowrap="nowrap">成功推送时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reTransPushList }" var="item" varStatus="status">
					<tr>
						<td class="checkbox-column">
							<div class="checker">
								<span><input type="checkbox" name="ids"
									value="${item.uuid }" /></span>
							</div>
						</td>
						<td>${status.index+(page.index-1)*page.size+1}</td>
						<td>${item.MerchId}</td>
						<td>${item.OrderNo}</td>
						<td>${item.MerchOrderNo}</td>
						<td><fmt:formatDate value="${item.AddDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><c:if test="${item.PushType eq '0' }">推送前端</c:if> <c:if
								test="${item.PushType eq '1' }">推送商户</c:if> <c:if
								test="${item.PushType eq '6' }">T0推送</c:if></td>
						<td>${item.ResendTimes}</td>
						<td><c:if test="${item.PushStatus eq '1' }">推送成功</c:if> <c:if
								test="${item.PushStatus eq '0' }">推送失败</c:if></td>
						<td><fmt:formatDate value="${item.SuccessPushDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><a href="reTransPush/form?uuid=${item.uuid}"
							class="btn btn-xs btn-info user_edit" title="修改商户池" target="tab"
							refresh="true"> <i class="fa fa-warn"></i>查看
						</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty reTransPushList }">
					<tr class="odd gradeX">
						<td colspan="11" class="empty-list">暂无相关结果.</td>
					</tr>
				</c:if>
			</tbody>

		</table>

	</div>

</div>
<%@ include file="/include/pagination.jsp"%>


