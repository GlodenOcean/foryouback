<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<div class="widget box">
		
			<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>机构列表
					</h4>
				</div>
                
                <div class="widget-content  no-padding">
	                	<div class="dataTables_header clearfix">
	                		<form class="searchForm" action="instOnline/search" method="post" target="tab">
								<table class="searchTable">
									<tr>
										<td class="col-md-1">机构名称</td>
										<td class="col-md-3"><input class="form-control" type="text" name="InstName" value="${InstName }"></td>
										<td class="col-md-1">机构标识</td>
										<td class="col-md-3"><input class="form-control" type="text" name="InstNo" value="${InstNo }"></td>
										<td class="col-md-1">机构状态</td>
										<td class="col-md-3">
											<select class="form-control" name="InstStatus">
												<option value="">全部</option>
												<option value="1" ${InstStatus == '1' ? 'selected' : '' }>开通</option>
												<option value="0" ${InstStatus == '0' ? 'selected' : '' }>关闭</option>
											</select>
										</td>
									 </tr>
									<tr>
										<td class="col-md-1">是否T1余额出账</td>
										<td class="col-md-3">
											<select class="form-control" name="IsT1YECZ">
												<option value="">全部</option>
												<option value="1" ${IsT1YECZ eq '1' ? 'selected' : '' }>是</option>
												<option value="0" ${IsT1YECZ ne '1' ? 'selected' : '' }>否</option>
											</select>
										</td>
										<td>
											<button type="submit" class="btn green-haze">
												<i class="fa fa-search"></i>&nbsp;查询
											</button> 
										</td>
									 </tr>
								</table>
							</form>
                	</div>
                	
                	<div class="button-group">
                		<a href="instOnline/form" id="inst_add" target="tab" title="添加机构"><i class="fa fa-plus"></i>添加</a>
                    	<a href="instOnline/delete" id="inst_del" target="selectAjax"><i class="fa fa-trash"></i>删除</a>
                    	<a href="instOnline/exportInst"
							target="Ajax"><i class="fa fa-file-excel-o"></i>导出明细</a>
                	</div>
                
                  <table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
                    <thead>
						<tr>
							<th class="checkbox-column">
								<div class="checker"> 
									<span><input type="checkbox" class="group-checkbox"></span>
								</div>
							</th>
							<th nowrap="nowrap" style="width: 2%">序号</th>
							<th>机构名称</th>
							<th>机构标识</th>
							<th>机构余额</th>
							<th class="text-center">机构状态</th>
							<th>机构类型</th>
							<th>T1余额出账</th>
							<th>前端签名模式</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${instList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"  value="${item.InstNo }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.InstName}</td>
								<td>${item.InstNo}</td>
								<td><div style="float: right;">
									<c:forEach items="${AccountInstList }" var="accountInst">
										<c:if test="${fn:contains(accountInst.AccountNo, item.InstNo) and fn:contains(accountInst.AccountNo, 'AI_')}">
											<font color="red">${accountInst.Balance}</font>元
										</c:if>
									</c:forEach></div>
								</td>
								<td class="text-center">
									<c:if test="${item.InstStatus == '0' }">
										<span class="label label-sm label-warning">
											关闭
										</span>
									</c:if>
									<c:if test="${item.InstStatus == '1' }">
										<span class="label label-sm label-success">
											开通
										</span>
									</c:if>
								</td>
								<td>
									<c:if test="${item.InstType == '0' }">
										<span class="label label-sm label-warning">
											前端机构
										</span>
									</c:if>
									<c:if test="${item.InstType == '1' }">
										<span class="label label-sm label-success">
											渠道机构
										</span>
									</c:if>
								</td>
								<td class="text-center">
									<c:if test="${item.IsT1YECZ ne '1' }">
										<span class="label label-sm label-warning">
											否
										</span>
									</c:if>
									<c:if test="${item.IsT1YECZ eq '1' }">
										<span class="label label-sm label-success">
											是
										</span>
									</c:if>
								</td>
								<td>
									<c:if test="${item.EncWay == '0' }">
										<span class="label label-sm label-warning">
											商户模式
										</span>
									</c:if>
									<c:if test="${item.EncWay == '1' }">
										<span class="label label-sm label-success">
											机构模式
										</span>
									</c:if>
								</td>
								<td class="text-center">
										<a href="instOnline/form?InstNo=${item.InstNo }" class="btn btn-xs btn-info inst_edit" target="tab" title="修改机构" refresh="true">
											<i class="fa fa-pencil"></i>修改
										</a> 
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty instList }">
							<tr>
								<td colspan="5" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                </div>
		</div>
                  <%@ include file="/include/pagination.jsp" %>
