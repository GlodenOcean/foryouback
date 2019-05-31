<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
	          ×
	    </button>
		<h5 class="modal-title">
			<i class="fa fa-file-text-o"></i>&nbsp;${role == null ? '添加角色' : '修改角色' }
		</h5>
	</div>
	<div class="modal-body">
		<div class="row">
				<form id="roleForm" action="role/${operation }" class="form-horizontal" target="ajax">
					<input type="hidden" id="operation" value="${operation }" />
					<div class="form-body">
						<input type="hidden" name="role.id" id="roleId" value="${role.id }"/>
						<div class="form-group">
							<label class="col-md-3 control-label">角色名称<span class="red">*</span></label>
							<div class="col-md-6">
								<input name="role.roleName" id="roleName" class="form-control" type="text" value="${role.roleName }" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">描述</label>
							<div class="col-md-6">
								<textarea class="form-control" name="role.description" id="description">${role.description }</textarea>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	<div class="modal-footer">
		<button type="button" class="btn" data-dismiss="modal" id="closeBtn">关 闭</button>
		<button type="button" class="btn btn-success" id="okBtn" onclick="updateRole();">确定</button>
	</div>
<script>
	function updateRole(){
		var roleNameRuler = {senderId:"roleName",ruler:{require:true}};
		if($ES.validate([roleNameRuler])){
			$("#roleForm").submit();
		}
	}
	
</script>