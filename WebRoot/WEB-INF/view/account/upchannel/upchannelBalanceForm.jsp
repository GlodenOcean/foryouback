<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>渠道余额
		</h4>
	</div>
	<div class="widget-content">
		<!-- target="ajax" 表单将于ajax形式提交并返回json数据，框架会自动处理 -->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">渠道ID：</label>
						<div class="col-md-6">${upchannelBalance.ChId}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">渠道名称：</label>
						<div class="col-md-6">${upchannelBalance.ChName}/div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">商户名称：</label>
						<div class="col-md-6">${upchannelBalance.MerchName}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">渠道商户号：</label>
						<div class="col-md-6">${upchannelBalance.ChMerchId}</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">T0额度：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.T0Lines} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">余额：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.Balance} </font>元</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">冻结金额：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.FrozenTotal} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">货币类型：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.Currency} </font>元</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">密钥：</label>
						<div class="col-md-6">${upchannelBalance.SignKey}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">备注信息：</label>
						<div class="col-md-6">${upchannelBalance.ReMark}</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">是否能使用：</label>
						<div class="col-md-6">
						<c:choose>
								<c:when test="${upchannelBalance.CanUse == '1' }">
									<label class="radio-inline">能 </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">不能 </label>
								</c:otherwise>
							</c:choose></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">是否能消费：</label>
						<div class="col-md-6"><c:choose>
								<c:when test="${upchannelBalance.CanSale == '1' }">
									<label class="radio-inline">能 </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">不能 </label>
								</c:otherwise>
							</c:choose></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">能否余额代付 ：</label>
						<div class="col-md-6">
							<c:choose>
								<c:when test="${upchannelBalance.CanBalance == '1' }">
									<label class="radio-inline">能 </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">不能 </label>
								</c:otherwise>
							</c:choose></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">最低余额限制：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.BalanceLimit} </font>元</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">能做风险交易：</label>
						<div class="col-md-6"><c:choose>
								<c:when test="${upchannelBalance.CanDoRisk == '1' }">
									<label class="radio-inline">能 </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">不能 </label>
								</c:otherwise>
							</c:choose></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">当天累积金额：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.AccruAmount} </font>元</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">交易限制金额：</label>
						<div class="col-md-6"><font color="red">${upchannelBalance.TransAmountLimit} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">更新时间：</label>
						<div class="col-md-6"><fmt:formatDate value="${upchannelBalance.LastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</div>
			</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
	</div>
</div>
