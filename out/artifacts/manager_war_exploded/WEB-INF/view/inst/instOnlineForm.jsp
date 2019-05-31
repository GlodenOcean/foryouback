<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>机构信息
		</h4>
	</div>
	<div class="widget-content">
		<form action="instOnline/${operation }" id="addInstOnlineForm"
			method="post" class="form-horizontal" target="ajax">
			<input type="hidden" name="instOnline.UUID" value="${vo.UUID }" /> <input
				type="hidden" id="operation" value="${operation }" />
			<div class="form-body">

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">机构标识<span
							class="red">*</span></label>
						<div class="col-md-3" style="margin-top: 8px;">
							<input name="instOnline.InstNo" id="InstNo" class="form-control"
								type="text" maxlength="8"
								<c:if test="${operation eq 'update' }"> value="${vo.InstNo }" readonly="readonly"</c:if>
								<c:if test="${operation ne 'update' }"> value="${maxInstNo }"</c:if>>
						</div>
						<label class="control-label col-md-2">机构名称<span
							class="red">*</span></label>
						<div class="col-md-3" style="margin-top: 8px;">
							<input name="instOnline.InstName" id="InstName"
								class="form-control" type="text" value="${vo.InstName }"
								maxlength="32"
								<c:if test="${operation eq 'update' }">readonly="readonly"</c:if>>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">机构类型</label>
						<div class="col-md-3">
							<div class="radio-list">
								<c:choose>
									<c:when test="${vo == null || vo.InstType == '1' }">
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstType" value="1" checked="checked">渠道机构
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstType" value="0">前端机构
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstType" value="1">渠道机构
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstType" value="0" checked="checked">前端机构
										</label>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<label class="control-label col-md-2">机构状态</label>
						<div class="col-md-3">
							<div class="radio-list">
								<c:choose>
									<c:when test="${vo == null || vo.InstStatus == '1' }">
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstStatus" value="1" checked="checked">开通
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstStatus" value="0">关闭
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstStatus" value="1">开通
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.InstStatus" value="0" checked="checked">关闭
										</label>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">T0权限控制</label>
						<div class="col-md-3">
							<div class="radio-list">
								<c:choose>
									<c:when test="${vo == null || vo.T0_Contorl == '1' }">
										<label class="radio-inline"> <input type="radio"
											name="instOnline.T0_Contorl" value="1" checked="checked">启用
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.T0_Contorl" value="0">关闭
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.T0_Contorl" value="1">启用
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.T0_Contorl" value="0" checked="checked">关闭
										</label>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<label class="control-label col-md-2">前端签名模式</label>
						<div class="col-md-3">
							<div class="radio-list">
								<c:choose>
									<c:when test="${vo == null || vo.EncWay == '1' }">
										<label class="radio-inline"> <input type="radio"
											name="instOnline.EncWay" value="1" checked="checked">机构模式
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.EncWay" value="0">商户模式
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.EncWay" value="1">机构模式
										</label>
										<label class="radio-inline"> <input type="radio"
											name="instOnline.EncWay" value="0" checked="checked">商户模式
										</label>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group">
							<label class="control-label col-md-2">签名密钥</label>
							<div class="col-md-3">
								<input id="EncKey" name="instOnline.EncKey"
									value="${vo.EncKey }" class="form-control" type="text"
									placeholder="后台自动生成" readonly="readonly" />
							</div>
							<label class="control-label col-md-2">回调通知url</label>
							<div class="col-md-3">
								<input id="CallbackUrl" name="instOnline.CallbackUrl"
									value="${vo.CallbackUrl }" class="form-control" type="text" />
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="control-label col-md-2">添加时间</label>
								<div class="col-md-3" style="margin-top: 8px;">
									<c:if test="${vo ne null }">
										<fmt:formatDate value="${vo.AddTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</c:if>
									<c:if test="${vo eq null }">
										<input id="AddTime" name="instOnline.AddTime"
											class="form-control" type="text" />
									</c:if>
								</div>
								<label class="control-label col-md-2">最后更新时间</label>
								<div class="col-md-3" style="margin-top: 8px;">
									<c:if test="${vo ne null }">
										<fmt:formatDate value="${vo.UpdateTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</c:if>
									<c:if test="${vo eq null }">
										<input id="UpdateTime" name="instOnline.UpdateTime"
											class="form-control" type="text" />
									</c:if>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group">
							<label class="control-label col-md-2">同步流水号</label>
							<div class="col-md-3">
								<input id="SyncSN" name="instOnline.SyncSN"
									value="${vo.SyncSN }" class="form-control" type="text" />
							</div>
							<label class="control-label col-md-2">通道池</label>
							<div class="col-md-3">
								<input id="ChannelPool" name="instOnline.ChannelPool"
									value="${vo.ChannelPool }" class="form-control" type="text" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">银联固定二维码通知地址</label>
						<div class="col-md-3">
							<input id="uniFixCodeNoticeURL"
								name="instOnline.uniFixCodeNoticeURL"
								value="${vo.uniFixCodeNoticeURL }" class="form-control"
								type="text" />
						</div>
						<label class="control-label col-md-2">清算文件标识</label>
						<div class="col-md-3">
							<input id="SettleFlag" name="instOnline.SettleFlag"
								value="${vo.SettleFlag }" class="form-control" type="text" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">入账类型<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.InCommType" class="form-control">
								<option value="0" ${vo.InCommType eq '0' ? 'selected' : '' }>入账到商户</option>
								<option value="1" ${vo.InCommType eq '1' ? 'selected' : '' }>入账到机构</option>
							</select>
						</div>
						<label class="control-label col-md-2">无卡消费(网页)指定渠道<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.PayforType" class="form-control">
								<option value="">请选择</option>
								<option value="0" ${vo.PayforType eq '0' ? 'selected' : '' }>余额代付</option>
								<option value="1" ${vo.PayforType eq '1' ? 'selected' : '' }>垫资代付</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">备注</label>
						<div class="col-md-3">
							<input id="Remark" name="instOnline.Remark" value="${vo.Remark }"
								class="form-control" type="text" />
						</div>
						<label class="control-label col-md-2">是否T1余额出账<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.IsT1YECZ" class="form-control">
								<option value="">请选择</option>
								<option value="1" ${vo.IsT1YECZ eq '1' ? 'selected' : '' }>是</option>
								<option value="0" ${vo.IsT1YECZ ne '1' ? 'selected' : '' }>否</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">京东支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.JDFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">${rate.RateName}
									<option value="${rate.RateName }"
										${vo.JDFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">银联二维码支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.YLQrCodeFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '银联二维码' }">
										<option value="${rate.RateName }"
											${vo.YLQrCodeFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">QQ支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.QQFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq 'QQ' }">
										<option value="${rate.RateName }"
											${vo.QQFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">微信支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.WXFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '微信' }">
										<option value="${rate.RateName }"
											${vo.WXFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
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
							<select name="instOnline.WXH5Fee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${vo.WXH5Fee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">微信APP支付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.WXAPPFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq 'WEIXINAPP' }">
										<option value="${rate.RateName }"
											${vo.WXAPPFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">支付宝扫码手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.AliFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '支付宝' }">
										<option value="${rate.RateName }"
											${vo.AliFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">无卡快捷手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.NoCardFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '无卡快捷' }">
										<option value="${rate.RateName }"
											${vo.NoCardFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
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
							<select name="instOnline.BalancePayFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${vo.BalancePayFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-md-2">垫资代付手续费<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.DZPayFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<option value="${rate.RateName }"
										${vo.DZPayFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-2">快捷支付的费率<span
							class="red">*</span></label>
						<div class="col-md-3">
							<select name="instOnline.QPayFee" class="form-control">
								<option value="">无指定</option>
								<c:forEach items="${rateList }" var="rate">
									<c:if test="${rate.PayKind eq '快捷支付' }">
										<option value="${rate.RateName }"
											${vo.QPayFee eq rate.RateName ? 'selected' : '' }>${rate.RateName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- END FORM-->
<div class="widget-footer">
	<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
	<button type="button" class="btn btn-success" onclick="addInst()">确定</button>
</div>

<script>
	$(function() {
		var vo = '${vo}';
		if (vo == "") {
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
	function addInst() {
		$("#addInstOnlineForm").submit();
	}
</script>