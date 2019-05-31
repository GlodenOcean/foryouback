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
		<!-- target="ajax" 表单将于ajax形式提交并返回json数据，框架会自动处理 -->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">账号：</label>
						<div class="col-md-6">
							${account.AccountNo }
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">帐号类型：</label>
						<div class="col-md-6">
							<c:choose>
								<c:when test="${account.AccountType == '2' }">
									<label class="radio-inline">总帐： </label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline">分账： </label>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">货币类型：</label>
						<div class="col-md-6">${account.Currency}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">当前余额：</label>
						<div class="col-md-6"><font color="red">${account.Balance} </font>元</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">冻结金额：</label>
						<div class="col-md-6"><font color="red">${account.FrozenTotal} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">上次余额：</label>
						<div class="col-md-6"><font color="red">${account.LastBalance} </font>元</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">上次冻结金额：</label>
						<div class="col-md-6"><font color="red">${account.LastFrozenTotal} </font>元</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">备注：</label>
						<div class="col-md-6">${account.Remark}</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">上次更新时间：</label>
						<div class="col-md-6"><fmt:formatDate value="${account.UpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">业务日期：</label>
						<div class="col-md-6"><fmt:formatDate value="${account.BusiDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</div>
			</div>

			
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">更新时间：</label>
						<div class="col-md-6"><fmt:formatDate value="${account.UpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">状态：</label>
						<div class="col-md-6">
							<div class="radio-list">
								<c:choose>
									<c:when test="${account == null || account.AccountStatus == '1' }">
										<label class="radio-inline"> <input type="radio"
											name="account.status" value="1" checked="checked">启用
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="account.status" value="0" checked="checked">禁用
										</label>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
	</div>
</div>
