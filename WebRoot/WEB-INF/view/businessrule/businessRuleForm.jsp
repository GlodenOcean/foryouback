
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header">
				<button type="button" id="close-btn" class="close" data-dismiss="modal" >×</button>
				<h5 class="modal-title">
					<i class="fa fa-lock"></i>&nbsp;${operation == 'add' ? '新增' : '修改'}规则
				</h5>
			</div>
			<div class="modal-body">
				<div class="row">
						<form id="ruleForm" action="businessrule/${operation}" class="form-horizontal">
							<input type="hidden" value="${businessRule.UUID }" id="uuid" name="br.UUID"/>
							<input type="hidden" value="${businessRule.busiID }" name="br.busiID"/>
							<input type="hidden" value="${businessRule.upBusiID }" id="upBusiID" name="br.upBusiID"/>
							<input type="hidden" value="${operation }" id="operation"/>
							<input type="hidden" value="${isProductNode }" id="isProductNode"/>
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">规则名称<span class="red">*</span></label>
									<div class="col-md-7">
										<c:if test="${operation == 'add' }">
											<c:if test="${isProductNode eq true}">
												<input type="hidden"  name="br.busiName" id="busiName" value="default" />
												<select name="br.busiNo" id="busiNo" class="form-control">
													<c:forEach items="${productList }" var="item">
														<option value="${item.busi_no }">${item.busi_name }</option>
													</c:forEach>
												</select>
											</c:if>
											<c:if test="${isProductNode eq false}">
												<input name="br.busiName" id="busiName" class="form-control" type="text" value="${businessRule.busiName }">
											</c:if>
										</c:if>
										<c:if test="${operation == 'update' }">
											<input name="br.busiName" id="busiName" class="form-control" type="text" value="${businessRule.busiName }">
										</c:if>
										
									</div>
									<c:if test="${operation == 'update' }">
											<label class="control-label">(${businessRule.busiNo })</label>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">子节点合并方法<span class="red">*</span></label>
									<div class="col-md-7">
										<input name="br.childType" id="childType" class="form-control" type="text" value="${businessRule.childType }">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">执行脚本</label>
									<div class="col-md-7">
										<textarea class="form-control" name="br.luaBusiness" id="luaBusiness"  style="height:200px">${businessRule.luaBusiness }</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">说明</label>
									<div class="col-md-7">
										<input name="br.remark" id="remark" class="form-control" type="text" value="${businessRule.remark }">
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
	function makeSure(){
		if(validate() == true){
			formAjaxRequest("ruleForm", function(resp){
					$("#close-btn").click();
					//调用businessRuleList.jsp里的函数
					var operation = $("#operation").val();
					var parentId = $("#upBusiID").val();
					console.log(operation);
					if(operation == "add"){
						if(parentId == "0"){
							addNodeToRoot(resp.data);
						}else{
							addChildrenNode(resp.data);
						}
					}else{
						if($("#isProductNode").val() == "true"){
							initTree();							
						}else{
							reAsyncForUpdate(resp.data);
						}
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