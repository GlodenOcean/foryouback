<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>

<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>统计信息
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
						<label class="control-label col-md-2">前端商户号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.MerchId" id="channelMerch.MerchId"
								class="form-control" type="text"
								value="${channelMerch.MerchId }">
						</div>
						<label class="control-label col-md-2">前端终端号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.TermId" id="channelMerch.TermId"
								class="form-control" type="text"
								value="${channelMerch.TermId }">
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
						<label class="control-label col-md-2">终端号<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.ChTermId" id="ChTermId"
								class="form-control" type="text"
								value="${channelMerch.ChTermId }">
						</div>
						<label class="control-label col-md-2">交易时段<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.period" id="period"
								class="form-control" type="text" value="${channelMerch.period }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最后交易时间<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.lastTransTime" id="lastTransTime"
								class="form-control" type="text"
								value="${channelMerch.lastTransTime }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每分钟计数<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perMinNum" id="perMinNum"
								class="form-control" type="text"
								value="${channelMerch.perMinNum }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每小时计数<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perHourNum" id="perHourNum"
								class="form-control" type="text"
								value="${channelMerch.perHourNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每天计数<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perDayNum" id="perDayNum"
								class="form-control" type="text"
								value="${channelMerch.perDayNum }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每月计数<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perMonthNum" id="perMonthNum"
								class="form-control" type="text"
								value="${channelMerch.perMonthNum }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">总计数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.totalNum" id="totalNum"
								class="form-control" type="text"
								value="${channelMerch.totalNum }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每分钟总交易额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perMinAmount" id="perMinAmount"
								class="form-control" type="text"
								value="${channelMerch.perMinAmount }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每小时总交易额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perHourAmount" id="perHourAmount"
								class="form-control" type="text"
								value="${channelMerch.perHourAmount }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每天总交易额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perDayAmount" id="perDayAmount"
								class="form-control" type="text"
								value="${channelMerch.perDayAmount }" readonly="readonly">
						</div>
						<label class="control-label col-md-2">每月总交易额<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="channelMerch.perMonthAmount" id="perMonthAmount"
								class="form-control" type="text"
								value="${channelMerch.perMonthAmount }" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">总交易额<span
							class="red">*</span></label>
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
	function channelMerchForm() {
		$("#channelMerchForm").submit();
	}
</script>