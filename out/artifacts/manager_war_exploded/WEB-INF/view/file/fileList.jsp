<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="widget box">
                
				<div class="widget-content  no-padding">
					<div class="row">
						<div class="col-md-12">
						<form id="uploadForm" action="file/upload" method="post" enctype="multipart/form-data">
							<table>
								 <tr>
									<td>
									<input type="hidden" name="path" value="${path}">
									<input type="file" class="form-control" id="uploadFile" name="uploadFile"></td>
									<td>
										<button type="button" class="btn btn-lg btn-info" onclick="upload()" style="margin-top:5px">
											上传&nbsp; <i class="fa fa-upload-alt"></i>
										</button> 
									</td>
									<td>
										&emsp;<span class="red" id="fileMessage"></span>
									</td>
								 </tr>
							</table>
						</form>
						</div>
					</div>
					
					<table class="table table-hover table-striped table-bordered table-highlight-head">
						<tbody>
							<c:forEach items="${fileList }" var="fileName" varStatus="status">
								<tr class="odd gradeX">
									<td>${fileName}</td>
									<td>
											<a href="file/download?fileName=${fileName }&path=${path}" class="btn btn-xs btn-info"><i class=" icon-download-alt"></i>下载</a>
										&emsp;
											<a href="file/delete?fileName=${fileName }&path=${path}" class="html-link btn btn-xs btn-info" target="ajax"><i class="fa fa-trash"></i>删除</a>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty fileList }">
								<tr class="odd gradeX">
									<td colspan="3" class="empty-list">没有文件.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				</div>

<script>
function upload() {
	if(!$("#uploadFile").val()){
		$("#fileMessage").html("请选择模板文件.");
		return;
	}
	$("#fileMessage").html("");
	showLoading();
	var sender = $("#uploadForm");
	sender.ajaxSubmit({
        type:'post',
        url:sender.attr("action"),
        dataType : "json",
        success:function(response){
        	hideLoading();
        	if(response.code == successCode){
        		showSuccessNotice("模板文件上传成功.");
	        	loadHtml("file/index"); 
        	}else{
        		showErrorNotice("模板文件上传失败.");
        	}
        },
        error:function(response){
        	hideLoading();
        }
	});
	}
</script>