<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="cl" %>

		<div class="widget box">
			
			<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>异常日志列表
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
	                	<div class="dataTables_header clearfix">
	                		<form class="searchForm" action="exceptionlog/search" method="post" class="form-inline" target="tab">
								<table class="searchTable">
									 <tr>
									 	<td class="col-md-1">起始日期</td>
										<td class="col-md-3">
												<input class="form-control date-picker" name="startDate" type="text" value="${startDate }" readonly="readonly">
										</td>
									 	<td class="col-md-1">截止日期</td>
										<td class="col-md-3">
												<input class="form-control date-picker" name="endDate" type="text" value="${endDate }" readonly="readonly">
										</td>
										<td class="col-md-1">操作员</td>
										<td class="col-md-3"><input class="form-control" type="text" name="userLoginId" value="${userLoginId }"></td>
										<td>
											<button type="submit" class="btn green-haze">
												<i class="fa fa-search"></i>&nbsp;查询
											</button> 
										</td>
									</tr>
								</table>
								
							</form>
	                	</div>
                	
                	<!-- 操作按钮 -->
                	 <div class="button-group">
                	 	<a href="exceptionlog/delete" target="selectAjax" rel="ids"><i class="fa fa-trash"></i>删除</a>
                	 </div>
                	
                	<table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
	                    <thead>
							<tr>
								<th class="checkbox-column">
									<div class="checker"> 
										<span><input type="checkbox" class="group-checkbox"></span>
									</div>
								</th>
								<th style="width:100px">用户账号</th>
								<th class="text-center">时间</th>
								<th>请求路径</th>
								<th style="width:60px">来自</th>
								<th>异常信息</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${logList }" var="item">
							<tr>
								<td class="checkbox-column">
								<div class="checker">
										<span><input type="checkbox" name="ids"  value="${item.id }" /></span>
									</div>
								</td>
								<td>${item.userLoginId}</td>
								<td class="text-center">${item.throwDate } ${item.throwTime }</td>
								<td>${item.actionKey }</td>
								<td>${item.fromString }</td>
								<td>
									<a href="exceptionlog/find?id=${item.id }" target="dialog" width="80%">
										${cl:subString(item.throwMessage,0,80) }
									</a>
								</td>
							</tr>
						</c:forEach>
							<c:if test="${empty logList }">
								<tr>
									<td colspan="6" class="empty-list">暂无相关结果.</td>
								</tr>
							</c:if>
						</tbody>
	                    
                  </table>
                </div>
		</div>
                  <%@ include file="/include/pagination.jsp" %>
