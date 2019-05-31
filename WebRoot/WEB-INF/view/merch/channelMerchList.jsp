<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-md-12">
		<div class="widget box" style="overflow: auto; overflow-x: 100%">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>商戶列表
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="channelMerch/search" method="post"
						class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td class="col-md-1" nowrap="nowrap">商户号</td>
								<td class="col-md-3" nowrap="nowrap"><input
									class="form-control" type="text" name="ChMerchId"
									value="${ChMerchId }"></td>
								<td class="col-md-1" nowrap="nowrap">商户名称</td>
								<td class="col-md-3" nowrap="nowrap"><input
									class="form-control" type="text" name="ChMerName"
									value="${ChMerName }"></td>
								<td class="col-md-1" nowrap="nowrap">渠道机构号</td>
								<td class="col-md-3" nowrap="nowrap"><input
									class="form-control" type="text" name="ChInstNo"
									value="${ChInstNo }"></td>
							</tr>
							<tr>
								<td class="col-md-1" nowrap="nowrap">支付类型</td>
								<td class="col-md-3" nowrap="nowrap">
								<select name="payKind" class="form-control">
										<option value="">请选择</option>
										<c:forEach items="${payWayEnumList }" var="payWay">
											<option value="${payWay.value }"
												${payKind == payWay.value ? 'selected' : '' }>${payWay.value}</option>
										</c:forEach>
								</select> </td>
								<td class="col-md-1" nowrap="nowrap">行业</td>
								<td class="col-md-3" nowrap="nowrap"><input
									class="form-control" type="text" name="Business"
									value="${Business }"></td>
								<td class="col-md-1" nowrap="nowrap">前端商户号</td>
								<td class="col-md-3" nowrap="nowrap"><input
									class="form-control" type="text" name="MerchId"
									value="${MerchId }"></td>
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
					<!-- 添加用户另开界面 -->
					<a href="channelMerch/form" id="merch_add"
						class="html-modal btn btn-xs" target="tab" refresh="true"><i
						class="fa fa-plus"></i>添加</a>
					<!-- 使用title会弹出确认框 -->
					<a href="channelMerch/delete" id="merch_del"
						class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?"><i
						class="fa fa-plus"></i>删除</a>
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
							<th style="width: 50px" nowrap="nowrap">序号</th>
							<th nowrap="nowrap">前端商户号/前端终端号</th>
							<th nowrap="nowrap">商户编号/商户名称</th>
							<th nowrap="nowrap">子商户号/子商户名称</th>
							<th nowrap="nowrap">行业</th>
							<th nowrap="nowrap">支付类型</th>
							<th nowrap="nowrap">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ChannelMerchList }" var="item"
							varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"
											value="${item.UUID }" /></span>
									</div>
								</td>
								<td nowrap="nowrap">${item.UUID}</td>
								<td nowrap="nowrap">${item.MerchId}</br>${item.TermId}</td>
								<td nowrap="nowrap">${item.ChMerchId}</br>${item.ChMerName}</td>
								<td nowrap="nowrap">${item.ChSubMerId}</br>${item.ChSubMerName}</td>
								<td nowrap="nowrap">${item.Business}</td>
								<td nowrap="nowrap">${item.payKind}</td>
								<td nowrap="nowrap"><a
									href="channelMerch/form?UUID=${item.UUID}"
									class="btn btn-xs btn-info user_edit" title="修改商户" target="tab"
									refresh="true"> <i class="fa fa-pencil"></i>修改
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty ChannelMerchList }">
							<tr class="odd gradeX">
								<td colspan="14" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>

				</table>

				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
