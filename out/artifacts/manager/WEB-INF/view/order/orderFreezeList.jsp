<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>当天订单列表
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="order/searchFreeze" method="post"
						class="form-inline" target="tab">
						<table class="search-table">
							<tr>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="MerchId"
									value="${MerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">前端订单号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="OrderNo"
									value="${OrderNo }"></td>
								<td nowrap="nowrap" class="col-md-1">外部订单号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="MerchOrderNo"
									value="${MerchOrderNo }"></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">发送机构号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="SendInst"
									value="${SendInst }"></td>
								<td nowrap="nowrap" class="col-md-1">起始订单时间</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" id="startCreateTime" onblur="checkDate();"
									name="startCreateTime" type="text" value="${startCreateTime }"
									readonly="readonly"></td>
								<td nowrap="nowrap" class="col-md-1">截止订单时间</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" id="endCreateTime" name="endCreateTime"
									type="text" value="${endCreateTime }" readonly="readonly"></td>
								<td nowrap="nowrap">
									<button type="submit" class="btn green-haze">
										<i class="icon-search"></i>&nbsp;搜索
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<!-- 操作按钮 -->
				<%-- 	<div class="button-group">
					<div class="button-group">
						<a
							href="order/exportOrder?startCreateTime=${startCreateTime }&endCreateTime=${endCreateTime }&MerchId=${MerchId }&OrderNo=${OrderNo }&MerchOrderNo=${MerchOrderNo }&BussID=${BussID}&OrderStatus=${OrderStatus}&PayType=${PayType}"
							target="Ajax"><i class="fa fa-file-excel-o"></i>导出明细</a>
					</div>
				</div> --%>
				<table
					class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
					<thead>
						<tr>
							<th nowrap="nowrap" style="width: 2%">序号</th>
							<th nowrap="nowrap" style="width: 10%">商户号/商户名称</th>
							<th nowrap="nowrap" style="width: 10%">订单号</th>
							<th nowrap="nowrap" style="width: 8%">冻结/解冻</th>
							<th nowrap="nowrap" style="width: 8%">交易金额</th>
							<th nowrap="nowrap" style="width: 8%">实际冻结/解冻金额</th>
							<th nowrap="nowrap" style="width: 12%">交易时间/支付日期</th>
							<th nowrap="nowrap" style="width: 8%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${OrderFreezeList }" var="item"
							varStatus="status">
							<tr>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}<br>${item.MerchName}</td>
								<td>${item.OrderNo}</td>
								<td><c:if test="${fn:contains(item.TransName,'冻结') }">
										<span class="label label-danger">冻结</span>
									</c:if> <c:if test="${fn:contains(item.TransName,'解冻') }">
										<span class="label label-success">解冻</span>
									</c:if></td>
								<td>${item.Amount}</td>
								<td>${item.ActualAmount}</td>
								<td><fmt:formatDate value="${item.TransTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /><br>${item.PayTime}</td>
								<td><a href="order/freezeForm?UUID=${item.TRANS_UUID}"
									class="btn btn-xs btn-info user_edit" title="查看订单详情"
									target="tab" refresh="true"> <i class="fa fa-pencil"></i>查看
								</a> <c:if test="${fn:contains(item.TransName , '冻结') }">
									&nbsp;<a href="order/frozen?orderNo=${item.OrderNo}&type=H"
											class="btn btn-xs btn-info user_edit" title="解冻"
											target="ajax" refresh="true"> <i class="fa fa-pencil"></i>解冻
										</a>
									</c:if></td>
							</tr>
						</c:forEach>
						<c:if test="${empty OrderFreezeList }">
							<tr class="odd gradeX">
								<td colspan="12" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>

				</table>

				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
<script>
	$("#startCreateTime").datetimepicker({
		format : 'YYYY-MM-DD HH:mm:ss'
	});
	$("#endCreateTime").datetimepicker({
		format : 'YYYY-MM-DD HH:mm:ss'
	});

	function checkDate() {

	}
</script>