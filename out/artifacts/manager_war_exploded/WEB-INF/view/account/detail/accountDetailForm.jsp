<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>用户信息
		</h4>
	</div>
	<div class="widget-content">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">序列号：</label>
						<div class="col-md-5">
							${accountDetail.UUID }
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4"  style="display:inline;">记帐处理名称：</label>
						<div class="col-md-5">
							${accountDetail.AccoutingName }
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">关联交易序号：</label>
						<div class="col-md-5">${accountDetail.OrderNo}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4" >一个订单内的记帐序号：</label>
						<div class="col-md-5" >${accountDetail.AccSN}</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">源账号：</label>
						<div class="col-md-5">${accountDetail.FromAcc}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">源账号类型：</label>
						<div class="col-md-5">
							<c:choose>
								<c:when test="${accountDetail.FromAccType == '1' }">
									<label class="radio-inline">机构 </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">商户</label>
								</c:otherwise>
							</c:choose></div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">目标帐号：</label>
						<div class="col-md-5">${accountDetail.ToAcc}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">目标帐号类型：</label>
						<div class="col-md-5">
							<c:choose>
								<c:when test="${accountDetail.ToAccType == '1' }">
									<label class="radio-inline">机构 </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">商户 </label>
								</c:otherwise>
							</c:choose></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">变动金额：</label>
						<div class="col-md-5"><font color="red">${accountDetail.Amount} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">货币类型：</label>
						<div class="col-md-5">${accountDetail.Currency}</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">源账号余额：</label>
						<div class="col-md-5"><font color="red">${accountDetail.FromBalance} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">目标帐号余额：</label>
						<div class="col-md-5"><font color="red">${accountDetail.ToBalance} </font>元</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">处理前源账号余额：</label>
						<div class="col-md-5"><font color="red">${accountDetail.FromLastBalance} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">处理前目标账号余额：</label>
						<div class="col-md-5"><font color="red">${accountDetail.ToLastBalance} </font>元</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">业务日期:</label>
						<div class="col-md-5"><fmt:formatDate value="${accountDetail.BusiDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">更新时间：</label>
						<div class="col-md-5"><fmt:formatDate value="${accountDetail.UpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-4">备注：</label>
						<div class="col-md-5">${accountDetail.Remark}</div>
					</div>
				</div>
			</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
	</div>
</div>
