<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-12">
		<div class="widget box" style="overflow: auto; overflow-x: 100%">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>统计列表
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="channelMerch/countList"
						method="post" class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td class="col-md-1" nowrap="nowrap">排序内容</td>
								<td class="col-md-3" nowrap="nowrap"><select name="orderBy"
									id="orderBy" class="form-control">
										<option value="" >请选择</option>
										<option value="perMinNum"
											${orderBy == 'perMinNum' ? 'selected' : '' }>每分钟计数</option>
										<option value="perHourNum"
											${orderBy == 'perHourNum' ? 'selected' : '' }>每小时计数</option>
										<option value="perDayNum"
											${orderBy == 'perDayNum' ? 'selected' : '' }>每天计数</option>
										<option value="perMonthNum"
											${orderBy == 'perMonthNum' ? 'selected' : '' }>每月计数</option>
										<option value="totalNum"
											${orderBy == 'totalNum' ? 'selected' : '' }>总计数</option>
										<option value="perMinAmount"
											${orderBy == 'perMinAmount' ? 'selected' : '' }>每分钟总交易额</option>
										<option value="perHourAmount"
											${orderBy == 'perHourAmount' ? 'selected' : '' }>每小时总交易额</option>
										<option value="perDayAmount"
											${orderBy == 'perDayAmount' ? 'selected' : '' }>每天总交易额</option>
										<option value="perMonthAmount"
											${orderBy == 'perMonthAmount' ? 'selected' : '' }>每月总交易额</option>
										<option value="totalAmount"
											${orderBy == 'totalAmount' ? 'selected' : '' }>总交易额</option>
								</select></td>
								<td class="col-md-1" nowrap="nowrap">商户状态</td>
								<td class="col-md-3" nowrap="nowrap"><select
									name="ChMerchStatus" id="ChMerchStatus" class="form-control">
										<option value="">请选择</option>
										<option value="1" ${ChMerchStatus == '1' ? 'selected' : '' }>启用</option>
										<option value="0" ${ChMerchStatus == '0' ? 'selected' : '' }>禁用</option>
								</select></td>
								<td class="col-md-1" nowrap="nowrap">子商户状态</td>
								<td class="col-md-3" nowrap="nowrap"><select
									name="ChSubMerchStatus" id="ChSubMerchStatus"
									class="form-control">
										<option value="">请选择</option>
										<option value="1"
											${ChSubMerchStatus == '1' ? 'selected' : '' }>启用</option>
										<option value="0"
											${ChSubMerchStatus == '0' ? 'selected' : '' }>禁用</option>
								</select></td>
							</tr>
							<tr>
								<td class="col-md-1" nowrap="nowrap">排序类型</td>
								<td class="col-md-3" nowrap="nowrap"><select
									name="sortType" id="sortType" class="form-control">
										<option value="desc" ${sortType == 'desc' ? 'selected' : '' }>降序</option>
										<option value="asc" ${sortType == 'asc' ? 'selected' : '' }>升序</option>
								</select></td>
								<td nowrap="nowrap" class="col-md-1">商户编号</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="ChMerchId" value="${ChMerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">商户名称</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="ChMerName" value="${ChMerName }"></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="MerchId" value="${MerchId }"></td>
								<td nowrap="nowrap">
									<button type="submit" class="btn green-haze">
										<i class="fa fa-search"></i>&nbsp;查询
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="button-group">
					<a href="channelMerch/updateStatus" id="merch_del"
						class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?" refresh="true"><i
						class="fa "></i>剔除</a>
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
							<th nowrap="nowrap">前端商户号/前端终端号</th>
							<th nowrap="nowrap">子商户号</th>
							<th nowrap="nowrap">商户编号/商户名称</th>
							<th nowrap="nowrap">商户状态</th>
							<th nowrap="nowrap">子商户状态</th>
							<th nowrap="nowrap">最后交易时间</th>
							<th nowrap="nowrap">每分钟计数</th>
							<th nowrap="nowrap">每小时计数</th>
							<th nowrap="nowrap">每天计数</th>
							<th nowrap="nowrap">每月计数</th>
							<th nowrap="nowrap">总计数</th>
							<th nowrap="nowrap">每分钟总交易额</th>
							<th nowrap="nowrap">每小时总交易额</th>
							<th nowrap="nowrap">每天总交易额</th>
							<th nowrap="nowrap">每月总交易额</th>
							<th nowrap="nowrap">总交易额</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ChannelMerchList }" var="item"
							varStatus="status">
							<tr><td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids" value="${item.UUID }" /></span>
									</div>
								</td>
								<td nowrap="nowrap">${item.MerchId}</br>${item.TermId}</td>
								<td nowrap="nowrap">${item.ChSubMerId}</td>
								<td nowrap="nowrap">${item.ChMerchId}</br>${item.ChMerName}</td>
								<td nowrap="nowrap"><c:if
										test="${item.ChMerchStatus == '1' }">
										<span class="label label-success"> 启用 </span>
									</c:if> <c:if test="${item.ChMerchStatus ne '1' }">
										<span class="label label-warning"> 禁用 </span>
									</c:if></td>
								<td nowrap="nowrap"><c:if
										test="${item.ChSubMerchStatus == '1' }">
										<span class="label label-success"> 启用 </span>
									</c:if> <c:if test="${item.ChSubMerchStatus ne '1' }">
										<span class="label label-warning"> 禁用 </span>
									</c:if></td>
								<td nowrap="nowrap"><fmt:formatDate value="${item.lastTransTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td nowrap="nowrap">${item.perMinNum}</td>
								<td nowrap="nowrap">${item.perHourNum}</td>
								<td nowrap="nowrap">${item.perDayNum}</td>
								<td nowrap="nowrap">${item.perMonthNum}</td>
								<td nowrap="nowrap">${item.totalNum}</td>
								<td nowrap="nowrap">${item.perMinAmount}</td>
								<td nowrap="nowrap">${item.perHourAmount}</td>
								<td nowrap="nowrap">${item.perDayAmount}</td>
								<td nowrap="nowrap">${item.perMonthAmount}</td>
								<td nowrap="nowrap">${item.totalAmount}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty ChannelMerchList }">
							<tr class="odd gradeX">
								<td colspan="17" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
