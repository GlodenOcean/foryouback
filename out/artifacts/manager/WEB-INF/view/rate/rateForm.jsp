<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>商户费率
		</h4>
	</div>
	<div class="widget-content">
		<!-- target="ajax" 表单将于ajax形式提交并返回json数据，框架会自动处理 -->
		<form id="addRateForm" class="form-horizontal row-border"
			action="rate/${operation }" target="ajax">
			<input type="hidden" id="operation" value="${operation }" />
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">费率名称<span
							class="red">*</span></label>
						<div class="col-md-6">
							<c:if test="${rate == null }">
								<input name="rate.RateName" class="form-control" type="text" />
							</c:if>
							<c:if test="${rate != null }">
								<input name="rate.RateName" class="form-control" type="text"
									value="${rate.RateName }" readonly="readonly" />
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">交易类型<span
							class="red">*</span></label>
						<div class="col-md-6">
							<select name="rate.PayKind" id="PayKind" class="form-control">
								<option value=""
									<c:if test="${rate.PayKind eq '' }">selected</c:if>>请选择</option>
								<option value="余额代付"
									<c:if test="${rate.PayKind eq '余额代付' }">selected</c:if>>余额代付</option>
								<option value="QQ"
									<c:if test="${rate.PayKind eq 'QQ' }">selected</c:if>>QQ</option>
								<option value="银联二维码"
									<c:if test="${rate.PayKind eq '银联二维码' }">selected</c:if>>银联二维码</option>
								<option value="支付宝"
									<c:if test="${rate.PayKind eq '支付宝' }">selected</c:if>>支付宝</option>
								<option value="微信"
									<c:if test="${rate.PayKind eq '微信' }">selected</c:if>>微信</option>
								<option value="WEIXINAPP"
									<c:if test="${rate.PayKind eq 'WEIXINAPP' }">selected</c:if>>WEIXINAPP</option>
								<option value="网关支付"
									<c:if test="${rate.PayKind eq '网关支付' }">selected</c:if>>网关支付</option>
								<option value="快捷支付"
									<c:if test="${rate.PayKind eq '快捷支付' }">selected</c:if>>快捷支付</option>
								<option value="银联在线"
									<c:if test="${rate.PayKind eq '银联在线' }">selected</c:if>>银联在线</option>
								<option value="支付宝H5"
									<c:if test="${rate.PayKind eq '支付宝H5' }">selected</c:if>>支付宝H5</option>
								<option value="QQH5"
									<c:if test="${rate.PayKind eq 'QQH5' }">selected</c:if>>QQH5</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">卡类型<span class="red">*</span></label>
						<div class="col-md-6">
							<c:if test="${rate == null }">
								<input name="rate.CardType" class="form-control" type="text" />
							</c:if>
							<c:if test="${rate != null }">
								<input name="rate.CardType" class="form-control" type="text"
									value="${rate.cardType }" readonly="readonly" />
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">渠道机构号<span
							class="red">*</span></label>
						<div class="col-md-6">
							<c:if test="${rate == null }">
								<input name="rate.ChInstNo" class="form-control" type="text" />
							</c:if>
							<c:if test="${rate != null }">
								<input name="rate.ChInstNo" class="form-control" type="text"
									value="${rate.cardType }" readonly="readonly" />
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">费率计算方法类型<span
							class="red">*</span></label>
						<div class="col-md-6">
							<select name="rate.RateType" id="RateType" class="form-control" onchange="selectOption();">
								<option value=""
									<c:if test="${rate.RateType eq '' }">selected</c:if>>所有</option>
								<option value="0"
									<c:if test="${rate.RateType eq '0' }">selected</c:if>>百分比</option>
								<option value="1"
									<c:if test="${rate.RateType eq '1' }">selected</c:if>>其它（RateFunc）</option>
								<option value="2"
									<c:if test="${rate.RateType eq '2' }">selected</c:if>>固定收费</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">费率比率<span
							class="red">*</span></label>
						<div class="col-md-6">
								<input name="rate.Percent" class="form-control" type="text"
									value="${rate.Percent }" id="Percent" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">最低收费金额<span
							class="red">*</span></label>
						<div class="col-md-6">
								<input name="rate.RateNeedAmount" class="form-control"
									type="text" value="${rate.RateNeedAmount }" id="RateNeedAmount" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">最低手续费<span
							class="red">*</span></label>
						<div class="col-md-6">
								<input name="rate.LowLevel" class="form-control" type="text"
									value="${rate.LowLevel }" id="LowLevel" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">最高收费<span
							class="red">*</span></label>
						<div class="col-md-6">
								<input name="rate.HighLevel" class="form-control" type="text"
									value="${rate.HighLevel }" id="HighLevel" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">计算脚本<span
							class="red">*</span></label>
						<div class="col-md-6">
							<c:if test="${rate == null }">
								<input name="rate.RateFunc" class="form-control" type="text" />
							</c:if>
							<c:if test="${rate != null }">
								<input name="rate.RateFunc" class="form-control" type="text"
									value="${rate.RateFunc }" readonly="readonly" />
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">备注<span class="red">*</span></label>
						<div class="col-md-6">
							<c:if test="${rate == null }">
								<input name="rate.Remark" class="form-control" type="text" />
							</c:if>
							<c:if test="${rate != null }">
								<input name="rate.Remark" class="form-control" type="text"
									value="${rate.Remark }" readonly="readonly" />
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<c:if test="${rate != null }">
						<div class="form-group">
							<label class="control-label col-md-3">更新时间<span
								class="red">*</span></label>
							<div class="col-md-6">
								<fmt:formatDate value="${item.UpdateTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
						</div>
					</c:if>
				</div>
			</div>


		</form>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success" onclick="addrate()">确定</button>
	</div>
</div>
<script>
	
	function selectOption(){
		$("#Percent").removeAttr("readonly");
		$("#RateNeedAmount").removeAttr("readonly");
		$("#LowLevel").removeAttr("readonly");
		$("#HighLevel").removeAttr("readonly");
		$("#Percent").val("");
		$("#RateNeedAmount").val("");
		$("#HighLevel").val("");
		var select = $("#RateType").find("option:selected").val();
		if("1" == select){
			alert("暂不支持此计费类型，请重新选择！");
		}else if("2" == select){
			 $("#Percent").val("0");
			 $("#Percent").attr("readonly","readonly");
			 $("#RateNeedAmount").attr("readonly","readonly");
			 $("#HighLevel").attr("readonly","readonly");
		}
	}
	
	function addrate() {
		$("#addRateForm").submit();
	}
</script>