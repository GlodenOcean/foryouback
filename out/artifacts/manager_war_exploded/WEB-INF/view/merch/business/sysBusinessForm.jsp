<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>行业信息
		</h4>
	</div>
	<div class="widget-content">
	<div class="row">
			<form id="sysBusinessForm" action="sysBusiness/${operation }" class="form-horizontal" target="ajax">
			
				<input type="hidden" id="operation" value="${operation }" />
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">行业<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="sysBusiness.Business" id="Business" class="form-control" type="text" value="${sysBusiness.Business }" maxlength="128" >
						</div>
						<label class="control-label col-md-2">交易时段<span class="red">*</span></label>
						<div class="col-md-3">
							<select name="sysBusiness.Period" id="Period" class="form-control">
								<option value="白天" >白天</option>
								<option value="夜间" >夜间</option>
								<option value="全天" >全天</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">开始时间段<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="sysBusiness.StartTime" id="StartTime" class="form-control" type="text" value="${sysBusiness.StartTime }" maxlength="128" >
						</div>
						<label class="control-label col-md-2">结束时间段<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="sysBusiness.EndTime" id="EndTime" class="form-control" type="text" value="${sysBusiness.EndTime }" maxlength="128" >
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最小金额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="sysBusiness.MinAmount" id="MinAmount" class="form-control" type="text" value="${sysBusiness.MinAmount }" maxlength="128" >
						</div>
						<label class="control-label col-md-2">最大金额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="sysBusiness.MaxAmount" id="MaxAmount" class="form-control" type="text" value="${sysBusiness.MaxAmount }" maxlength="128" >
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success" onclick="sysBusinessFrom()">确定</button>
	</div>
</div>
<script>

function sysBusinessFrom(){
	$("#sysBusinessForm").submit();
}
</script>