<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>添加制定商户池
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="merchPoolMapForm" action="merchPoolMap/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">唯一序列号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPoolMap.SeqNo" id="SeqNo"
								class="form-control" type="text"
								value="${merchPoolMap.SeqNo }" maxlength="32"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">商户池标识序号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPoolMap.MerchPool" id="MerchPool"
								class="form-control" type="text"
								value="${merchPoolMap.MerchPool }" maxlength="128" >
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">选取条件<span
							class="red">*</span></label>
						<div class="col-md-8">
							<textarea rows="3" cols="50" name="merchPoolMap.ConditionX"
								id="ConditionX" class="form-control"
								>${merchPoolMap.ConditionX }</textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">关联池匹配条件<span
							class="red">*</span></label>
						<div class="col-md-8">
							<input name="merchPoolMap.ConditionY"
								id="ConditionY" class="form-control" type="textarea"
								value='${merchPoolMap.ConditionY }'
								maxlength="256">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">ConditionY输入参数<span
							class="red">*</span></label>
						<div class="col-md-8">
							<textarea rows="3" cols="50" name="merchPoolMap.paraY"
								id="paraY" class="form-control" 
								>${merchPoolMap.paraY }</textarea>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success"
			onclick="merchPoolMapForm()">确定</button>
	</div>
</div>
<script>
	function merchPoolMapForm() {
		$("#merchPoolMapForm").submit();
	}
</script>