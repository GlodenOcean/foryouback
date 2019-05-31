
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">
          ×
    </button>
	<h5 class="modal-title">
		<i class="fa fa-lock"></i>&nbsp;重置用户密码
	</h5>
</div>
<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<form id="changePasswordForm" action="user/resetPassword" class="form-horizontal" target="ajax">
				<div class="form-body">
					<input type="hidden" name="id" value="${userId }"/>
					<div class="form-group">
						<label class="col-md-3 control-label">新密码<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="newPassword" id="newPassword" class="form-control" type="password" maxlength="16">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">确认新密码<span class="red">*</span></label>
						<div class="col-md-7">
							<input name="cfmNewPassword" id="cfmNewPassword" class="form-control" type="password" maxlength="16">
						</div>
					</div>
				</div>
			</form>
				
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" id="close-btn" class="btn" data-dismiss="modal">关 闭</button>
	<button type="button" class="btn btn-info" onclick="changePassword();">确 定</button>
</div>

<script>

	function changePassword(){
		if(validate()){
			$("#changePasswordForm").submit();
		}
	}
	
	function validate(){
		
		var newPassword = {senderId:"newPassword",ruler:{require:true,maxLength:16,minLength:6}};
		var cfmNewPassword = {senderId:"cfmNewPassword",ruler:{require:true}};
		var array = [newPassword,cfmNewPassword];
		if($ES.validate(array)){
			var newPasswordInput = $("#newPassword");
			var cfmNewPasswordInput = $("#cfmNewPassword");
			if(newPasswordInput.val() != cfmNewPasswordInput.val()){
				showError(cfmNewPasswordInput,"确认新密码不一致");
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
	}
	
</script>
