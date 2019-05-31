<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">
		
                <div class="widget-header">
                  <h4>
                    <i class="icon-reorder"></i>历史订单列表
                  </h4>
                </div>
                
                <div class="widget-content  no-padding">
	                <div class="dataTables_header clearfix">
	               		<!-- class=searchForm target=tab 必须 -->
	               		<form class="searchForm" action="order/searchHistory" method="post" class="form-inline" target="tab">
							<table class="search-table">
								 <tr>
								 	<td nowrap="nowrap" class="col-md-1">商户号</td>
									<td nowrap="nowrap" class="col-md-3"><input class="form-control" type="text" name="MerchId" value="${MerchId }"></td>
								 	<td nowrap="nowrap" class="col-md-1">订单号</td>
									<td nowrap="nowrap" class="col-md-3"><input class="form-control" type="text" name="OrderNo" value="${OrderNo }"></td>
									<td nowrap="nowrap" class="col-md-1">商户订单号</td>
									<td nowrap="nowrap" class="col-md-3"><input class="form-control" type="text" name="MerchOrderNo" value="${MerchOrderNo }"></td>
								 </tr>
								 <tr>
									<td nowrap="nowrap" class="col-md-1">起始订单时间</td>
									<td nowrap="nowrap" class="col-md-3">
										<input class="form-control" id="startCreateTimeHis" name="startCreateTime" type="text" value="${startCreateTime }" readonly="readonly">
									</td>
									<td nowrap="nowrap" class="col-md-1">截止订单时间</td>
									<td nowrap="nowrap" class="col-md-3">
										<input class="form-control" id="endCreateTimeHis" name="endCreateTime" type="text" value="${endCreateTime }" readonly="readonly">
									</td>
									<td nowrap="nowrap" class="col-md-1">渠道号</td>
									<td nowrap="nowrap" class="col-md-3"><input class="form-control" type="text" name="ChInstNo" value="${ChInstNo }"></td>
								 </tr>
								 <tr>
								 	<%-- <td class="col-md-1">起始支付时间</td>
									<td class="col-md-3">
										<input class="form-control" type="text" name="startPayTime" id="startPayTime" value="${startPayTime }"></td>
									<td class="col-md-1">截止支付时间</td>
									<td class="col-md-3">
										<input class="form-control" type="text" name="endPayTime" id="endPayTime" value="${endPayTime }"></td> --%>
								 	<td nowrap="nowrap" class="col-md-1">交易状态</td>
									<td nowrap="nowrap" class="col-md-3">
									<input class="form-control" type="text" name="OrderStatus" value="${OrderStatus }">
										<%-- <select class="form-control" name="OrderNoStatus">
											<option value="">全部</option>
											<option value="99" ${OrderNoStatus == '99' ? 'selected' : '' }>结果未知</option>
											<option value="00" ${OrderNoStatus == '00' ? 'selected' : '' }>支付成功</option>
											<option value="01" ${OrderNoStatus == '01' ? 'selected' : '' }>支付失败</option>
											<option value="02" ${OrderNoStatus == '02' ? 'selected' : '' }>已撤销</option>
											<option value="03" ${OrderNoStatus == '03' ? 'selected' : '' }>已退货</option>
										</select> --%>
									</td>
									<td nowrap="nowrap" class="col-md-1">是否T0交易</td>
								 	<td nowrap="nowrap" class="col-md-3">
										<select class="form-control" name="IsT0">
											<option value="">全部</option>
											<option value="0" ${IsT0 == '0' ? 'selected' : '' }>否</option>
											<option value="1" ${IsT0 == '1' ? 'selected' : '' }>是</option>
										</select>
									</td>
									<td nowrap="nowrap">
										<button type="submit" class="btn green-haze">
											<i class="icon-search"></i>&nbsp;搜索
										</button> 
									</td>
								 </tr>
								 
							</table>
						</form>
	               	</div>
	               
                  <table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
                    <thead>
						<tr>
							<th style="width:50px">序号</th>
							<th>商户号</th>
							<th>订单号</th>
							<th>支付类型</th>
							<th>交易金额</th>
							<th>支付日期</th>
							<th>交易状态</th>
							<th>是否T0</th>						
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dayOrderList }" var="item" varStatus="status">
							<tr>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}</td>
								<td>${item.OrderNo}</td>
								<td>
									<c:forEach items="${payTypeEnumList }" var="payTypeEnum">
										<c:if test="${item.PayType eq payTypeEnum.value }">
											${payTypeEnum.desc}
										</c:if>
									</c:forEach>
								</td>
								<td>${item.Amount}</td>
								<td><fmt:formatDate value="${item.TransTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:if test="${item.OrderStatus == '99' }">
										<span class="label label-info">结果未知</span>
									</c:if>
									<c:if test="${item.OrderStatus == '00' }">
										<span class="label label-success">支付成功</span>
									</c:if>
									<c:if test="${item.OrderStatus == '01' }">
										<span class="label label-danger">支付失败</span>
									</c:if>
									<c:if test="${item.OrderStatus == '02' }">
										<span class="label label-warning">已撤销</span>
									</c:if>
									<c:if test="${item.OrderStatus == '03' }">
										<span class="label label-success">已退货</span>
									</c:if>
								</td>
								<td>
									<c:if test="${item.IsT0 == '0' }">
										<span class="label label-warning">否</span>
									</c:if>
									<c:if test="${item.IsT0 == '1' }">
										<span class="label label-warning">是</span>
									</c:if>
								</td>
								<td>
									<a href="order/orderHistoryForm?orderNo=${item.OrderNo}" class="btn btn-xs btn-info user_edit" title="查看订单详情" target="tab" refresh="true">
										<i class="fa fa-pencil"></i>查看
									</a> 
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty dayOrderList }">
							<tr class="odd gradeX">
								<td colspan="12" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                  <%@ include file="/include/pagination.jsp" %>
                  
                </div>
		</div>
	</div>
</div>
<script>
	$("#startCreateTimeHis").datetimepicker({format:'YYYY-MM-DD HH:mm:ss'}); 
	$("#endCreateTimeHis").datetimepicker({format:'YYYY-MM-DD HH:mm:ss'}); 
</script>