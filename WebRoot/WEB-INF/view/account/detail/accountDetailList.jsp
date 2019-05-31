<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<div class="widget box" id="widgetBox">

	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>总帐列表
		</h4>
	</div>

	<div class="widget-content  no-padding">

		<div class="dataTables_header clearfix">
			<!-- class=searchForm target=tab 必须 -->
			<form class="searchForm" action="accountDetail/search" method="post"
				class="form-inline" target="tab">
				<table class="searchTable">
					<tr>
						<td class="col-md-1">订单号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="OrderNo" value="${OrderNo }"></td>
						<td nowrap="nowrap" class="col-md-1">起始时间</td>
						<td nowrap="nowrap" class="col-md-3"><input
							class="form-control" id="startTimeDetial" onblur="checkDate();"
							name="startCreateTime" type="text" value="${startCreateTime }"
							readonly="readonly"></td>
						<td nowrap="nowrap" class="col-md-1">截止时间</td>
						<td nowrap="nowrap" class="col-md-3"><input
							class="form-control" id="endTimeDetial" name="endCreateTime"
							type="text" value="${endCreateTime }" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="col-md-1">源账号类型</td>
						<td class="col-md-3"><select class="form-control"
							name="FromAccType">
								<option value="">全部</option>
								<option value="1" ${FromAccType == '1' ? 'selected' : '' }>机构</option>
								<option value="0" ${FromAccType == '2' ? 'selected' : '' }>商户</option>
						</select></td>
						<td class="col-md-1">源账号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="FromAcc" value="${FromAcc }"></td>
						<td class="col-md-1">记帐名称</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="AccoutingName" value="${AccoutingName }"></td>
					</tr>
					<tr>
						<td class="col-md-1">目标账号类型</td>
						<td class="col-md-3"><select class="form-control"
							name="ToAccType">
								<option value="">全部</option>
								<option value="1" ${ToAccType == '1' ? 'selected' : '' }>机构</option>
								<option value="0" ${ToAccType == '2' ? 'selected' : '' }>商户</option>
						</select></td>
						<td class="col-md-1">目标账号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="ToAcc" value="${ToAcc }"></td>
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
					<th nowrap="nowrap">序号</th>
					<th nowrap="nowrap">记帐处理名称</th>
					<th nowrap="nowrap">订单号</th>
					<th nowrap="nowrap">源账号/目标帐号</th>
					<th nowrap="nowrap">计帐金额</th>
					<th nowrap="nowrap">冻结金额</th>
					<th nowrap="nowrap">源账号余额/处理前源余额</th>
					<th nowrap="nowrap">目标帐号余额/处理前目标余额</th>
					<th nowrap="nowrap">更新时间</th>
					<th nowrap="nowrap">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${accountDetailList }" var="item"
					varStatus="status">
					<tr>
						<td>${status.index+(page.index-1)*page.size+1}</td>
						<td>${item.AccoutingName}</td>
						<td>${item.OrderNo}</td>
						<td>${item.FromAcc}<br>${item.ToAcc}</td>
						<td>${item.Amount}</td>
						<td>${item.FrozenAmount}</td>
						<td>${item.FromBalance}<br>${item.FromLastBalance}</td>
						<td>${item.ToBalance}<br>${item.ToLastBalance}</td>
						<td><fmt:formatDate value="${item.UpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="text-center"><a
							href="accountDetail/form?id=${item.UUID}"
							class="btn btn-xs btn-info user_edit" title="查看详情" target="tab" >详情
						</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty accountDetailList }">
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
	$("#startTimeDetial").datetimepicker({
		format : 'YYYY-MM-DD HH:mm'
	});
	$("#endTimeDetial").datetimepicker({
		format : 'YYYY-MM-DD HH:mm'
	});
</script>