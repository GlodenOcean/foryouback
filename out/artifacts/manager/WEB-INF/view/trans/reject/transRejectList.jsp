<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>交易拒绝信息
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<form id="formexport" enctype="multipart/form-data">
						<input type="file" id="permissExport" name="fileexport"
							style="display: none;" accept=".xls,.xlsx"
							onchange="fileup(this)" />
					</form>
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="transReject/search" method="post"
						class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="MerchId" value="${MerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">商户订单号</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="MerchOrderNo" value="${MerchOrderNo }"></td>
								<td nowrap="nowrap" class="col-md-1">支付类型</td>
								<td class="col-md-3"><select name="PayType" id="PayType"
									class="form-control">
										<option value="">所有</option>
										<c:forEach items="${payTypeEnumList }" var="payTypeEnum">
											<option value="${payTypeEnum.value }"
												${payTypeEnum.value eq PayType ? 'selected' : '' }>${payTypeEnum.desc}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">起始时间</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control date-picker" id="startCreateTime"
									name="startCreateTime" type="text" value="${startCreateTime }"
									readonly="readonly"></td>
								<td nowrap="nowrap" class="col-md-1">截止时间</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control date-picker" id="endCreateTime" name="endCreateTime"
									type="text" value="${endCreateTime }" readonly="readonly"></td>
								<td nowrap="nowrap" class="col-md-1">错误码</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="RejectCode"
									value="${RejectCode }"></td>

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
							<th nowrap="nowrap" style="width: 50px">序号</th>
							<th nowrap="nowrap">前端商户号</th>
							<th nowrap="nowrap">商户订单号</th>
							<th nowrap="nowrap">支付类型</th>
							<th nowrap="nowrap">错误码</th>
							<th nowrap="nowrap">拒绝原因</th>
							<th nowrap="nowrap">交易金额</th>
							<th nowrap="nowrap">交易名称</th>
							<th nowrap="nowrap">交易时间</th>
							<th nowrap="nowrap">发送机构</th>
							<th nowrap="nowrap">受理机构</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${transRejectList }" var="item"
							varStatus="status">
							<tr>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}</td>
								<td>${item.MerchOrderNo}</td>
								<td><c:forEach items="${payTypeEnumList }"
										var="payTypeEnum">
										<c:if test="${item.PayType eq payTypeEnum.value }">
											${fn:substring(payTypeEnum.desc,0,8)}
										</c:if>
									</c:forEach></td>
								<td>${item.RejectCode}</td>
								<td>${item.RejectMessage}</td>
								<td>${item.Amount}</td>
								<td>${item.TransName}</td>
								<td>${item.trans_date}${item.trans_time}</td>
								<td>${item.SendInst}</td>
								<td>${item.AccInst}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty transRejectList }">
							<tr class="odd gradeX">
								<td colspan="13" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>

				</table>

				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
