<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


			<div class="widget box" style="min-height: 450px" >
	                <div class="widget-header">
	                  <h4>
	                    <i class="fa fa fa-th-list"></i>终端关联表单
	                  </h4>
	                </div>
	               <div class="widget-content">
			 			<form id="terminalLinkImportForm" action="link/batchImport" class="form-horizontal">
							<div class="form-body">
								
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label class="col-md-4 control-label">
												&nbsp;
											</label>
											<div class="col-md-7">
											<span class="red">请仔细检查文件内容是否正确,返回错误行数最大为50行。</span>
											</div>
										</div>
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label class="col-md-4 control-label">文件<span class="red">*</span></label>
											<div class="col-md-7">
												<input type="file" name="uploadFile" id="uploadFile" class="form-control"/>
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label class="col-md-4 control-label">&nbsp;</label>
											<div class="col-md-7">
												<a href="link/downloadTemplate" class="btn btn-info" target="_blank">
													<i class="fa fa-download"></i>下载模板[终端关联批量模板.csv]
												</a>
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label class="col-md-4 control-label">&nbsp;</label>
											<div class="col-md-7">
												<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
												<button type="button" onclick="makSure()" class="btn btn-success">确定</button>
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</form>
				   </div>
			</div>
			
<div class="modal fade" id="error-modal">
	<div class="modal-dialog" style="width:60%;">
		<div class="modal-content" id="error-modal-body">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
			          ×
			    </button>
				<h5 class="modal-title" style="color:#E10601">
					导入失败,终端信息或业务规则名称不匹配,具体如下					
				</h5>
			</div>
			<div class="modal-body">
				<table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
					<thead>
						<tr>
							<th>所在行</th>
							<th>机构号</th>
							<th>商户号</th>
							<th>终端号</th>
							<th>规则名称</th>
						</tr>
					</thead>
					<tbody id="errorListTableBody">
					
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">关 闭</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function makSure(){
		if($("#uploadFile").val() == ""){
			bootbox.alert("请选择一个文件.");
			return;
		}
		
		ajaxUpload($("#terminalLinkImportForm"), function(response){
        	hideLoading();
        	if(response.code == successCode){
        		$("#backBtn").click();
        		showSuccessNotice(response.message);
        	}else{
        		showErrorList(response.data);
        	}
        });
}

function showErrorList(errorList){
	if(errorList && errorList.length > 0){
		var errorListTableBody = $("#errorListTableBody");
		errorListTableBody.html("");
		for(var i = 0;i < errorList.length; i++){
			var tr = "<tr>"
			tr += "<td>" + errorList[i].lineNumber + "</td>";
			tr += "<td>" + errorList[i].instNo + "</td>";
			tr += "<td>" + errorList[i].merchId + "</td>";
			tr += "<td>" + errorList[i].termId + "</td>";
			tr += "<td>" + errorList[i].busiName + "</td>";
			tr += "</tr>";
			errorListTableBody.append(tr);
		}
		$("#error-modal").modal();
	}
}

</script>
