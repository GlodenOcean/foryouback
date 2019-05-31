<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<font style="text-align: center; color: red">风险排查时间请在模板里面设置好(如下图)</font>
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<form id="formexport" enctype="multipart/form-data">
						<input type="file" id="fileexport" name="fileexport"
							style="display: none;" accept=".xls,.xlsx"
							onchange="fileup(this)" />
					</form>
				</div>

				<img alt="" src="build/custom/images/riskTrade.png">
				
				<div class="button-group">

					<a href="order/downloadModel" id="downloadModel"
						class="delete-link btn btn-xs btn btn-xs btn-info"><i class="fa fa-plus"></i>下载风险排查模板</a>
					<!-- 批量导入 -->
					<a href="javascript:;" onclick="exportfile()" id="merch_export"
						class="delete-link btn btn-xs btn btn-xs btn-info" refresh="true"><i
						class="fa fa-plus"></i>批量导入需要排查的识别码</a>
					<!-- 批量导入模板 -->
					<a href="order/getRiskTradeInfo" id="getRiskTradeInfo" target="_blank"></a>

				</div>


				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
<script>
	$("#startTime").datetimepicker({
		format : 'YYYY-MM-DD'
	});
	$("#endTime").datetimepicker({
		format : 'YYYY-MM-DD'
	});
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
			url : 'order/riskTrade',
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(resp) {
				var path = "order/getRiskTradeInfo?fileName=" + resp.data.fileName;
				dowmload(path);
			},
			error : function(returndata) {
				alert(returndata.message);
			}
		});
	}
	function dowmload(path) {
		var down = $("#getRiskTradeInfo");
		down.attr("href", path);
		down[0].click();
	}
</script>