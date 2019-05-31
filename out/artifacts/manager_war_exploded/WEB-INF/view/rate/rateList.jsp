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
			<form class="searchForm" action="rate/search" method="post"
				class="form-inline" target="tab">
				<table class="searchTable">
					<tr>
						<td class="col-md-1">费率名称</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="RateName" value="${RateName }"></td>
						<td class="col-md-1">交易类型</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="PayKind" value="${PayKind }"></td>
						<td class="col-md-1">卡类型</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="CardType" value="${CardType }"></td>
						<%-- <td nowrap="nowrap" class="col-md-1">起始时间</td>
						<td nowrap="nowrap" class="col-md-3"><input
							class="form-control" id="startTimeRate" onblur="checkDate();"
							name="startCreateTime" type="text" value="${startCreateTime }"
							readonly="readonly"></td>
						<td nowrap="nowrap" class="col-md-1">截止时间</td>
						<td nowrap="nowrap" class="col-md-3"><input
							class="form-control" id="endTimeRate" name="endCreateTime"
							type="text" value="${endCreateTime }" readonly="readonly"></td> --%>
					</tr>
					<tr>
						<td class="col-md-1">机构号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="ChInstNo" value="${ChInstNo }"></td>
						<td>
							<button type="submit" class="btn green-haze">
								<i class="fa fa-search"></i>&nbsp;查询
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="button-group">
			<!-- 添加用户另开界面 -->
			<a href="rate/form" id="user_add" target="tab"><i
				class="fa fa-plus"></i>添加费率</a>
			<!-- 使用title会弹出确认框 -->
			<a href="rate/delete" id="user_del" target="selectAjax"
				title="确定要删除?"><i class="fa fa-trash"></i>删除</a>
		</div>
		<table
			class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
			<thead>
				<tr>
					<th class="checkbox-column">
						<div class="checker">
							<span><input type="checkbox" class="group-checkbox"></span>
						</div>
					</th>
					<th style="width: 50px">序号</th>
					<th>费率名称</th>
					<th>交易类型</th>
					<th>卡类型</th>
					<th>渠道机构号</th>
					<th>费率比率</th>
					<th>最低收费金额</th>
					<th>最低收费</th>
					<th>最高收费</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rateList }" var="item" varStatus="status">
					<tr>
						<td class="checkbox-column">
							<div class="checker">
								<span><input type="checkbox" name="ids"
									value="${item.RateName }" /></span>
							</div>
						</td>
						<td>${status.index+(page.index-1)*page.size+1}</td>
						<td>${item.RateName}</td>
						<td>${item.PayKind}</td>
						<td>${item.CardType}</td>
						<td>${item.ChInstNo}</td>
						<td>${item.Percent}</td>
						<td>${item.RateNeedAmount}</td>
						<td>${item.LowLevel}</td>
						<td>${item.HighLevel}</td>
						<td class="text-center"><a
							href="rate/form?id=${item.RateName}"
							class="btn btn-xs btn-info user_edit" title="查看详情" target="tab">
								<i class="fa fa-pencil"></i>详情
						</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty rateList }">
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
	$("#startTimeRate").datetimepicker({
		format : 'YYYY-MM-DD HH:mm'
	});
	$("#endTimeRate").datetimepicker({
		format : 'YYYY-MM-DD HH:mm'
	});
</script>