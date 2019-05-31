<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>商戶信息
		</h4>
	</div>
	<div class="widget-content">
	<div class="row">
			<form id="bankCodeForm" action="bankCode/${operation }" class="form-horizontal" target="ajax">
			
				<input type="hidden" name="id" value="${bankCode.MerchId }"/>
				<input type="hidden" id="operation" value="${operation }" />
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银行联行号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="bankCode.BankCode" id="BankCode" class="form-control" type="text" value="${bankCode.BankCode }" maxlength="12">
						</div>
						<label class="control-label col-md-2">银行名称<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="bankCode.BankName" id="BankName" class="form-control" type="text" value="${bankCode.BankName }" maxlength="64">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银行营业地址<span class="red"></span></label>
						<div class="col-md-3">
							<input name="bankCode.BankAdder" id="BankAdder" class="form-control" type="text" value="${bankCode.BankAdder }" maxlength="256">
						</div>
						<label class="control-label col-md-2">银行电话<span class="red"></span></label>
						<div class="col-md-3">
							<input name="bankCode.BankTelNo" id="BankTelNo" class="form-control" type="text" value="${bankCode.BankTelNo }" maxlength="64">
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success" onclick="bankCode()">确定</button>
	</div>
</div>
<script>
function validate(){
	var BankCode = {senderId:"BankCode",ruler:{require:true}};
	var BankName = {senderId:"BankName",ruler:{require:true}};
	var array = [BankCode,BankName];
	return $ES.validate(array);
}

function bankCode(){
	if(validate()){
		$("#bankCodeForm").submit();
	}
}
</script>