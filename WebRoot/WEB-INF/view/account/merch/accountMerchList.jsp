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
			<form class="searchForm" action="accountMerch/search" method="post"
				class="form-inline" target="tab">
				<table class="searchTable">
					<tr>
						<td class="col-md-1">账号</td>
						<td class="col-md-3"><input class="form-control" type="text"
							name="AccountNo" value="${AccountNo }"></td>
						<td class="col-md-1" nowrap="nowrap">使用状态</td>
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
						</td><td></td>
					</tr>
					<tr>
						<td nowrap="nowrap" colspan="2">当前总金额：<span class="red">￥${sumBalance }
								元</span> &nbsp;&nbsp;&nbsp;
						</td>
						<td nowrap="nowrap" colspan="2">当前总冻结金额：<span class="red">￥${sumFrozen }
								元</span></td>
						<td nowrap="nowrap" colspan="2"><label
							style="margin-left: 30px; margin-top: 5px;"><font
								color="red">温馨提示：数据实时统计，可能存在差异！</font></label></td>
					</tr>
				</table>
			</form>
		</div>

		<table
			class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
			<thead>
				<tr>
					<th style="width: 50px">序号</th>
					<th>商户账号</th>
					<th>商户号/商户名称</th>
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
				<c:forEach items="${accountMerchList }" var="item"
					varStatus="status">
					<tr>
						<td>${status.index+(page.index-1)*page.size+1}</td>
						<td>${item.AccountNo}</td>
						<td><c:forEach items="${MerchList }" var="merch">
								<c:if
									test="${fn:contains(item.AccountNo, merch.MerchId) and fn:contains(item.AccountNo, 'AM_')}">
									${merch.MerchId}
								</c:if>
							</c:forEach><br>
						<c:forEach items="${MerchList }" var="merch">
								<c:if
									test="${fn:contains(item.AccountNo, merch.MerchId) and fn:contains(item.AccountNo, 'AM_')}">
									${merch.MerchName}
								</c:if>
							</c:forEach></td>
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
							href="accountMerch/form?id=${item.AccountNo}"
							class="btn btn-xs btn-info user_edit" title="查看详情" target="tab">
								<i class="fa fa-pencil"></i>查看
						</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty accountMerchList }">
					<tr class="odd gradeX">
						<td colspan="10" class="empty-list">暂无相关结果.</td>
					</tr>
				</c:if>
			</tbody>

		</table>

	</div>
</div>
<%@ include file="/include/pagination.jsp"%>
