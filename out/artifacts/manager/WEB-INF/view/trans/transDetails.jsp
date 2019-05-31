<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="es" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">
          ×
    </button>
	<h5 class="modal-title">
		交易明细
	</h5>
</div>
<div class="modal-body">

<div class="row">
	<div class="col-md-12">
		<div class="widget">
                <div class="widget-content">
					<form  class="row-border" action="#">
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">交易类型:</label>
									<label class="control-text col-md-9">${trans.TransName }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">前端终端号:</label>
									<label class="control-text col-md-9">${trans.Tid }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">前端商户号:</label>
									<label class="control-text col-md-9">${trans.Mid }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">卡号:</label>
									<label class="control-text col-md-9">${trans.CardNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">交易金额:</label>
									<label class="control-text col-md-9">￥${trans.Amount }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">终端流水号:</label>
									<label class="control-text col-md-9">${trans.TermSeq }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">本地流水号:</label>
									<label class="control-text col-md-9">${trans.LocalSeq }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">本地交易时间:</label>
									<label class="control-text col-md-9">${trans.TransDateTime }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">系统参考号:</label>
									<label class="control-text col-md-9">${trans.ChRefNo}</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">T+0状态:</label>
									<label class="control-text col-md-9">
										<c:if test="${fn:startsWith(trans.T0Status, '001')}">
											发往转帐通成功,正在转账
										</c:if>
										<c:if test="${fn:startsWith(trans.T0Status, '002')}">
											转账成功
										</c:if>
										<c:if test="${fn:startsWith(trans.T0Status, '003')}">
											发往转帐通成功,转帐通未返回
										</c:if>
										<c:if test="${fn:startsWith(trans.T0Status, '004')}">
											转账失败
										</c:if>
									</label>
								</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">打印状态:</label>
									<label class="control-text col-md-9">
									${trans.PrintStatus == '0000' ? '打印成功' : '状态未知' }
									</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">原系统参考号:</label>
									<label class="control-text col-md-9">${trans.ChOriRefNo }</label>
								</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">银行卡信息:</label>
									<label class="control-text col-md-9">
										${trans.IssuerBankName }
										<c:if test="${trans.CardType != null}">
											${trans.CardType == '0' ? '借记卡' : '信用卡' } &emsp;
										</c:if>
										<c:if test="${trans.ChPointEntryMode != null }">
											<c:choose>
												<c:when test="${fn:substring(trans.ChPointEntryMode, 1, 2) == '2'}">
												刷卡
												</c:when>
												<c:when test="${fn:substring(trans.ChPointEntryMode, 1, 2) == '5'}">
													插卡
												</c:when>
												<c:when test="${fn:substring(trans.ChPointEntryMode, 1, 2) == '7'}">
													挥卡
												</c:when>
												<c:when test="${fn:substring(trans.ChPointEntryMode, 3, 4) == '1'}">
													有密
												</c:when>
												<c:when test="${fn:substring(trans.ChPointEntryMode, 3, 4) == '2'}">
													无密
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
											&emsp;
										</c:if>
										<c:if test="${trans.OverseasCard != null}">
											${trans.OverseasCard == '1' ? '外卡' : '内卡' }
										</c:if>
										<c:if test="${trans.OverseasCard == null}">
											内卡
										</c:if>
									</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道号:</label>
									<label class="control-text col-md-9">${trans.ChInstNo }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道名称:</label>
									<label class="control-text col-md-9">${trans.ChName }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道商户:</label>
									<label class="control-text col-md-9">${trans.ChMid }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道终端:</label>
									<label class="control-text col-md-9">${trans.ChTid }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">渠道返回码:</label>
									<label class="control-text col-md-9">${trans.ChRsp }</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">订单号:</label>
									<label class="control-text col-md-9">${trans.OrderNo }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">内部错误码:</label>
									<label class="control-text col-md-9">${trans.InterErrCode }</label>
							</div>
						</div>	
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">路由错误:</label>
									<label class="control-text col-md-9">${trans.RuleError }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">B59:</label>
									<label class="control-text col-md-9">${es:shortString(trans.b59,0,20) }</label>
							</div>
						</div>		
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">B18:</label>
									<label class="control-text col-md-9">${trans.b18_mcc }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">T0标志:</label>
									<label class="control-text col-md-9">
										<c:choose>
											<c:when test="${fn:startsWith(trans.T0Status, '001')}">
												是
											</c:when>
											<c:when test="${fn:startsWith(trans.T0Status, '002')}">
												是
											</c:when>
											<c:when test="${fn:startsWith(trans.T0Status, '003')}">
												是
											</c:when>
											<c:otherwise>
												非
											</c:otherwise>
										</c:choose>
									</label>
							</div>
						</div>		
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">API机构号:</label>
									<label class="control-text col-md-9">${trans.TermInstNo }</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">业务名称:</label>
									<label class="control-text col-md-9">${trans.ProductName }</label>
									</label>
							</div>
						</div>		
						
						<div class="row">
						<div class="col-md-6">
									<label class="control-label col-md-3">交易状态:</label>
									<label class="control-text col-md-9">
										<c:if test="${trans.TransStauts != null }">
											<c:if test="${fn:substring(trans.TransStauts, 0, 1) == '1'}">
												收到冲正请求
											</c:if>
											<c:if test="${fn:substring(trans.TransStauts, 1, 2) == '1'}">
												收到撤销请求
											</c:if>
										</c:if>
									</label>
							</div>
							<div class="col-md-6">
									<label class="control-label col-md-3">UUID:</label>
									<label class="control-text col-md-9">${trans.TRANS_UUID }</label>
							</div>
						</div>	
						
						<div class="row">
							<div class="col-md-6">
									<label class="control-label col-md-3">附加域:</label>
									<label class="control-text col-md-9">${trans.ExtraData }</label>
							</div>
						</div>		
						
						
					</form>
                </div>
         </div>
                
	</div>
</div>

</div>

<div class="modal-footer">
	<button type="button" class="btn" data-dismiss="modal" id="closeBtn">关 闭</button>
</div>