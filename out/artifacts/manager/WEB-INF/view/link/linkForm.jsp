<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<div class="widget box" style="min-height: 550px" >
	                <div class="widget-header">
	                  <h4>
	                    <i class="fa fa fa-th-list"></i>终端关联表单
	                  </h4>
	                </div>
	               <div class="widget-content">
					 			<form id="terminalLinkForm" action="link/update" class="form-horizontal" target="ajax">
									<div class="form-body">
										<input type="hidden" name="link.uuid" value="${link.uuid}"/>
										<input type="hidden" name="link.ruleName" value="${link.ruleName }" />
										<input type="hidden" name="link.condition_1" value="${link.condition_1 }" />
										
										<div class="row">
											<div class="col-md-7">
												<div class="form-group">
													<label class="col-md-3 control-label">规则名称</label>
													<div class="col-md-4">
														<input class="form-control" type="text" maxlength="32" value="${link.ruleName }" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										
										
										<div class="row">
											<div class="col-md-7">
												<div class="form-group">
													<label class="col-md-3 control-label">机构号<span class="red">*</span></label>
													<div class="col-md-4">
														<input name="link.InstNo" id="InstNo" class="form-control" type="text" maxlength="32" value="${link.InstNo }" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-7">
												<div class="form-group">
													<label class="col-md-3 control-label">商户号<span class="red">*</span></label>
													<div class="col-md-4">
														<input name="link.MerchId" id="MerchId" class="form-control" type="text" maxlength="32" value="${link.MerchId }" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-7">
												<div class="form-group">
													<label class="col-md-3 control-label">终端号<span class="red">*</span></label>
													<div class="col-md-4">
														<input name="link.TermId" id="TermId" class="form-control" type="text" maxlength="32" value="${link.TermId }" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										
										
										<c:forEach items="${defaultParameterList }" var="parm">
											<div class="row">
												<div class="col-md-7">
													<div class="form-group">
														<label class="col-md-3 control-label">${parm.name }</label>
														<div class="col-md-4">
															<c:forEach items="${luaCompareCharList }" var="luaChar">
																<c:if test="${parm.compareChar == luaChar.key }">
																	<input class="form-control" type="text" value="${luaChar.value}" readonly="readonly">
																</c:if>
															</c:forEach>
														</div>	
														<div class="col-md-3">
															<input class="form-control" type="text" value="${parm.value }" readonly="readonly">
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										
										<div style="border-top:1px solid #dedede;padding-top:15px;margin-bottom:10px;">
										<div class="row">
												<div class="col-md-7">
													<div class="form-group">
														<label class="col-md-3 control-label" style="color:#95acff">配置参数</label>
													</div>
												</div>
										</div>
										<c:forEach items="${dbParameterList }" var="parm" varStatus="status">
											<div class="row">
												<div class="col-md-7">
													<div class="form-group">
														<input type="hidden" value="${parm.name }" name="link.itemName${status.index+1 }" />
														<label class="col-md-3 control-label">${parm.name }</label>
														<div class="col-md-4">
															<c:forEach items="${luaCompareCharList }" var="luaChar">
																<c:if test="${parm.compareChar == luaChar.key }">
																	<input class="form-control" type="text" value="${luaChar.value}" readonly="readonly">
																</c:if>
															</c:forEach>
														</div>	
														<div class="col-md-3">
															<input name="link.itemValue${status.index+1}" class="form-control" type="text" value="${parm.value }">
														</div>
													</div>
												</div>
											</div>
											
										</c:forEach>
										</div>
										
										<div class="row">
											<div class="col-md-7">
												<div class="form-group">
													<label class="col-md-3 control-label">&nbsp;</label>
													<div class="col-md-4">
														<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
														<button type="submit" class="btn btn-success">确定</button>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</form>
				   </div>
			</div>


</script>
