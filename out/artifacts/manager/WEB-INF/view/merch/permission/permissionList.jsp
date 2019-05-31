<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>商户权限列表
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
					<form class="searchForm" action="permission/search" method="post"
						class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="MerchId" value="${MerchId }"></td>
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
					<a href="permission/form" id="merch_add"
						class="html-modal btn btn-xs" target="tab" refresh="true"><i
						class="fa fa-plus"></i>添加</a>
					<!-- 使用title会弹出确认框 -->
					<a href="permission/delete" id="merch_del"
						class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?"><i
						class="fa fa-plus"></i>删除</a>
					<!-- 批量导入模板 -->
					<a href="permission/download" class="btn btn-xs btn-info"><i
						class=" icon-download-alt"></i>下载导入模板</a>
					<!-- 批量导入 -->
					<a href="javascript:;" onclick="exportfile()" id="merch_export"
						class="delete-link btn btn-xs" refresh="true"><i
						class="fa fa-plus"></i>批量导入商户</a>
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
							<th>前端商户号</th>
							<th>微信扫码支付</th>
							<th>微信公众号支付</th>
							<th>支付宝扫码支付</th>
							<th>银联刷卡支付</th>
							<th>银联扫码支付</th>
							<th>单笔限额</th>
							<th>日限额</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${permissionList }" var="item"
							varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"
											value="${item.UUID }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}</td>
								<td><c:if test="${item.wx011Perm == '0' }">
										<span class="label label-warning"> 关闭 </span>
									</c:if> <c:if test="${item.wx011Perm == '1' }">
										<span class="label label-success"> 打开 </span>
									</c:if></td>
								<td><c:if test="${item.wx014Perm == '0' }">
										<span class="label label-warning"> 关闭 </span>
									</c:if> <c:if test="${item.wx014Perm == '1' }">
										<span class="label label-success"> 打开 </span>
									</c:if></td>
								<td><c:if test="${item.ali009Perm == '0' }">
										<span class="label label-warning"> 关闭 </span>
									</c:if> <c:if test="${item.ali009Perm == '1' }">
										<span class="label label-success"> 打开 </span>
									</c:if></td>
								<td><c:if test="${item.uni025Perm == '0' }">
										<span class="label label-warning"> 关闭 </span>
									</c:if> <c:if test="${item.uni025Perm == '1' }">
										<span class="label label-success"> 打开 </span>
									</c:if></td>
								<td><c:if test="${item.uni026Perm == '0' }">
										<span class="label label-warning"> 关闭 </span>
									</c:if> <c:if test="${item.uni026Perm == '1' }">
										<span class="label label-success"> 打开 </span>
									</c:if></td>
								<td><fmt:formatNumber value="${item.SingleLimitAmount}"
										pattern="#0.##" minFractionDigits="2">
									</fmt:formatNumber></td>
								<td><fmt:formatNumber value="${item.DailyLimitAmount}"
										pattern="#0.##" minFractionDigits="2">
									</fmt:formatNumber></td>
								<td><a href="permission/form?UUID=${item.UUID}"
									class="btn btn-xs btn-info user_edit" title="修改商户池"
									target="tab" refresh="true"> <i class="fa fa-pencil"></i>修改
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty permissionList }">
							<tr class="odd gradeX">
								<td colspan="5" class="empty-list">暂无相关结果.</td>
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
	//	打开选择导入数据的页面
	function exportfile() {
		$("#permissExport").click();
	}
	// 上传选中文件
	function fileup(obj) {
		//获取文件类型
		var filetype = obj.value.substr(obj.value.lastIndexOf("."))
				.toLowerCase();
		if (filetype != ".xls" && filetype != ".xlsx") {
			alert("文件格式不对");
			return;
		}
		var formData = new FormData($("#formexport")[0]);
		$.ajax({
			url : 'permission/importExcel',
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(returndata) {
				alert(returndata.message);
			},
			error : function(returndata) {
				alert(returndata.message);
			}
		});
	}
</script>