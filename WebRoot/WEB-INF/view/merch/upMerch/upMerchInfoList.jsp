<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>上级商戶列表
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">

					<form id="formexport" enctype="multipart/form-data">
						<input type="file" id="fileexport" name="fileexport"
							style="display: none;" accept=".xls,.xlsx"
							onchange="fileup(this)" />
					</form>
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="upMerch/search" method="post"
						class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td nowrap="nowrap" class="col-md-1">商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="MerchId" value="${MerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">商户名称</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="MerchName" value="${MerchName }"></td>
								<td nowrap="nowrap" class="col-md-1">子商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="SubMerchId" value="${SubMerchId }"></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="HiCardMerchId" value="${HiCardMerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">商户状态</td>
								<td nowrap="nowrap" class="col-md-3">
									<select name="MerchStatus" class="form-control">
										<option value="" >请选择</option>
										<option value="1" ${MerchStatus eq '1' ? 'selected' : '' }>启用</option>
										<option value="0" ${MerchStatus eq '0' ? 'selected' : '' }>禁用</option>
									</select>
								</td>
								<%-- <td nowrap="nowrap" class="col-md-1">子商户状态</td>
								<td nowrap="nowrap" class="col-md-3">
									<select name="SubMerchStatus" class="form-control">
										<option value="" >请选择</option>
										<option value="1" ${SubMerchStatus eq '1' ? 'selected' : '' }>启用</option>
										<option value="0" ${SubMerchStatus eq '0' ? 'selected' : '' }>禁用</option>
									</select></td> --%>
								<td nowrap="nowrap" class="col-md-1">同步状态</td>
								<td nowrap="nowrap" class="col-md-3">
									<select name="Synchronization" class="form-control">
										<option value="" >请选择</option>
										<option value="1" ${Synchronization eq '1' ? 'selected' : '' }>已同步</option>
										<option value="0" ${Synchronization eq '0' ? 'selected' : '' }>未同步</option>
									</select></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="col-md-1">子商户识别码</td>
								<td nowrap="nowrap" class="col-md-3"><input class="form-control"
									type="text" name="ChannelMerchNo" value="${ChannelMerchNo }"></td>
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
					<a href="upMerch/form" id="merch_add" class="html-modal btn btn-xs"
						target="tab" refresh="true"><i class="fa fa-plus" refresh="true"></i>添加</a>
					<!-- 使用title会弹出确认框 -->
					<a href="upMerch/delete" id="merch_del"
						class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?" refresh="true"><i
						class="fa fa-minus"></i>删除</a>
					<!-- 批量导入模板 -->
					<a href="upMerch/download"
						class="btn btn-xs btn-info"><i class=" icon-download-alt"></i>下载导入模板</a>
					<!-- 批量导入 -->
					<a href="javascript:;" onclick="exportfile()" id="merch_export"
						class="delete-link btn btn-xs" refresh="true"><i class="fa fa-plus"></i>批量导入商户</a>
					<!-- 批量同步 -->
					<a href="channelMerch/syncToChannelMerch" id="merch_del" 
						class="delete-link btn btn-xs" target="selectAjax" title="确定要同步到上级商户表?" refresh="true"><i
						class="fa fa-random"></i>批量同步到上级商户表</a>
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
							<th>商户编号/商户名称</th>
							<th>子商户号/子商户名称</th>
							<th>商户状态</th>
							<th>子商户状态</th>
							<th>商户简称</th>
							<th>是否同步</th>
							<th>子商户识别码</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${UpMerchInfoList }" var="item"
							varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"
											value="${item.UUID }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}</br>${item.MerchName}</td>
								<td>${item.SubMerchId}</br>${item.SubMerchName}</td>
								<td><c:if test="${item.MerchStatus != '1' }">
										<span class="label label-warning"> 禁用 </span>
									</c:if> <c:if test="${item.MerchStatus == '1' }">
										<span class="label label-success"> 启用 </span>
									</c:if></td>
								<td><c:if test="${item.SubMerchStatus != '1' }">
										<span class="label label-warning"> 禁用 </span>
									</c:if> <c:if test="${item.SubMerchStatus == '1' }">
										<span class="label label-success"> 启用 </span>
									</c:if></td>
								<td>${item.SimpleName}</td>
								<td><c:if test="${item.Synchronization ne '1' }">
										<span class="label label-warning"> 否 </span>
									</c:if> <c:if test="${item.Synchronization == '1' }">
										<span class="label label-success"> 是 </span>
									</c:if></td>
								<td>${item.ChannelMerchNo}</td>
								<td>
								</a> <a href="upMerch/form?UUID=${item.UUID}"
									class="btn btn-xs btn-info user_edit" title="修改商户" target="tab"
									refresh="true"> <i class="fa fa-pencil"></i>修改
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty UpMerchInfoList }">
							<tr class="odd gradeX">
								<td colspan="10" class="empty-list">暂无相关结果.</td>
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
		$("#fileexport").click();
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
			url : 'upMerch/importExcel',
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(returndata) {
				alert(returndata.message);loadHtml("upMerch/search");
			},
			error : function(returndata) {
				alert(returndata.message);
			}
		});
	}
	// 同步操作
	function synchronization(){
	 	AjaxRequest("upMerch/syncToChannelMerch", {}, function success(resp){
			alert("找不到以下渠道业务映射，请先添加以下商户业务类型："+resp.data.message);
		});
	}
</script>