<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>商户权限管理
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="permissionForm" action="permission/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">前端商户号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="permission.MerchId" id="MerchId"
								class="form-control" type="text" value="${permission.MerchId }"
								maxlength="32"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">微信APP支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.wx006Perm" value="1"
								<c:if test="${permission.wx006Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.wx006Perm" value="0"
								<c:if test="${permission.wx006Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">微信扫码支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.wx011Perm" value="1"
								<c:if test="${permission.wx011Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.wx011Perm" value="0"
								<c:if test="${permission.wx011Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">微信刷卡支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.wx012Perm" value="1"
								<c:if test="${permission.wx012Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.wx012Perm" value="0"
								<c:if test="${permission.wx012Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">微信公众号支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.wx014Perm" value="1"
								<c:if test="${permission.wx014Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.wx014Perm" value="0"
								<c:if test="${permission.wx014Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">支付宝扫码支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.ali009Perm" value="1"
								<c:if test="${permission.ali009Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.ali009Perm" value="0"
								<c:if test="${permission.ali009Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付宝刷卡支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.ali010Perm" value="1"
								<c:if test="${permission.ali010Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.ali010Perm" value="0"
								<c:if test="${permission.ali010Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">支付宝服务窗支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.ali027Perm" value="1"
								<c:if test="${permission.ali027Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.ali027Perm" value="0"
								<c:if test="${permission.ali027Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">QQ钱包wap支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.QQ017Perm" value="1"
								<c:if test="${permission.QQ017Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.QQ017Perm" value="0"
								<c:if test="${permission.QQ017Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">QQ公众号支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.QQ018Perm" value="1"
								<c:if test="${permission.QQ018Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.QQ018Perm" value="0"
								<c:if test="${permission.QQ018Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">QQ刷卡支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.QQ019Perm" value="1"
								<c:if test="${permission.QQ019Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.QQ019Perm" value="0"
								<c:if test="${permission.QQ019Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">QQ扫码支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.QQ020Perm" value="1"
								<c:if test="${permission.QQ020Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.QQ020Perm" value="0"
								<c:if test="${permission.QQ020Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">京东扫码支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.JD021Perm" value="1"
								<c:if test="${permission.JD021Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.JD021Perm" value="0"
								<c:if test="${permission.JD021Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">京东公众号支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.JD022Perm" value="1"
								<c:if test="${permission.JD022Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.JD022Perm" value="0"
								<c:if test="${permission.JD022Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">京东刷卡支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.JD023Perm" value="1"
								<c:if test="${permission.JD023Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.JD023Perm" value="0"
								<c:if test="${permission.JD023Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">京东wap支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.JD024Perm" value="1"
								<c:if test="${permission.JD024Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.JD024Perm" value="0"
								<c:if test="${permission.JD024Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">'银联刷卡支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.uni025Perm" value="1"
								<c:if test="${permission.uni025Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.uni025Perm" value="0"
								<c:if test="${permission.uni025Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">银联扫码支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.uni026Perm" value="1"
								<c:if test="${permission.uni026Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.uni026Perm" value="0"
								<c:if test="${permission.uni026Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.noCard016Perm" value="1"
								<c:if test="${permission.noCard016Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.noCard016Perm" value="0"
								<c:if test="${permission.noCard016Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">快捷消费(SDK)支付<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.noCard033Perm" value="1"
								<c:if test="${permission.noCard033Perm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.noCard033Perm" value="0"
								<c:if test="${permission.noCard033Perm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">退货权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<label class="radio-inline"> <input type="radio"
								name="permission.ReturnGoodPerm" value="1"
								<c:if test="${permission.ReturnGoodPerm eq '1' }">checked="checked"</c:if>>启用
							</label> <label class="radio-inline"> <input type="radio"
								name="permission.ReturnGoodPerm" value="0"
								<c:if test="${permission.ReturnGoodPerm eq '0' }">checked="checked"</c:if>>禁用
							</label>
						</div>
						<label class="control-label col-md-2">单笔限额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="permission.SingleLimitAmount" id="SingleLimitAmount" style="width: 50%;float: left;"
								class="form-control" type="text" value="${permission.SingleLimitAmount }"
								maxlength="15" onkeyup="value=value.replace(/[^\d.]/g,'')">
							<span class="red" style="float: left; margin-top: 8px;">&nbsp;&nbsp;*&nbsp;0.00默认不限额</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">日限额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="permission.DailyLimitAmount" id="DailyLimitAmount" style="width: 50%;float: left;"
								class="form-control" type="text" value="${permission.DailyLimitAmount }"
								maxlength="15" onkeyup="value=value.replace(/[^\d.]/g,'')">
							<span class="red" style="float: left; margin-top: 8px;">&nbsp;&nbsp;*&nbsp;0.00默认不限额</span>
						</div>
						<label class="control-label col-md-2">银联二维码单笔限额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="permission.uniLimitAmount" id="uniLimitAmount" style="width: 50%;float: left;"
								class="form-control" type="text" value="${permission.uniLimitAmount }"
								maxlength="15" onkeyup="value=value.replace(/[^\d.]/g,'')">
							<span class="red" style="float: left; margin-top: 8px;">&nbsp;&nbsp;*&nbsp;0.00默认不限额</span>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success"
			onclick="permissionForm()">确定</button>
	</div>
</div>
<script>
	function permissionForm() {
		$("#permissionForm").submit();
	}
</script>