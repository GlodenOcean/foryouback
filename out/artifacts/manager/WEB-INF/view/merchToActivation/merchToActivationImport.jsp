<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


			<div class="widget box" style="min-height: 450px" >
	                <div class="widget-header">
	                  <h4>
	                    <i class="fa fa fa-th-list"></i>批量导入非接激活
	                  </h4>
	                </div>
	               <div class="widget-content">
			 			<form id="merchToActivationImportForm" action="merchToActivation/batchImport" class="form-horizontal">
							<div class="form-body">
								
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label class="col-md-4 control-label">
												&nbsp;
											</label>
											<div class="col-md-7">
											<span class="red">请仔细检查文件内容是否正确。</span>
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
												<a href="merchToActivation/downloadTemplate" class="btn btn-info" target="_blank">
													<i class="fa fa-download"></i>下载模板[激活模板.csv]
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
			

<script type="text/javascript">

function makSure(){
		if($("#uploadFile").val() == ""){
			bootbox.alert("请选择一个文件.");
			return;
		}
		
		ajaxUpload($("#merchToActivationImportForm"), function(response){
        	hideLoading();
        	$("#backBtn").click();
    		showSuccessNotice(response.message);
        });
}
</script>
