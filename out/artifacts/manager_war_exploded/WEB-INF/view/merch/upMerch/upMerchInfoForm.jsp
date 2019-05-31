<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>上级商戶信息
		</h4>
	</div>
	<div class="widget-content">
	<div class="row">
			<form id="merchForm" action="upMerch/${operation }" class="form-horizontal" target="ajax">
			
				<input type="hidden" name="upMerchInfo.UUID" value="${upMerchInfo.UUID }"/>
				<input type="hidden" id="operation" value="${operation }" />
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户编号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.MerchId" id="MerchId" class="form-control" type="text" value="${upMerchInfo.MerchId }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">商户名称<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.MerchName" id="MerchName" class="form-control" type="text" value="${upMerchInfo.MerchName }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">子商户编号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.SubMerchId" id="SubMerchId" class="form-control" type="text" value="${upMerchInfo.SubMerchId }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">子商户名称<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.SubMerchName" id="SubMerchName" class="form-control" type="text" value="${upMerchInfo.SubMerchName }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">子商户状态<span class="red">*</span></label>
						<div class="col-md-3">
							<select name="upMerchInfo.SubMerchName" class="form-control">
								<option value="1" ${merch.SubMerchStatus == '1' ? 'selected' : '' }>有效</option>
								<option value="0" ${merch.SubMerchStatus == '0' ? 'selected' : '' }>无效</option>
							</select>
						</div>
						<label class="control-label col-md-2">商户状态<span class="red">*</span></label>
						<div class="col-md-3">
							<select name="upMerchInfo.MerchStatus" class="form-control">
								<option value="1" ${merch.MerchStatus == '1' ? 'selected' : '' }>有效</option>
								<option value="0" ${merch.MerchStatus == '0' ? 'selected' : '' }>无效</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户简称<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.SimpleName" id="SimpleName" class="form-control" type="text" value="${upMerchInfo.SimpleName }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">渠道商户识别码<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ChannelMerchNo" id="ChannelMerchNo" class="form-control" type="text" value="${upMerchInfo.ChannelMerchNo }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付授权目录<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.PayAuthDirectory" id="PayAuthDirectory" class="form-control" type="text" value="${upMerchInfo.PayAuthDirectory }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">行业编号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.BusinessNo" id="BusinessNo" class="form-control" type="text" value="${upMerchInfo.BusinessNo }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">经营类目<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.BusinessCategory" id="BusinessCategory" class="form-control" type="text" value="${upMerchInfo.BusinessCategory }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">受理公众号APPID<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.AppId" id="AppId" class="form-control" type="text" value="${upMerchInfo.AppId }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">子商户公众号APPID<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.SubAppId" id="SubAppId" class="form-control" type="text" value="${upMerchInfo.SubAppId }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">客服电话<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.CustomerTele" id="CustomerTele" class="form-control" type="text" value="${upMerchInfo.CustomerTele }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">联系人名称<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ContactName" id="ContactName" class="form-control" type="text" value="${upMerchInfo.ContactName }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">联系人电话<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ContactPhone" id="ContactPhone" class="form-control" type="text" value="${upMerchInfo.ContactPhone }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">联系手机<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ContactTele" id="ContactTele" class="form-control" type="text" value="${upMerchInfo.ContactTele }" maxlength="11" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">联系邮箱<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ContactMail" id="ContactMail" class="form-control" type="text" value="${upMerchInfo.ContactMail }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户来源机构标识<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.MerchSourceInst" id="MerchSourceInst" class="form-control" type="text" value="${upMerchInfo.MerchSourceInst }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">营业执照编号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.LicenseNo" id="LicenseNo" class="form-control" type="text" value="${upMerchInfo.LicenseNo }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">营业执照类型<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.LicenseType" id="LicenseType" class="form-control" type="text" value="${upMerchInfo.LicenseType }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">身份证号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.PersonId" id="PersonId" class="form-control" type="text" value="${upMerchInfo.PersonId }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">联系人类型<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ContactType" id="ContactType" class="form-control" type="text" value="${upMerchInfo.ContactType }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">省份代码<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ProvinceCode" id="ProvinceCode" class="form-control" type="text" value="${upMerchInfo.ProvinceCode }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">城市编号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.CityCode" id="CityCode" class="form-control" type="text" value="${upMerchInfo.CityCode }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">区县代码<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.CountryCode" id="CountryCode" class="form-control" type="text" value="${upMerchInfo.CountryCode }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">地址类型<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.AddressType" id="AddressType" class="form-control" type="text" value="${upMerchInfo.AddressType }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">经营地址<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.Address" id="Address" class="form-control" type="text" value="${upMerchInfo.Address }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银行卡号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.BankCardNo" id="BankCardNo" class="form-control" type="text" value="${upMerchInfo.BankCardNo }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">持卡人<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.BankCradHolder" id="BankCradHolder" class="form-control" type="text" value="${upMerchInfo.BankCradHolder }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付宝账号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.AlipayAccount" id="AlipayAccount" class="form-control" type="text" value="${upMerchInfo.AlipayAccount }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">二维码<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.QrCode" id="QrCode" class="form-control" type="text" value="${upMerchInfo.QrCode }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">渠道类型<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ChannelType" id="ChannelType" class="form-control" type="text" value="${upMerchInfo.ChannelType }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">渠道机构号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ChannelInst" id="ChannelInst" class="form-control" type="text" value="${upMerchInfo.ChannelInst }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">注册状态<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.RegistratioStatus" id="RegistratioStatus" class="form-control" type="text" value="${upMerchInfo.RegistratioStatus }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">错误原因<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.ErrorReason" id="ErrorReason" class="form-control" type="text" value="${upMerchInfo.ErrorReason }" maxlength="128" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最后修改时间<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="upMerchInfo.LastUpdateTime" id="LastUpdateTime" class="form-control" type="text" value="${upMerchInfo.LastUpdateTime }" maxlength="32" <c:if test="${operation == 'view' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">是否已同步<span class="red">*</span></label>
						<div class="col-md-3">
							<select name="upMerchInfo.SubMerchStatus" class="form-control">
								<option value="1" ${merch.SubMerchStatus == '1' ? 'selected' : '' }>是</option>
								<option value="0" ${merch.SubMerchStatus != '1' ? 'selected' : '' }>否</option>
							</select>
						</div>
					</div>
				</div>
				
				
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<c:if test="${operation == 'update' || operation == 'add'}">
			<button type="button" class="btn btn-success" onclick="merch()">确定</button>
		</c:if>
		
	</div>
</div>
<script>
function validate(){
	var MerchId = {senderId:"MerchId",ruler:{require:true}};
	var TermId = {senderId:"MerchName",ruler:{require:true}};
	var array = [MerchId,TermId];
	return $ES.validate(array);
}

function merch(){
	if(validate()){
		$("#merchForm").submit();
	}
}
</script>