<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>商戶业务映射
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="merchBusinessMapForm" action="businessMap/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户业务类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchBusinessMap.MerchBusiness" id="MerchBusiness"
								class="form-control" type="text"
								value="${merchBusinessMap.MerchBusiness }" maxlength="32"
								<c:if test="${operation eq 'updateMerch' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">服务的业务类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchBusinessMap.MyBusiness" id="MyBusiness"
								class="form-control" type="text"
								value="${merchBusinessMap.MyBusiness }" maxlength="128"
								<c:if test="${operation eq 'updateMerch' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">前端业务类型名称<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchBusinessMap.MerchBusinessTypeName"
								id="MerchBusinessTypeName" class="form-control" type="text"
								value="${merchBusinessMap.MerchBusinessTypeName }"
								maxlength="128">
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success"
			onclick="merchBusinessMapForm()">确定</button>
	</div>
</div>
<script>
	function merchBusinessMapForm() {
		$("#merchBusinessMapForm").submit();
	}
</script>