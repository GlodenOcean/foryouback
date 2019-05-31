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
					<form class="searchForm" action="order/search" method="post"
						class="form-inline" target="tab">
						<table class="search-table">
							<tr>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="MerchId" id="MerchId"
									value="${MerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">前端订单号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="OrderNo" id="OrderNo"
									value="${OrderNo }"></td>
								<td nowrap="nowrap" class="col-md-1">外部订单号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="MerchOrderNo"
									id="MerchOrderNo" value="${MerchOrderNo }"></td>
							</tr>
							<tr>

								<td nowrap="nowrap" class="col-md-1">交易金额</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="Amount" id="Amount"
									value="${Amount }"></td>
								<td nowrap="nowrap" class="col-md-1">渠道编号</td>
								<td nowrap="nowrap" class="col-md-3"><select name="ChId"
									id="ChId" class="form-control">
										<option value="">无指定</option>
										<c:forEach items="${channelTypeEnum }" var="channelType">
											<option value="${channelType.value }"
												${ChId eq channelType.value ? 'selected' : '' }>${channelType.desc}</option>
										</c:forEach>
								</select></td>
								<td nowrap="nowrap" class="col-md-1">发送机构号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="SendInst" id="SendInst"
									value="${SendInst }"></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">起始订单时间</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" id="startCreateTime"
									name="startCreateTime" type="text" value="${startCreateTime }"
									readonly="readonly"></td>
								<td nowrap="nowrap" class="col-md-1">截止订单时间</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" id="endCreateTime" name="endCreateTime"
									type="text" value="${endCreateTime }" readonly="readonly"></td>
								<td nowrap="nowrap" class="col-md-1">交易状态</td>
								<td nowrap="nowrap" class="col-md-3"><select
									id="OrderStatus" name="OrderStatus" class="form-control">
										<option value="">全部</option>
										<option value="99" ${OrderStatus == '99' ? 'selected' : '' }>结果未知</option>
										<option value="00" ${OrderStatus == '00' ? 'selected' : '' }>支付成功</option>
										<option value="01" ${OrderStatus == '01' ? 'selected' : '' }>支付失败</option>
								</select>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">支付类型</td>
								<td nowrap="nowrap" class="col-md-3"><select name="PayType"
									id="PayType" class="form-control">
										<option value="">所有</option>
										<c:forEach items="${payTypeEnumList }" var="payTypeEnum">
											<option value="${payTypeEnum.value }"
												${payTypeEnum.value eq PayType ? 'selected' : '' }>${payTypeEnum.desc}</option>
										</c:forEach>
								</select></td>
								<td nowrap="nowrap" class="col-md-1">付款凭证码</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="PayCretNum"
									id="PayCretNum" value="${PayCretNum }">
									</td>
									<td nowrap="nowrap" class="col-md-1">渠道商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="ChMerchId" id="ChMerchId"
									value="${ChMerchId }"></td>
								<td nowrap="nowrap">
									<button type="submit" class="btn green-haze">
										<i class="icon-search"></i>&nbsp;搜索
									</button>
								</td>
							</tr>
							<tr>
								<td class="col-md-1">交易笔数：</td>
								<td class="col-md-3"><span class="red">${countSuccessTrans }笔</span></td>
								<td class="col-md-1">交易金额：</td>
								<td class="col-md-3"><span class="red">￥${sumSuccessMoney }
										元</span></td>
								<td class="col-md-1">手续费：</td>
								<td class="col-md-3"><span class="red">￥${sumFeeMoney }
										元</span></td>
							</tr>


						</table>
					</form>
				</div>
				<!-- 操作按钮 -->
				<div class="button-group">
					<div class="button-group">
						<label style="margin-left: 30px; margin-top: 5px;"><font
							color="red">温馨提示：只保留近33天的数据！</font></label>
						<%-- <a
							href="order/exportOrder?type=1&startCreateTime=${startCreateTime }&endCreateTime=${endCreateTime }&MerchId=${MerchId }&OrderNo=${OrderNo }&MerchOrderNo=${MerchOrderNo }&BussID=${BussID}&OrderStatus=${OrderStatus}&PayType=${PayType}"><i
							class="fa fa-file-excel-o"></i>导出明细</a> --%>
						<button onclick="exportData()">导出明细</button>
						<a href="order/download" id="downloadA" target="_blank"></a>
					</div>
				</div>
				<table
					class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
					<thead>
						<tr>
							<th nowrap="nowrap" style="width: 2%">序号</th>
							<th nowrap="nowrap" style="width: 10%">商户号/商户名称</th>
							<th nowrap="nowrap" style="width: 10%">订单号</th>
							<th nowrap="nowrap" style="width: 8%">支付类型</th>
							<th nowrap="nowrap" style="width: 8%">交易金额</th>
							<th nowrap="nowrap" style="width: 4%">手续费</th>
							<th nowrap="nowrap" style="width: 20%">路由描述</th>
							<th nowrap="nowrap" style="width: 6%">交易状态</th>
							<th nowrap="nowrap" style="width: 12%">交易时间/支付日期</th>
							<th nowrap="nowrap" style="width: 8%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dayOrderList }" var="item" varStatus="status">
							<tr>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}<br>${item.MerchName}</td>
								<%-- <td><c:forEach items="${InstOnlineList }" var="instOnline">
										<c:if test="${instOnline.AccountNo eq item}">
											<font color="red">${accountInst.Balance}</font>元
										</c:if>
									</c:forEach></td> --%>
								<td>${item.OrderNo}</td>
								<td><c:forEach items="${payTypeEnumList }"
										var="payTypeEnum">
										<c:if test="${item.PayType eq payTypeEnum.value }">
											<c:choose>
												<c:when test="${fn:contains(item.ChTransName, '爱农')}">
													${fn:substring(item.ChTransName,2,8)}
												</c:when>
												<c:otherwise> ${item.ChTransName}</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach></td>
								<td>${item.Amount}</td>
								<td>${item.Fee}</td>
								<td width="80px;">${item.RuleError}</td>
								<td><c:if test="${item.OrderStatus == '99' }">
										<span class="label label-info">结果未知</span>
									</c:if> <c:if test="${item.OrderStatus == '00' }">
										<span class="label label-success">支付成功</span>
									</c:if> <c:if test="${item.OrderStatus == '01' }">
										<span class="label label-danger">支付失败</span>
									</c:if> <c:if test="${item.OrderStatus == '02' }">
										<span class="label label-warning">已撤销</span>
									</c:if> <c:if test="${item.OrderStatus == '03' }">
										<span class="label label-success">已退货</span>
									</c:if></td>
								<td><fmt:formatDate value="${item.TransTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /><br>${item.PayTime}</td>
								<td><a href="order/form?orderNo=${item.OrderNo}"
									class="btn btn-xs btn-info user_edit" title="查看订单详情"
									target="tab" refresh="true"> <i class="fa fa-pencil"></i>查看
								</a> &nbsp;<a href="order/queryOrder?orderNo=${item.OrderNo}"
									class="btn btn-xs btn-info user_edit" title="查询" target="ajax"
									refresh="true"> <i class="fa fa-success"></i>查询结果
								</a> <c:if test="${item.OrderStatus == '00' }">&nbsp;<a
											href="order/frozen?orderNo=${item.OrderNo}&type=F"
											class="btn btn-xs btn-info user_edit" title="冻结"
											target="ajax" refresh="true"> <i class="fa fa-pencil"></i>冻结
										</a>
									</c:if></td>
							</tr>
						</c:forEach>
						<c:if test="${empty dayOrderList }">
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

	function exportData() {
		$.ajax({
			url : "order/exportOrder?type=1&startCreateTime="
					+ $("#startCreateTime").val() + "&endCreateTime="
					+ $("#endCreateTime").val() + "&MerchId="
					+ $("#MerchId").val() + "&OrderNo=" + $("#OrderNo").val()
					+ "&MerchOrderNo=" + $("#MerchOrderNo").val()
					+ "&SendInst=" + $("#SendInst").val() + "&OrderNo="
					+ $("#OrderNo").val() + "&Amount=" + $("#Amount").val()
					+ "&ChId=" + $("#ChId").val() + "&OrderNo="
					+ $("#PayCretNum").val() + "&OrderStatus="
					+ $("#OrderStatus").val() + "&PayType="
					+ $("#PayType").val(), //处理页面的路径
			type : "POST", //提交方式
			success : function(resp) { //回调函数 ,成功时返回的数据存在形参data里
				dowmload("order/download?fileName=" + resp.data.filePath);
			}
		});
	}
	function dowmload(path) {
		var down = $("#downloadA");
		down.attr("href", path);
		down[0].click();
	}
</script>