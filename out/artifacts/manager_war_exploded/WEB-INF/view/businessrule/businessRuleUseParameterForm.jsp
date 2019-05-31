<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="modal-header">
	<button type="button" id="close-btn" class="close" data-dismiss="modal" >×</button>
	<h5 class="modal-title">
		<i class="fa fa-lock"></i>&nbsp;规则参数配置
	</h5>
</div>
<div class="modal-body">
	<div class="row">
			
			<form id="ruleForm" action="businessrule/saveByParameter" class="form-horizontal">
				<input type="hidden" value="${businessRule.UUID }" name="businessRule.UUID"/>
				<input type="hidden" value="${businessRule.upBusiID }" name="businessRule.upBusiID"/>
				<input type="hidden" value="${businessRule.luaBusiness }" name="businessRule.luaBusiness"/>
				<input type="hidden" value="${operator }" id="operator" />			
				
			<div class="form-body">
				<div class="form-group">
					<label class="col-md-3 control-label">规则名称<span class="red">*</span></label>
					<div class="col-md-7">
						<input class="form-control" id="busiName" name="businessRule.busiName" type="text" value="${businessRule.busiName }">
					</div>
						<c:if test="${operation == 'update' }">
											<label class="control-label">(${businessRule.busiNo })</label>
									</c:if>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">子节点合并方法<span class="red">*</span></label>
					<div class="col-md-7">
						<input name="businessRule.childType" id="childType" class="form-control" type="text" value="${businessRule.childType }">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">说明</label>
					<div class="col-md-7">
						<input name="businessRule.remark" id="remark" class="form-control" type="text" value="${businessRule.remark }">
					</div>
				</div>
				
					<c:forEach items="${parameterList }" var="parm">
						<div class="form-group">
							<input type="hidden" value="${parm.name }" name="parameterName" />
							<label class="col-md-3 control-label">${parm.name }</label>
							<div class="col-md-3">
								<select name="compareChar" class="form-control">
								<c:forEach items="${luaCompareCharList }" var="luaChar">
									<option value="${luaChar.key }" ${parm.compareChar == luaChar.key ? 'selected' : '' } >${luaChar.value}</option>
								</c:forEach>
								</select>
							</div>	
							<div class="col-md-4">
								<input name="parameterValue" class="form-control" type="text" value="${parm.value }" >
							</div>
						</div>
					</c:forEach>
					
					<c:if test="${fileName != null && fileName != ''}">
						
							<c:choose>
								<c:when test="${fn:startsWith(fileName,'F-') }">
									<div class="form-group">
										<label class="col-md-3 control-label">模板文件</label>
										<div class="col-md-7">
											<a href="file/downloadLua?fileName=${fileName}" class="btn btn-info">
												<i class="icon-download-alt"></i>下载[${fileName }]
											</a>
											<br/>
											<span class="red">重新上传会覆盖</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">重新上传</label>
										<div class="col-md-7">
											<input name="luaFile" id="luaFile" class="form-control" type="file">
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-group">
										<label class="col-md-3 control-label">模板文件</label>
										<div class="col-md-7">
											<input name="luaFile" id="luaFile" class="form-control" type="file">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">&nbsp;</label>
										<div class="col-md-7">
											<a href="file/download?fileName=${fileName}" class="btn btn-info">
												<i class="icon-download-alt"></i>下载模板[${fileName }]
											</a>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:if>
					
			</div>
		</form>
			
	</div>
</div>

<div class="modal-footer">
	<button type="button" id="close-btn" class="btn" data-dismiss="modal">关 闭</button>
	<button type="button" class="btn btn-info" onclick="startSave();">确定</button>
</div>

<script>
	function startSave(){
		if(validate()){
			showLoading();
			var sender = $("#ruleForm");
			sender.ajaxSubmit({
		        type:"post",
		        url:sender.attr("action"),
		        dataType : "json",
		        success:function(response){
		        	hideLoading();
		        	if(response.code == successCode){
		        		$("#close-btn").click();
		        		if($("#operator").val() == "update"){
		        			reAsyncForUpdate(response.data);
		        		}else{
		        			addChildrenNode(response.data);
		        		}
		        	}else{
		        		showErrorNotice(response.message);
		        	}
		        },
		        error:function(response){
		        	hideLoading();
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