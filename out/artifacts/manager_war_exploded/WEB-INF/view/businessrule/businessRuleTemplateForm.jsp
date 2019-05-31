
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header">
				<button type="button" id="close-btn" class="close" data-dismiss="modal">×</button>
				<h5 class="modal-title">
					<i class="fa fa-lock"></i>&nbsp;新增规则模板
				</h5>
			</div>
			<div class="modal-body">
				<div class="row">
						<form id="ruleTemplateForm" action="businessrule/${operation}" class="form-horizontal">
							<input type="hidden" value="${vo.UUID }" id="uuid" name="template.UUID"/>
							<input type="hidden" value="${vo.busiID }" name="template.busiID"/>
							<input type="hidden" value="${vo.upBusiID }" id="upBusiID" name="template.upBusiID"/>
							<input type="hidden" value="${operation }" id="operation"/>
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">规则名称<span class="red">*</span></label>
									<div class="col-md-7">
										<input name="template.busiName" id="busiName" class="form-control" type="text" value="${vo.busiName }">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">子节点合并方法<span class="red">*</span></label>
									<div class="col-md-7">
										<input name="template.childType" id="childType" class="form-control" type="text" value="${vo.childType }">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">执行脚本</label>
									<div class="col-md-7">
										<textarea name="template.luaBusiness" id="luaBusiness" class="form-control"  style="height:200px" data-placement="top" title="模板格式：[参数,比较符,值@...]{模板文件名}DB:LUA...">${vo.luaBusiness }</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">说明</label>
									<div class="col-md-7">
										<input name="template.remark" id="remark" class="form-control" type="text" value="${vo.remark }">
									</div>
								</div>
							</div>
						</form>
							
					</div>
				</div>
			<div class="modal-footer">
				<button type="button" id="close-btn" class="btn" data-dismiss="modal">关 闭</button>
				<button type="button" class="btn btn-info" onclick="makeSure();">确定</button>
			</div>
<script>

function onPageLoaded(){
	$("#luaBusiness").tooltip({html : true });
}

	function makeSure(){
		if(validate() == true){
			formAjaxRequest("ruleTemplateForm", function(resp){
				
					$("#close-btn").click();
					//调用businessRuleTemplate.jsp里的函数
					var operation = $("#operation").val();
					var parentId = $("#upBusiID").val();
					if(operation == "addTemplate"){
						if(parentId == "-1"){
							addTemplateNodeToRoot(resp.data);
						}else{
							addChildrenTemplateNode(resp.data);
						}
					}else{
						reAsyncTemplateForUpdate(resp.data);
					}
			});
		}
	}
	
	function validate(){
		var busiName = {senderId:"busiName",ruler:{require:true}};
		var childType = {senderId:"childType",ruler:{require:true}};
		var array = [busiName,childType];
		return $ES.validate(array);
	}
</script>