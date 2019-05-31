<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="build/custom/js/cl-ajax.js"></script>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>添加商户池配置
		</h4>
	</div>
	<div class="widget-content">
		<div class="row">
			<form id="merchPoolForm" action="merchPool/${operation }"
				class="form-horizontal" target="ajax">

				<input type="hidden" id="operation" value="${operation }" />

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">商户池标识序号<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MerchPool" id="MerchPool"
								class="form-control" type="text" value="${merchPool.MerchPool }"
								maxlength="128"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">最后交易时间<span
							class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.LastTransTime" id="LastTransTime"
								class="form-control" type="text" value="${merchPool.LastTransTime }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">所有本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.totalNum" id="totalNum" class="form-control" type="text"
								value="${merchPool.totalNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">所有本池交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.totalAmount" id="totalAmount" class="form-control" type="text" value="${merchPool.totalAmount }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">当月本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perMonthNum" id="perMonthNum" class="form-control" type="text"
								value="${merchPool.perMonthNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">当月交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perMonthAmount" id="perMonthAmount" class="form-control" type="text" value="${merchPool.perMonthAmount }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">当日本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayNum" id="perDayNum" class="form-control" type="text"
								value="${merchPool.perDayNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">当天交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayAmount" id="perDayAmount" class="form-control" type="text" value="${merchPool.perDayAmount }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">当小时本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perHourNum" id="perHourNum" class="form-control" type="text"
								value="${merchPool.perHourNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">当小时交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perHourAmount" id="perHourAmount" class="form-control" type="text" value="${merchPool.perHourAmount }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">当分钟本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perMinNum" id="perMinNum" class="form-control" type="text"
								value="${merchPool.perMinNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">当分钟交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perMinAmount" id="perMinAmount" class="form-control" type="text" value="${merchPool.perMinAmount }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最大当月本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperMonthNum" id="MAXperMonthNum" class="form-control" type="text"
								value="${merchPool.MAXperMonthNum }">
						</div>
						<label class="control-label col-md-2">最大当月交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperMonthAmount" id="MAXperMonthAmount" class="form-control" type="text" value="${merchPool.MAXperMonthAmount }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最大当日本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperDayNum" id="MAXperDayNum" class="form-control" type="text"
								value="${merchPool.MAXperDayNum }">
						</div>
						<label class="control-label col-md-2">最大当天交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperDayAmount" id="MAXperDayAmount" class="form-control" type="text" value="${merchPool.MAXperDayAmount }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最大当小时本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperHourNum" id="MAXperHourNum" class="form-control" type="text"
								value="${merchPool.MAXperHourNum }">
						</div>
						<label class="control-label col-md-2">最大当小时交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperHourAmount" id="MAXperHourAmount" class="form-control" type="text" value="${merchPool.MAXperHourAmount }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最大当分钟本池交易数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperMinNum" id="MAXperMinNum" class="form-control" type="text"
								value="${merchPool.MAXperMinNum }">
						</div>
						<label class="control-label col-md-2">最大当分钟交易总额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MAXperMinAmount" id="MAXperMinAmount" class="form-control" type="text" value="${merchPool.MAXperMinAmount }">
						</div>
					</div>
				</div>
  
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">最大当日借贷数比<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MaxPercentDCNum" id="MaxPercentDCNum" class="form-control" type="text"
								value="${merchPool.MaxPercentDCNum }" >
						</div>
						<label class="control-label col-md-2">最大当日借贷值比<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.MaxPercentDCTotal" id="MaxPercentDCTotal" class="form-control" type="text" value="${merchPool.MaxPercentDCTotal }">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">当日借记卡笔数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayDebitNum" id="perDayDebitNum" class="form-control" type="text"
								value="${merchPool.perDayDebitNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">当日借记卡交易金额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayDebitTotal" id="perDayDebitTotal" class="form-control" type="text" value="${merchPool.perDayDebitTotal }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
  
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">当日贷记卡笔数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayCreditNum" id="perDayCreditNum" class="form-control" type="text"
								value="${merchPool.perDayCreditNum }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">当日贷记卡交易金额<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayCreditTotal" id=perDayCreditTotal class="form-control" type="text" value="${merchPool.perDayCreditTotal }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
  
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">每天成功笔数<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayNumSuccess" id="perDayNumSuccess" class="form-control" type="text"
								value="${merchPool.perDayNumSuccess }" <c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
						<label class="control-label col-md-2">每天总交易额-成功<span class="red">*</span></label>
						<div class="col-md-3">
							<input name="merchPool.perDayAmountSuccess" id="perDayAmountSuccess" class="form-control" type="text" value="${merchPool.perDayAmountSuccess }"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success"
			onclick="merchPoolForm()">确定</button>
	</div>
</div>
<script>
	function merchPoolForm() {
		$("#merchPoolForm").submit();
	}
</script>