<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="widget box" id="widgetBox">

	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>总帐列表
		</h4>
	</div>

	<div class="widget-content  no-padding">

		<div class="dataTables_header clearfix">
			<!-- class=searchForm target=tab 必须 -->
			<form class="searchForm" action="account/search" method="post"
				class="form-inline" target="tab">
				<table class="searchTable">
					<tr>
						<td class="col-md-1">账号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="AccountNo" value="${AccountNo }"></td>
						<td nowrap="nowrap" class="col-md-1">起始时间</td>
						<td nowrap="nowrap" class="col-md-3"><input
							class="form-control" id="startTimeAccount" onblur="checkDate();"
							name="startCreateTime" type="text" value="${startCreateTime }"
							readonly="readonly"></td>
						<td nowrap="nowrap" class="col-md-1">截止时间</td>
						<td nowrap="nowrap" class="col-md-3"><input
							class="form-control" id="endTimeAccount" name="endCreateTime"
							type="text" value="${endCreateTime }" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="col-md-1">使用状态</td>
						<td class="col-md-3"><select class="form-control"
							name="AccountStatus">
								<option value="">全部</option>
								<option value="1" ${AccountStatus == '1' ? 'selected' : '' }>启用</option>
								<option value="0" ${AccountStatus == '0' ? 'selected' : '' }>禁用</option>
						</select></td>
						<td>
							<button type="submit" class="btn green-haze">
								<i class="fa fa-search"></i>&nbsp;查询
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<table
			class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
			<thead>
				<tr>
					<th style="width: 50px">序号</th>
					<th>账号</th>
					<th>帐号状态</th>
					<th class="text-center">当前余额</th>
					<th class="text-center">冻结金额</th>
					<th class="text-center">上次余额</th>
					<th class="text-center">上次冻结金额</th>
					<th class="text-center">上次更新时间</th>
					<th class="text-center">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${accountList }" var="item" varStatus="status">
					<tr>
						<td>${status.index+(page.index-1)*page.size+1}</td>
						<td>${item.AccountNo}</td>
						<td class="text-center"><c:if
								test="${item.AccountStatus == '0' }">
								<span class="label label-warning"> 禁用 </span>
							</c:if> <c:if test="${item.AccountStatus == '1' }">
								<span class="label label-success"> 启用 </span>
							</c:if></td>
						<td>${item.Balance}</td>
						<td>${item.FrozenTotal}</td>
						<td>${item.LastBalance}</td>
						<td>${item.LastFrozenTotal}</td>
						<td><fmt:formatDate value="${item.UpdateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="text-center"><a
							href="account/form?id=${item.AccountNo}"
							class="btn btn-xs btn-info user_edit" title="查看详情" target="tab">
								<i class="fa fa-pencil"></i>查看详情
						</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty accountList }">
					<tr class="odd gradeX">
						<td colspan="10" class="empty-list">暂无相关结果.</td>
					</tr>
				</c:if>
			</tbody>

		</table>

	</div>
</div>
<%@ include file="/include/pagination.jsp"%>
<script>
	$("#startTimeAccount").datetimepicker({
		format : 'YYYY-MM-DD HH:mm'
	});
	$("#endTimeAccount").datetimepicker({
		format : 'YYYY-MM-DD HH:mm'
	});
</script>