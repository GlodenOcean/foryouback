<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>修改商戶信息
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="merchForm" action="merch/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" name="merch.UUID" value="${merch.UUID }" /><input
					type="hidden" id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户编号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch.MerchId" id="MerchId" class="form-control"
								type="text" value="${merch.MerchId }" maxlength="32"
								<c:if test="${operation == 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">商户名称<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch.MerchName" id="MerchName" class="form-control"
								type="text" value="${merch.MerchName }" maxlength="128"
								<c:if test="${operation == 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<c:if test="${merch ne 'null' }">
							<label class="control-label col-md-2">商户密钥<span
								class="red">*</span></label>
							<div class="col-md-3">
								<input name="merch.EncKey" id="EncKey" class="form-control"
									type="text" value="${merch.EncKey }" maxlength="128"
									readonly="readonly">
							</div>
						</c:if>
					<div class="form-group">
						<label class="control-label col-md-2">商户池代码<span
							class="red"></span></label>
						<div class="col-md-3">
							<select name="merch.MerchPool" class="form-control">
								<option value="">请选择</option>
								<option value="1" ${merch.MerchPool eq '1' ? 'selected' : '' }>专有商户池</option>
								<c:forEach items="${merchPoolList }" var="merchPool">
									<option value="${merchPool.MerchPool }"
										${merch.MerchPool eq merchPool.MerchPool ? 'selected' : '' }>${merchPool.MerchPool}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">机构号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch.InstNo" id="InstNo" class="form-control"
								type="text" value="${merch.InstNo }" maxlength="32">
						</div>
						<label class="control-label col-md-2">上级商户号<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.UpMerchId" id="UpMerchId" class="form-control"
								type="text" value="${merch.UpMerchId }" maxlength="32">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">终端号<span class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.TermId" id="TermId" class="form-control"
								type="text" value="${merch.TermId }" maxlength="32">
						</div>
						<label class="control-label col-md-2">商户状态<span
							class="red">*</span></label>
						<div class="col-md-3">
							<c:choose>
								<c:when test="${merch == null || merch.MerchStatus == '1' }">
									<label class="radio-inline"> <input type="radio"
										name="merch.MerchStatus" value="1" checked="checked">启用
									</label>
									<label class="radio-inline"> <input type="radio"
										name="merch.MerchStatus" value="0">禁用
									</label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline"> <input type="radio"
										name="merch.MerchStatus" value="1">启用
									</label>
									<label class="radio-inline"> <input type="radio"
										name="merch.MerchStatus" value="0" checked="checked">禁用
									</label>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label">商户地址<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.MerchAddr" id="MerchAddr" class="form-control"
								type="text" value="${merch.MerchAddr }" maxlength="512">
						</div>
						<label class="control-label col-md-2">余额出账权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.T0_Contorl" class="form-control">
								<option value="">请选择</option>
								<option value="0" ${merch.T0_Contorl == '0' ? 'selected' : '' }>允许</option>
								<option value="3" ${merch.T0_Contorl == '3' ? 'selected' : '' }>不允许</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">垫资出账权限<span
							class="red"></span></label>
						<div class="col-md-3">
							<select name="merch.SettleKind" class="form-control">
								<option value="">请选择</option>
								<option value="0" ${merch.SettleKind == '0' ? 'selected' : '' }>允许</option>
								<option value="3" ${merch.SettleKind == '3' ? 'selected' : '' }>不允许</option>
							</select>
						</div>
						<label class="control-label col-md-2">T0是否只能出当天交易额<span
							class="red"></span></label>
						<div class="col-md-3">
							<select name="merch.TransModel"  id="TransModel" class="form-control">
								<option value="">请选择</option>
								<option value="1" ${merch.TransModel == '1' ? 'selected' : '' }>否</option>
								<option value="0" ${merch.TransModel == '0' ? 'selected' : '' }>是</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">同步序号<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.SyncSN" id="SyncSN" class="form-control"
								type="text" value="${merch.SyncSN }" maxlength="20">
						</div>
						<label class="control-label col-md-2">行业<span class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.Business" id="Business" class="form-control"
								type="text" value="${merch.Business }" maxlength="128">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">联系人<span class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.LinkName" id="LinkName" class="form-control"
								type="text" value="${merch.LinkName }" maxlength="32">
						</div>
						<label class="control-label col-md-2">商户电话<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.MerchTel" id="MerchTel" class="form-control"
								type="text" value="${merch.MerchTel }" maxlength="11">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">微信AppId<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.AppId" id="AppId" class="form-control"
								type="text" value="${merch.AppId }" maxlength="32">
						</div>
						<label class="control-label col-md-2">支付宝PID<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.Pid" id="Pid" class="form-control" type="text"
								value="${merch.Pid }" maxlength="11">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">回调通知URL<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.ReportURL" id="ReportURL" class="form-control"
								type="text" value="${merch.ReportURL }" maxlength="380">
						</div>
						<label class="control-label col-md-2">是否禁用信用卡<span
							class="red"></span></label>
						<div class="col-md-3">
							<select name="merch.DisableCredit" class="form-control">
								<option value="">请选择</option>
								<option value="0"
									${merch.DisableCredit == '0' ? 'selected' : '' }>否</option>
								<option value="1"
									${merch.DisableCredit == '1' ? 'selected' : '' }>是</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商品名称上送权限<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.GoodsNameType" class="form-control">
								<option value="0"
									${merch.GoodsNameType == '0' ? 'selected' : '' }>前端商户名称</option>
								<option value="1"
									${merch.GoodsNameType == '1' ? 'selected' : '' }>上送的商品名称上送后端</option>
							</select>
						</div>
						<label class="control-label col-md-2">串号<span class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.serialNo" id="serialNo" class="form-control"
								type="text" value="${merch.serialNo }" maxlength="128">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">添加时间</label>
						<div class="col-md-3" style="margin-top: 8px;">
							<c:if test="${merch ne null }">
								<fmt:formatDate value="${merch.AddTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</c:if>
							<c:if test="${merch eq null }">
								<input id="AddTime" name="merch.AddTime" class="form-control"
									type="text" />
							</c:if>
						</div>
						<label class="control-label col-md-2">最后更新时间</label>
						<div class="col-md-3" style="margin-top: 8px;">
							<c:if test="${merch ne null }">
								<fmt:formatDate value="${merch.UpdateTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</c:if>
							<c:if test="${merch eq null }">
								<input id="UpdateTime" name="merch.UpdateTime"
									class="form-control" type="text" />
							</c:if>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银联二维码入账姓名<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch.uniInCommName" id="uniInCommName"
								class="form-control" type="text" value="${merch.uniInCommName }"
								maxlength="128">
						</div>
						<label class="control-label col-md-2">预生成的商户号是否被使用<span
							class="red"></span></label>
						<div class="col-md-3">
							<select name="merch.useStatus" class="form-control">
								<option value="0" ${merch.useStatus == '0' ? 'selected' : '' }>未使用</option>
								<option value="1" ${merch.useStatus == '1' ? 'selected' : '' }>已使用</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">备注<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch.remark" id="remark" class="form-control"
								type="text" value="${merch.remark }" maxlength="128">
						</div>
						<label class="control-label col-md-2">openId<span
							class="red"></span></label>
						<div class="col-md-3">
							<input name="merch.openId" id="openId" class="form-control"
								type="text" value="${merch.openId }" maxlength="128">

						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">审核状态<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.reviewedStatus" class="form-control">
								<option value="0"
									${merch.reviewedStatus == '0' ? 'selected' : '' }>未审核</option>
								<option value="1"
									${merch.reviewedStatus == '1' ? 'selected' : '' }>审核通过</option>
								<option value="2"
									${merch.reviewedStatus == '2' ? 'selected' : '' }>审核未通过</option>
							</select>
						</div>
						<label class="control-label col-md-2">是否已导出<span
							class="red"></span></label>
						<div class="col-md-3">
							<select name="merch.isExport" class="form-control">
								<option value="0" ${merch.isExport == '0' ? 'selected' : '' }>未导出</option>
								<option value="1" ${merch.isExport == '1' ? 'selected' : '' }>已导出</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">是否T1余额出账<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.IsT1YECZ" class="form-control">
								<option value="">请选择</option>
								<option value="1" ${merch.IsT1YECZ eq '1' ? 'selected' : '' }>是</option>
								<option value="0" ${merch.IsT1YECZ ne '1' ? 'selected' : '' }>否</option>
							</select>
						</div>
						<label class="control-label col-md-2"> 交易入账名称<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merch.noCardInCommName" id="noCardInCommName"
								class="form-control" type="text"
								value="${merch.noCardInCommName }" maxlength="128">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">代付通道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.PayOtherCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="channelType">
									<option value="${channelType.desc }"
										${merch.PayOtherCh eq channelType.desc ? 'selected' : '' }>${channelType.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">代付类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.PayforType" class="form-control">
								<option value="">请选择</option>
								<option value="0" ${merch.PayforType == '0' ? 'selected' : '' }>余额代付</option>
								<option value="1" ${merch.PayforType == '1' ? 'selected' : '' }>垫资代付</option>
							</select>
						</div>
					</div>
				</div>
				<%-- <div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">中茂小额支付指定渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.noCardZMPayCh" id="noCardZMPayCh"
								class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="channelType">
									<option value="${channelType.desc }"
										${merch.noCardZMPayCh eq channelType.desc ? 'selected' : '' }>${channelType.desc}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div> --%>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">微信支付指定支付渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.wxAssPayCh" id="wxAssPayCh"
								class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="channelType">
									<option value="${channelType.desc }"
										${merch.wxAssPayCh eq channelType.desc ? 'selected' : '' }>${channelType.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">微信支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.WXFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '微信' }">
										<option value="${rate.RateName }"
											${merch.WXFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付宝指定支付渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.aliAssPayCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="channelType">
									<option value="${channelType.desc }"
										${merch.aliAssPayCh eq channelType.desc ? 'selected' : '' }>${channelType.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">支付宝扫码手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.AliFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '支付宝' }">
										<option value="${rate.RateName }"
											${merch.AliFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">QQ钱包指定支付渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.QQAssPayCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="channelType">
									<option value="${channelType.desc }"
										${merch.QQAssPayCh eq channelType.desc ? 'selected' : '' }>${channelType.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">QQ支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.QQFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq 'QQ' }">
										<option value="${rate.RateName }"
											${merch.QQFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">京东钱包指定支付渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.JDAssPayCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="channelType">
									<option value="${channelType.desc }"
										${merch.JDAssPayCh eq channelType.desc ? 'selected' : '' }>${channelType.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">京东支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.JDFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">${rate.RateName}
									<option value="${rate.RateName }"
										${merch.JDFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银联二维码指定渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.uniAssPayCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="uniAssPayCh">
									<option value="${uniAssPayCh.desc }"
										${merch.uniAssPayCh eq uniAssPayCh.desc ? 'selected' : '' }>${uniAssPayCh.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">银联二维码支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.YLQrCodeFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<%-- <c:if test="${rate.PayKind eq '银联二维码' }"> --%>
										<option value="${rate.RateName }"
											${merch.YLQrCodeFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									<%-- </c:if> --%>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">网关支付指定渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.noCardZMPayCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="noCardZMPayCh">
									<option value="${noCardZMPayCh.desc }"
										${merch.noCardZMPayCh eq noCardZMPayCh.desc ? 'selected' : '' }>${noCardZMPayCh.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">网关支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.NoCardChWebFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<%-- <c:if test="${rate.PayKind eq '银联二维码' }"> --%>
										<option value="${rate.RateName }"
											${merch.NoCardChWebFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								<%-- 	</c:if> --%>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银联在线指定渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.noCardAssPayCh" id="noCardAssPayCh"
								class="form-control" onchange="channelSelect(this);">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="CardAssPayCh">
									<option value="${CardAssPayCh.desc }"
										${merch.noCardAssPayCh eq CardAssPayCh.desc ? 'selected' : '' }>${CardAssPayCh.desc}</option>
								</c:forEach>
							</select>

						</div>
						<!-- <div class="col-md-1">
							<select name="merch.newYMF" class="form-control" id="newYMF"
								style="display: none;">
								<option value="">请选择</option>
								<option value="1">银联在线</option>
								<option value="0">网关支付</option>
							</select>
						</div> -->
						<label class="control-label col-md-2">银联在线手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.NoCardFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<%-- <c:if test="${rate.PayKind eq ' 快捷' }"> --%>
										<option value="${rate.RateName }"
											${merch.NoCardFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									<%-- </c:if> --%>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">快捷网关<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.noCardDirectPayCh" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="noCardDirectPayCh">
									<option value="${noCardDirectPayCh.desc }"
										${merch.noCardDirectPayCh eq noCardDirectPayCh.desc ? 'selected' : '' }>${noCardDirectPayCh.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">快捷支付的费率<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.QPayFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '快捷支付' }">
										<option value="${rate.RateName }"
											${merch.QPayFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">微信H5支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.WXH5Fee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${merch.WXH5Fee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">微信APP支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.WXAPPFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${merch.WXAPPFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">余额代付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.BalancePayFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${merch.BalancePayFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">垫资代付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.DZPayFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${merch.DZPayFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">QQ H5指定支付渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.QQH5AssPayCh" id="QQH5AssPayCh"
								class="form-control" onchange="channelSelect(this);">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="QQH5AssPayCh">
									<option value="${QQH5AssPayCh.desc }"
										${merch.QQH5AssPayCh eq QQH5AssPayCh.desc ? 'selected' : '' }>${QQH5AssPayCh.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">QQ H5支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.QQH5Fee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${merch.QQH5Fee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付宝H5指定支付渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.aliH5AssPayCh" id="aliH5AssPayCh"
								class="form-control" onchange="channelSelect(this);">
								<option value="">无指定</option>
								<c:forEach items="${channelTypeEnum }" var="aliH5AssPayCh">
									<option value="${aliH5AssPayCh.desc }"
										${merch.aliH5AssPayCh eq aliH5AssPayCh.desc ? 'selected' : '' }>${aliH5AssPayCh.desc}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">支付宝H5费率<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="merch.AliH5Fee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${merch.AliH5Fee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success" onclick="merch()">确定</button>
	</div>
</div>
<script>
	$(function() {
		var merch = '${merch}';
		if (merch == "") {
			var time = GetDateT();
			$("#AddTime").val(time);
			$("#UpdateTime").val(time);
		}
	});
	//取当前时间，格式为,yyyy-mm-dd hh:mm:ss  
	function GetDateT() {
		var d, s;
		d = new Date();
		s = d.getFullYear() + "-"; //取年份  
		s = s + (d.getMonth() + 1) + "-";//取月份  
		s += d.getDate() + " "; //取日期  
		s += d.getHours() + ":"; //取小时  
		s += d.getMinutes() + ":"; //取分  
		s += d.getSeconds(); //取秒  
		return (s);
	}
	function validate() {
		var MerchId = {
			senderId : "MerchId",
			ruler : {
				require : true
			}
		};
		var TermId = {
			senderId : "MerchName",
			ruler : {
				require : true
			}
		};
		var InstNo = {
			senderId : "InstNo",
			ruler : {
				require : true
			}
		};
		var array = [ MerchId, TermId, InstNo ];
		return $ES.validate(array);
	}

	function merch() {
		if (validate()) {
			var select = $("#noCardAssPayCh").find("option:selected").val();
			var newYMF = $("#newYMF").val();
			if(select == "爱农支付平台" && newYMF == ""){
				alert("请完善 (网页)指定渠道选项");
				return 0;
			}
			$("#merchForm").submit();
		}
	}
	
	function channelSelect(obj) {
		$("#newYMF").css("display", "none");
		var select = $("#noCardAssPayCh").find("option:selected").val();
		if(select == "爱农支付平台"){
			$("#newYMF").css("display", "block");
		}
	}
</script>