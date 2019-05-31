<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>

<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>渠道商戶信息
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="channelMerchForm" action="channelMerch/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" name="channelMerch.UUID"
					value="${channelMerch.UUID }" /> <input type="hidden"
					id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">前端商户号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.MerchId" id="channelMerch.MerchId"
								class="form-control" type="text"
								value="${channelMerch.MerchId }"
								<c:if test="${operation == 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">前端终端号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.TermId" id="channelMerch.TermId"
								class="form-control" type="text" value="${channelMerch.TermId }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.ChMerchId" id="channelMerch.ChMerchId"
								class="form-control" type="text"
								value="${channelMerch.ChMerchId }"
								<c:if test="${operation == 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">商户名称<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.ChMerName" id="channelMerch.ChMerName"
								class="form-control" type="text"
								value="${channelMerch.ChMerName }"
								<c:if test="${operation == 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="channelMerch.payKind" id="payKind"
								class="form-control">
								<option value="">请选择</option>
								<c:forEach items="${payWayEnumList }" var="payWay">
									<option value="${payWay.value }"
										${channelMerch.payKind == payWay.value ? 'selected' : '' }>${payWay.value}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">终端号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.ChTermId" id="ChTermId"
								class="form-control" type="text"
								value="${channelMerch.ChTermId }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">营业的开始时间<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.TransTimeS" id="TransTimeS"
								value="${channelMerch.TransTimeS }" class="form-control"
								type="text" placeholder="HH:mm:ss">
						</div>
						<label class="control-label col-md-2">营业的结束时间<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.TransTimeE" id="TransTimeE"
								value="${channelMerch.TransTimeE }" class="form-control"
								type="text" placeholder="HH:mm:ss">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">地区码<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.AreaCode" id="channelMerch.AreaCode"
								class="form-control" type="text"
								value="${channelMerch.AreaCode }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">渠道机构号</label>
						<div class="col-md-3">
							<input name="channelMerch.ChInstNo" id="channelMerch.ChInstNo"
								class="form-control" type="text"
								value="${channelMerch.ChInstNo }">
						</div>
						<label class="control-label col-md-2">上级商户号</label>
						<div class="col-md-3">
							<input name="channelMerch.UpMerchId" id="UpMerchId"
								class="form-control" type="text"
								value="${channelMerch.UpMerchId }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">微信AppId</label>
						<div class="col-md-3">
							<input name="channelMerch.AppId" id="channelMerch.AppId"
								class="form-control" type="text" value="${channelMerch.AppId }">
						</div>
						<label class="control-label col-md-2">子商户AppId</label>
						<div class="col-md-3">
							<input name="channelMerch.SubAppId" id="SubAppId"
								class="form-control" type="text"
								value="${channelMerch.SubAppId }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">子商户号</label>
						<div class="col-md-3">
							<input name="channelMerch.ChSubMerId" id="ChSubMerId"
								class="form-control" type="text"
								value="${channelMerch.ChSubMerId }">
						</div>
						<label class="control-label col-md-2">子商户名称</label>
						<div class="col-md-3">
							<input name="channelMerch.ChSubMerName" id="ChSubMerName"
								class="form-control" type="text"
								value="${channelMerch.ChSubMerName }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户状态<span
							class="red">*</span></label>
						<div class="col-md-3">
							<c:choose>
								<c:when
									test="${channelMerch == null || channelMerch.ChMerchStatus == '1' }">
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChMerchStatus" value="1" checked="checked">启用
									</label>
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChMerchStatus" value="0">禁用
									</label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChMerchStatus" value="1">启用
									</label>
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChMerchStatus" value="0" checked="checked">禁用
									</label>
								</c:otherwise>
							</c:choose>
						</div>
						<label class="control-label col-md-2">子商户状态<span
							class="red">*</span></label>
						<div class="col-md-3">
							<c:choose>
								<c:when
									test="${channelMerch == null || channelMerch.ChSubMerchStatus == '1' }">
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChSubMerchStatus" value="1"
										checked="checked">启用
									</label>
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChSubMerchStatus" value="0">禁用
									</label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChSubMerchStatus" value="1">启用
									</label>
									<label class="radio-inline"> <input type="radio"
										name="channelMerch.ChSubMerchStatus" value="0"
										checked="checked">禁用
									</label>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<%-- <label class="control-label col-md-2">微信openId<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.Openid" id="Openid"
								class="form-control" type="text" value="${channelMerch.Openid }">
						</div> --%>
						<label class="control-label col-md-2">孙商户号</label>
						<div class="col-md-3">
							<input name="channelMerch.ChGraMerId" id="ChGraMerId"
								class="form-control" type="text"
								value="${channelMerch.ChGraMerId }">
						</div>
						<label class="control-label col-md-2">商户池标识</label>
						<div class="col-md-3">
							<select name="channelMerch.MerchPool" id="MerchPool"
								class="form-control">
								<option value="">请选择</option>
								<option value="1" ${channelMerch.MerchPool eq '1' ? 'selected' : '' }>商户专有池</option>
								<c:forEach items="${merchPoolList }" var="merchPool">
									<option value="${merchPool.SeqNo }"
										${channelMerch.MerchPool eq merchPool.SeqNo ? 'selected' : '' }>${merchPool.MerchPool}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">孙商户名称</label>
						<div class="col-md-3">
							<input name="channelMerch.ChGraMerName" id="ChGraMerName"
								class="form-control" type="text"
								value="${channelMerch.ChGraMerName }">
						</div>
						<label class="control-label col-md-2">外部商户注册时间</label>
						<div class="col-md-3">
							<input name="channelMerch.OmRt" id="OmRt" class="form-control"
								type="text" value="${channelMerch.OmRt }"
								<c:if test="${operation == 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">外部商户行业</label>
						<div class="col-md-3">
							<input name="channelMerch.OmType" id="OmType"
								class="form-control" type="text" value="${channelMerch.OmType }">
						</div>
						<label class="control-label col-md-2">外部商户地址</label>
						<div class="col-md-3">
							<input name="channelMerch.OmAdd" id="OmAdd" class="form-control"
								type="text" value="${channelMerch.OmAdd }">
						</div>
					</div>
				</div>
				<c:if test="${operation == 'update' }">
					<div class="row">
						<div class="form-group">
							<label class="control-label col-md-2">新增时间</label>
							<div class="col-md-3" style="margin-top: 8px;">
								<fmt:formatDate value="${channelMerch.AddTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
							<label class="control-label col-md-2">最后更新时间</label>
							<div class="col-md-3" style="margin-top: 8px;">
								<fmt:formatDate value="${channelMerch.UpdateTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
						</div>
					</div>
				</c:if>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">同步序号</label>
						<div class="col-md-3">
							<input name="channelMerch.SyncSN" id="SyncSN"
								class="form-control" type="text" value="${channelMerch.SyncSN }">
						</div>
						<label class="control-label col-md-2">简称</label>
						<div class="col-md-3">
							<input name="channelMerch.SimpleName" id="SimpleName"
								class="form-control" type="text"
								value="${channelMerch.SimpleName }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">渠道名称</label>
						<div class="col-md-3">
							<input name="channelMerch.ChName" id="ChName"
								class="form-control" type="text" value="${channelMerch.ChName }">
						</div>
						<label class="control-label col-md-2">渠道ID</label>
						<div class="col-md-3">
							<input name="channelMerch.ChId" id="ChId" class="form-control"
								type="text" value="${channelMerch.ChId }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">渠道业务类型</label>
						<div class="col-md-3">
							<select name="channelMerch.Business" id="channelBusiness"
								class="form-control" onchange="channelBusinessChange()">
								<option value="">请选择</option>
								<c:forEach items="${channelBusinessList }" var="channelBusiness">
									<option value="${channelBusiness.MyBusiness }"
										${channelBusiness.MyBusiness == channelMerch.Business ? 'selected' : '' }>${channelBusiness.ChannelBusiness}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">行业</label>
						<div class="col-md-3">
							<input name="myBusiness" id="myBusiness" class="form-control"
								type="text" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">交易时段</label>
						<div class="col-md-3">
							<input name="channelMerch.period" id="period"
								class="form-control" type="text" value="${channelMerch.period }"
								readonly="readonly">
						</div>
						<label class="control-label col-md-2">最后交易时间</label>
						<div class="col-md-3" style="margin-top: 8px;">
							<fmt:formatDate value="${channelMerch.lastTransTime }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每分钟计数</label>
						<div class="col-md-3">
							<input name="channelMerch.perMinNum" id="perMinNum"
								class="form-control" type="text"
								value="${channelMerch.perMinNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每分钟总交易额</label>
						<div class="col-md-3">
							<input name="channelMerch.perMinAmount" id="perMinAmount"
								class="form-control" type="text"
								value="${channelMerch.perMinAmount }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每小时计数</label>
						<div class="col-md-3">
							<input name="channelMerch.perHourNum" id="perHourNum"
								class="form-control" type="text"
								value="${channelMerch.perHourNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每小时总交易额</label>
						<div class="col-md-3">
							<input name="channelMerch.perHourAmount" id="perHourAmount"
								class="form-control" type="text"
								value="${channelMerch.perHourAmount }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每天计数</label>
						<div class="col-md-3">
							<input name="channelMerch.perDayNum" id="perDayNum"
								class="form-control" type="text"
								value="${channelMerch.perDayNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每天总交易额</label>
						<div class="col-md-3">
							<input name="channelMerch.perDayAmount" id="perDayAmount"
								class="form-control" type="text"
								value="${channelMerch.perDayAmount }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每月计数</label>
						<div class="col-md-3">
							<input name="channelMerch.perMonthNum" id="perMonthNum"
								class="form-control" type="text"
								value="${channelMerch.perMonthNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每月总交易额</label>
						<div class="col-md-3">
							<input name="channelMerch.perMonthAmount" id="perMonthAmount"
								class="form-control" type="text"
								value="${channelMerch.perMonthAmount }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">总计数</label>
						<div class="col-md-3">
							<input name="channelMerch.totalNum" id="totalNum"
								class="form-control" type="text"
								value="${channelMerch.totalNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">总交易额</label>
						<div class="col-md-3">
							<input name="channelMerch.totalAmount" id="totalAmount"
								class="form-control" type="text"
								value="${channelMerch.totalAmount }" readonly="readonly">
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success"
			onclick="channelMerchForm()">确定</button>
	</div>
</div>
<script>
	//	表单提交
	function channelMerchForm() {
		var business = $("#channelBusiness").val();
		if(business == ""){
			alert("请选择渠道业务类型");
		}else{
			$("#channelMerchForm").submit();
		}
			
	}

	//	点击渠道业务触发的事件
	function channelBusinessChange() {
		var opt = $("#channelBusiness").val();
		$("#myBusiness").val(opt);
		ajaxRequest("sysBusiness/findByBusiness", {
			Business : opt
		}, function success(resp) {
			jQuery.each(resp.data.sysBusinessMap, function(i, item) {
				$("#period").val(item.Period);
				/* $("#myBusiness").append("<option value='Value'>Text</option>"); */
			});
		});

	}
</script>