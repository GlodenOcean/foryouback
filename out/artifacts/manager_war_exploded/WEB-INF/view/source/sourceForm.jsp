
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">
          ×
    </button>
	<h5 class="modal-title">
		<i class="fa fa-lock"></i>&nbsp;${operation == 'add' ? '新增' : '修改' }资源
	</h5>
</div>

<div class="modal-body">
	<div class="row">
			<form id="sourceForm" action="source/update" class="form-horizontal">
				<input type="hidden" value="${vo.id }" name="source.id"/>
				<input type="hidden" value="${vo.parentId }" name="source.parentId" id="parentId"/>
				<input type="hidden" value="${operation}" id="operation"/>
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">资源名称<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="source.name" id="name" class="form-control" type="text" value="${vo.name }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">控件ID<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="source.controlId" id="controlId" class="form-control" type="text" value="${vo.controlId }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">数字升序<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="source.sort" id="sort" class="form-control" type="text" value="${vo.sort }" onkeyup="value=value.replace(/[^\d]/g,'')">
						</div>
					</div>
				</div>
			</form>
				
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn" id="close-btn" data-dismiss="modal">关 闭</button>
	<button type="button" class="btn btn-primary" onclick="makeSure();">确定</button>
</div>
<script>
	function makeSure(){
		if(validate()){
			formAjaxRequest("sourceForm", function success(resp){
					$("#close-btn").click();
					if($("#operation").val() == "add"){
						if($("#parentId").val() == ""){
							addNewNode(resp.data,true);
						}else{
							addNewNode(resp.data,false);
						}
					}else{
						var selectNode = getSelectedNode();
						selectNode.name = resp.data.name;
						selectNode.iconSkin = resp.data.iconSkin;
						sourceTree.updateNode(selectNode);
					}
			});
		}
	}
	
	function validate(){
		var name = {senderId:"name",ruler:{require:true}};
		var controlId = {senderId:"controlId",ruler:{require:true}};
		var sort = {senderId:"sort",ruler:{require:true}};
		var array = [name,controlId,sort];
		return $ES.validate(array);
	}
</script>