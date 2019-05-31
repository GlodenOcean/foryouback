<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>聚合下单接口
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="createForm" action="interface/createOrderJuHe"
				class="searchForm form-horizontal" target="ajax">

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">协议版本<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="version" id="createVersion" class="form-control">
								<option value="V001">V001</option>
							</select>
						</div>
						<label class="control-label col-md-2">机构号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="inst_no" id="createOrganNo" class="form-control"
								type="text" maxlength="8" value="12999000">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="pay_type" id="createPayType" class="form-control">
								<c:forEach items="${payTypeEnumList }" var="payTypeEnum">
									<option value="${payTypeEnum.value }">${payTypeEnum.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">商户号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch_id" id="createHicardMerchNo"
								class="form-control" type="text" maxlength="15" value="104401569102119">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">后台回调URL<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="back_end_url" id="createBackEndUrl"
								class="form-control" type="text" maxlength="128"
								value="http://www.123.com">
						</div>
						<label class="control-label col-md-2">协议类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="agre_type" id="createAgreType" class="form-control"
								type="text" maxlength="1" value="T">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2"> <a href="#"
							onclick="createOrderNo();">生成商户订单号</a>
						</label>
						<div class="col-md-3">
							<input name="merch_order_no" id="createMerchOrderOldNo"
								value="${merchOrderNo }" class="form-control" type="text"
								maxlength="32">
						</div>
						<label class="control-label col-md-2">商品名称<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="commodity_name" id="createCommodityName"
								class="form-control" type="text" value="TEST" maxlength="64">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">前台回调地址</label>
						<div class="col-md-3">
							<input class="form-control" id="return_url" name="return_url"
								type="text" maxlength="128">
						</div>
						<label class="control-label col-md-2">备注</label>
						<div class="col-md-3">
							<input class="form-control" id="remark" name="remark" type="text"
								maxlength="64" value="test">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="form-group">
							<label class="control-label col-md-2">交易金额<span
								class="red">*</span></label>
							<div class="col-md-3">
								<input name="amount" id="createAmount" class="form-control"
									type="text" maxlength="12">
							</div>
							<label class="control-label col-md-2">微信、支付宝userId</label>
							<div class="col-md-3">
								<input class="form-control" id="ali_wechat_user_id"
									name="ali_wechat_user_id" type="text" value="${userId }"
									maxlength="64">
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="row">

						<label class="control-label col-md-2">商户秘钥<span
							class="red">*</span></label>
						<div class="col-md-3">
								<input name="secretKey" id="createSecretKey" class="form-control"
									type="text" maxlength="32" value="036da89986cd49bcae58821af4c3156a">
						</div>
						<label class="control-label col-md-2">发送报文环境<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select id="createURL" name="createURL" class="form-control"
								onchange="versionChange()">
								<option value="0">聚合支付下单接口</option>
								<option value="00">自定义</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row" id="setCreateUrl" style="display: none;">
					<div class="form-group">
						<label class="control-label col-md-2">自定义发送报文地址 </label>
						<div class="col-md-8">
							<input name="createURL2" id="createURL2" class="form-control"
								type="text" maxlength="256">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" id="createOrderForm" class="btn btn-success"
			onclick="createOrderForm()">确定</button>
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
				id="requestCreateOrder"></textArea>
		</div>
	</div>
	<div class="widget-header">
		<h5>
			<i class="fa fa fa-th-list"></i>返回数据
		</h5>
	</div>
	<div class="widget-content">
		<textArea style="margin-left: 16px; width: 98%; height: 80px;"
			id="responseCreateOrder"></textArea>
		<div style="text-align: center;">
			<img id="image" alt="支付" src="#"
				style="display: none; height: 300px; width: 300px;">
		</div>
	</div>
</div>
<script>
	function createOrderForm() {
		$("#requestCreateOrder").html("");
		$("#responseCreateOrder").html("");
		formAjaxRequest("createForm", function success(resp) {
			$("#requestCreateOrder").html(resp.data.requestCreateOrder);
			$("#responseCreateOrder").html(resp.data.responseCreateOrder);
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
	function createOrderNo() {
		ajaxRequest("interface/createOrderNo", {}, function success(resp) {
			$("#createMerchOrderOldNo").val(resp.data.merchOrderNo);
		});
	}
	function versionChange(obj) {
		if ($("#createURL").val() == "00") {
			$("#setCreateUrl").css("display", "block");
		} else {
			$("#setCreateUrl").css("display", "none");
		}
	}
</script>