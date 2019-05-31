<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>冻结/解冻
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="balanceForm" action="interface/frozen"
				class="searchForm form-horizontal" target="ajax">

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">协议类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="agre_type" id="agre_type" class="form-control">
								<option value="F">冻结</option>
								<option value="H">解冻</option>
							</select>
						</div>
						<label class="control-label col-md-2">机构号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="inst_no" id="inst_no" class="form-control"
								type="text" maxlength="8" value="12999000">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch_id" id="merch_id" class="form-control"
								type="text" maxlength="15" value="104401569102119">
						</div>
						<label class="control-label col-md-2">金额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="amount" id="amount" class="form-control" type="text"
								maxlength="15" value="">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2"> <a href="#">订单号</a><span
							class="red">*</span>
						</label>
						<div class="col-md-3">
							<input name="platform_order_no" id="platform_order_no"
								value="${merchOrderNo }" class="form-control" type="text"
								maxlength="32">
						</div>
						<!-- <label class="control-label col-md-2"> <a href="#"
							onclick="balanceOrderNo();">商户秘钥</a><span class="red">*</span>
						</label>
						<div class="col-md-3">
							<input name="secretKey" id="secretKey"
								value="" readonly="readonly"
								class="form-control" type="text" maxlength="32">
						</div> -->
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2"> <a href="#"
							onclick="balanceOrderNo();">备注</a><span class="red">*</span>
						</label>
						<div class="col-md-3">
							<input name="remark" id="remark" value="${remark }"
								class="form-control" type="text">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" id="balanceOrderForm" class="btn btn-success"
			onclick="balanceOrderForm()">确定</button>
	</div>
</div>
<div class="widget box">
	<div class="widget-header">
		<h5>
			<i class="fa fa fa-th-list"></i>请求数据
		</h5>
	</div>
	<div class="widget-content">
		<div class="row">
			<textArea style="margin-left: 30px; width: 95%; height: 80px;"
				id="requestFrozenForm"></textArea>
		</div>
	</div>
	<div class="widget-header">
		<h5>
			<i class="fa fa fa-th-list"></i>返回数据
		</h5>
	</div>
	<div class="widget-content">
		<textArea style="margin-left: 16px; width: 98%; height: 80px;"
			id="responseFrozenForm"></textArea>
		<div style="text-align: center;">
			<img id="image" alt="支付" src="#"
				style="display: none; height: 300px; width: 300px;">
		</div>
	</div>
</div>
<script>
	function balanceOrderForm() {
		$("#requestFrozenForm").html("");
		$("#responseFrozenForm").html("");
		formAjaxRequest("balanceForm", function success(resp) {
			$("#requestFrozenForm").html(resp.data.requestFrozen);
			$("#responseFrozenForm").html(resp.data.responseFrozen);
			if (resp.data.binary != "" && resp.data.binary != undefined) {
				$('#image').attr('src',
						'data:image/jpg;base64,' + resp.data.binary).css(
						'display', 'block');
			} else {
				$('#image').css('display', 'none');
			}
		});
	}
	function balanceOrderNo() {
		ajaxRequest("interface/createOrderNo", {}, function success(resp) {
			$("#platform_order_no").val(resp.data.merchOrderNo);
		});
	}
</script>