<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>添加银联二维码
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="fixCodeForm" action="fixCode/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">前置商户号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="fixCode.MerchId" id="MerchId"
								class="form-control" type="text"
								value="${fixCode.MerchId }" maxlength="32"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">银联商户号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="fixCode.UnFxMerchId" id="UnFxMerchId"
								class="form-control" type="text"
								value="${fixCode.UnFxMerchId }" maxlength="128" >
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success"
			onclick="fixCodeForm()">确定</button>
	</div>
</div>
<script>
	function fixCodeForm() {
		$("#fixCodeForm").submit();
	}
</script>