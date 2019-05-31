
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="modal-header" style="background-color: #CC0000">
	<button type="button" id="close-btn" class="close" data-dismiss="modal"></button>
	<h5 class="modal-title">
		<i class="fa fa-warning"></i>&nbsp;错误
	</h5>
</div>
<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<form id="changePasswordForm" action="user/changePassword" class="form-horizontal">
				<div class="form-body" style="color:#CC0000">
					<strong><i class="fa  fa-bug"></i> 请求的页面发生错误,无法正常显示内容,请联系管理员.</strong>
				</div>
			</form>
				
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn" data-dismiss="modal">确 定</button>
</div>

