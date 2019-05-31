<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="widget box" id="widgetBox">

	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>总帐列表
		</h4>
	</div>

	<div class="widget-content  no-padding">

		<div class="dataTables_header clearfix">
			<!-- class=searchForm target=tab 必须 -->
			<form class="searchForm" action="upchannelBalance/search"
				method="post" class="form-inline" target="tab">
				<table class="searchTable">
					<tr>
						<td class="col-md-1">渠道ID</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="ChId" value="${ChId }"></td>
						<td class="col-md-1" nowrap="nowrap">渠道商户号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="ChMerchId" value="${ChMerchId }"></td>
						<td>
							<button type="submit" class="btn green-haze">
								<i class="fa fa-search"></i>&nbsp;查询
							</button>
						</td>

					</tr>
				</table>
			</form>
		</div>
		<!-- 操作按钮 -->
		<div class="button-group">
			<div class="button-group">
				<label style="margin-left: 30px; margin-top: 5px;"><font
					color="red">温馨提示：当天累计金额每5分钟更新一次数据，与实际数据有滞后</font></label> 
			</div>
		</div>
		<table
			class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
			<thead>
				<tr>
					<th>序号</th>
					<th>渠道ID</th>
					<th>渠道名称</th>
					<th>商户名称</th>
					<th>渠道商户号</th>
					<th>余额</th>
					<th>T0额度</th>
					<th class="text-center">冻结金额</th>
					<th class="text-center">当天累计金额</th>
					<th class="text-center">货币类型</th>
					<!-- <th class="text-center">签名密钥</th>
					<th class="text-center">备注</th> -->
					<th class="text-center">最后更新时间</th>
					<th class="text-center">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${upchannelBalanceList }" var="item"
					varStatus="status">
					<tr>
						<td>${status.index+(page.index-1)*page.size+1}</td>
						<td>${item.ChId }</td>
						<td>${item.ChName }</td>
						<td>${item.MerchName }</td>
						<td>${item.ChMerchId }</td>
						<td>${item.Balance }</td>
						<td>${item.T0Lines }</td>
						<td>${item.FrozenTotal }</td>
						<td>${item.AccruAmount }</td>
						<td>${item.Currency }</td>
						<%-- <td>${item.SignKey }</td>
						<td>${item.ReMark }</td> --%>
						<td><fmt:formatDate value="${item.LastUpdate }"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td class="text-center"><a
							href="upchannelBalance/form?ChId=${item.ChId}&ChMerchId=${item.ChMerchId}"
							class="btn btn-xs btn-info user_edit" title="查看详情" target="tab">
								<i class="fa fa-pencil"></i>查看
						</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty upchannelBalanceList }">
					<tr class="odd gradeX">
						<td colspan="10" class="empty-list">暂无相关结果.</td>
					</tr>
				</c:if>
			</tbody>

		</table>

	</div>
</div>
<%@ include file="/include/pagination.jsp"%>
