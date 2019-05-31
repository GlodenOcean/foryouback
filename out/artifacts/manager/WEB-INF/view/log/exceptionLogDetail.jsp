
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" id="close-btn" class="close" data-dismiss="modal">×</button>
	<h5 class="modal-title">
		<i class="fa fa-warning"></i>&nbsp;异常完整信息
	</h5>
</div>
<div class="modal-body" style="background-color: #F0F2F9">
	<div class="row">
		<div class="col-md-12" style="background-color: #F0F2F9">
					${exceptionLog.throwMessage};
				
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn" data-dismiss="modal">关闭</button>
</div>
