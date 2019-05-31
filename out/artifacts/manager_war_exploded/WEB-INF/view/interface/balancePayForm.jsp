<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>余额代付接口
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="balanceForm" action="interface/balancePay"
				class="searchForm form-horizontal" target="ajax">

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">协议版本<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="version" id="balanceVersion" class="form-control">
								<option value="V001">V001</option>
							</select>
						</div>
						<label class="control-label col-md-2">机构号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="inst_no" id="balanceOrganNo" class="form-control"
								type="text" maxlength="8" value="12999000">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="pay_type" id="pay_type" class="form-control">
								<option value="035">余额代付</option>
							</select>
						</div>
						<label class="control-label col-md-2">商户号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch_id" id="balanceHicardMerchNo"
								class="form-control" type="text" maxlength="15"
								value="104401569102119">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">对公标识<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="is_compay" id="balanceIsCompay"
								class="form-control">
								<option value="0">对私</option>
								<option value="1">对公</option>
							</select>
						</div>
						<label class="control-label col-md-2">协议类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="agre_type" id="balanceAgreType" class="form-control"
								type="text" maxlength="1" value="D" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2"> <a href="#"
							onclick="balanceOrderNo();">生成商户订单号</a><span class="red">*</span>
						</label>
						<div class="col-md-3">
							<input name="merch_order_no" id="merch_order_no"
								value="${merchOrderNo }" class="form-control" type="text"
								maxlength="32">
						</div>
						<label class="control-label col-md-2">原交易商户订单号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="trade_order_no" id="balanceTradeOrderNo"
								class="form-control" type="text" value="TEST" maxlength="64">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">持卡人姓名<span class="red">*</span></label>
						<div class="col-md-3">
							<input class="form-control" id="customer_name"
								name="customer_name" type="text" maxlength="64">
						</div>
						<label class="control-label col-md-2">证件类型<span class="red">*</span></label>
						<div class="col-md-3">
							<input class="form-control" id="customer_cert_type"
								name="customer_cert_type" type="text" maxlength="2">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">持卡人证件编号<span class="red">*</span></label>
						<div class="col-md-3">
							<input class="form-control" id="customer_cert_id"
								name="customer_cert_id" type="text" maxlength="32">
						</div>
						<label class="control-label col-md-2">持卡人手机号码</label>
						<div class="col-md-3">
							<input class="form-control" id="customer_phone"
								name="customer_phone" type="text" maxlength="16">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">联行号</label>
						<div class="col-md-3">
							<input class="form-control" id="bank_no" name="bank_no"
								type="text" maxlength="20">
						</div>
						<label class="control-label col-md-2">银行简称<span class="red">*</span></label>
						<div class="col-md-3">
							<input class="form-control" id="bank_short_name"
								name="bank_short_name" type="text" maxlength="32">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">开户行名称<span class="red">*</span></label>
						<div class="col-md-3">
							<input class="form-control" id="bank_name" name="bank_name"
								type="text" maxlength="128">
						</div>
						<label class="control-label col-md-2">入账卡号<span class="red">*</span></label>
						<div class="col-md-3">
							<input class="form-control" id="bank_card_no" name="bank_card_no"
								type="text" maxlength="64">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">备注</label>
						<div class="col-md-3">
							<input class="form-control" id="remark" name="remark" type="text"
								maxlength="64" value="test">
						</div>
						<label class="control-label col-md-2">交易金额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="amount" id="balanceAmount" class="form-control"
								type="text" maxlength="12">
						</div>
					</div>
				</div>
				<div class="row">

					<label class="control-label col-md-2">商户秘钥<span class="red">*</span></label>
					<div class="col-md-3">
						<input name="secretKey" id="balanceSecretKey" class="form-control"
							type="text" maxlength="32"
							value="036da89986cd49bcae58821af4c3156a">
					</div>
					<label class="control-label col-md-2">发送报文环境<span
						class="red">*</span></label>
					<div class="col-md-3">
						<select id="balanceURL" name="balanceURL" class="form-control"
							onchange="versionChange()">
							<option value="0">聚合支付下单接口</option>
							<option value="00">自定义</option>
						</select>
					</div>
				</div>
				<div class="row" id="setBalanceUrl" style="display: none;">
					<div class="form-group">
						<label class="control-label col-md-2">自定义发送报文地址 </label>
						<div class="col-md-8">
							<input name="balanceURL2" id="balanceURL2" class="form-control"
								type="text" maxlength="256">
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
				id="requestbalancePayForm"></textArea>
		</div>
	</div>
	<div class="widget-header">
		<h5>
			<i class="fa fa fa-th-list"></i>返回数据
		</h5>
	</div>
	<div class="widget-content">
		<textArea style="margin-left: 16px; width: 98%; height: 80px;"
			id="responsebalancePayForm"></textArea>
		<div style="text-align: center;">
			<img id="image" alt="支付" src="#"
				style="display: none; height: 300px; width: 300px;">
		</div>
	</div>
</div>
<script>
	function balanceOrderForm() {
		$("#requestbalancePayForm").html("");
		$("#responsebalancePayForm").html("");
		formAjaxRequest("balanceForm", function success(resp) {
			$("#requestbalancePayForm").html(resp.data.requestCreateOrder);
			$("#responsebalancePayForm").html(resp.data.responseCreateOrder);
			if (resp.data.binary != "" && resp.data.binary != undefined) {
				$('#image').attr('src',
						'data:image/jpg;base64,' + resp.data.binary).css(
						'display', 'block');
			} else {
				$('#image').css('display', 'none');
				showErrorNotice("请求服务器超时，请重试！");
			}
		});
	}
	function balanceOrderNo() {
		ajaxRequest("interface/createOrderNo", {}, function success(resp) {
			$("#merch_order_no").val(resp.data.merchOrderNo);
		});
	}
	function versionChange(obj) {
		if ($("#balanceURL").val() == "00") {
			$("#setBalanceUrl").css("display", "block");
		} else {
			$("#setBalanceUrl").css("display", "none");
		}
	}
</script>