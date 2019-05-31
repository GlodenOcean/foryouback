<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="widget box">
		
				<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>日志列表
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
	                	<div class="dataTables_header clearfix">
	                		<form class="searchForm" action="log/search" method="post" class="form-inline" target="tab">
								<table class="searchTable">
									 <tr>
									 	<td nowrap="nowrap" class="col-md-1">起始日期</td>
										<td nowrap="nowrap" class="col-md-3">
												<input class="form-control date-picker" name="startDate" type="text" value="${startDate }" readonly="readonly">
										</td>
									 	<td nowrap="nowrap" class="col-md-1">截止日期</td>
										<td nowrap="nowrap" class="col-md-3">
												<input class="form-control date-picker" name="endDate" type="text" value="${endDate }" readonly="readonly">
										</td>
										<td nowrap="nowrap" class="col-md-1">操作员</td>
										<td nowrap="nowrap" class="col-md-3"><input class="form-control" type="text" name="userLoginId" value="${userLoginId }"></td>
										<td nowrap="nowrap">
											<button type="submit" class="btn green-haze">
												<i class="fa fa-search"></i>&nbsp;查询
											</button> 
										</td>
									</tr>
									<tr>
										<td class="col-md-1">内容</td>
										<td class="col-md-3"><input class="form-control" type="text" name="content" value="${content }"></td>
										<td colspan="5">&nbsp;</td>
									</tr>
								</table>
								
							</form>
                	</div>
                	
                	<!-- 操作按钮 
                	 <div class="button-group">
                	 	<a href="log/delete"><i class="fa fa-trash"></i>删除</a>
                	 </div>
                	-->
                	<table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
	                    <thead>
							<tr>
								<th class="checkbox-column">
									<div class="checker"> 
										<span><input type="checkbox" class="group-checkbox"></span>
									</div>
								</th>
								<th nowrap="nowrap">登陆账号</th>
								<th nowrap="nowrap">操作员</th>
								<th nowrap="nowrap">操作员编号</th>
								<th nowrap="nowrap">操作类型</th>
								<th nowrap="nowrap">对象</th>
								<th nowrap="nowrap">对象编号</th>
								<th nowrap="nowrap">对象名称</th>
								<th nowrap="nowrap">IP地址</th>
								<th nowrap="nowrap" class="text-center">时间</th>
								<th nowrap="nowrap">详情</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${logList }" var="item" varStatus="status">
								<tr>
									<td class="checkbox-column">
										<div class="checker">
											<span><input type="checkbox" name="ids"  value="${item.id }" /></span>
										</div>
									</td>
									<td >${item.loginId}</td>
									<td >${item.userName}</td>
									<td >${item.loginId}</td>
									<td >${item.type}</td>
									<td >${item.operationObj}</td>
									<td >${item.operationObjId}</td>
									<td >${item.operationObjName}</td>
									<td >${item.ip}</td>
									<td  class="text-center">${item.date } ${item.time }</td>
									<td >
									<c:choose>
									   <c:when test="${item.type == '更新' || item.type == '删除'}">  
										   <a href="log/searchDetail?detailId=${item.detailId }" class="today_details" target="tab" >
											查看明细
											</a>     
									   </c:when>
									   <c:otherwise> 
									  	 ${item.remark }
									   </c:otherwise>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty logList }">
								<tr>
									<td colspan="12" class="empty-list">暂无相关结果.</td>
								</tr>
							</c:if>
						</tbody>
	                    
                  </table>
                </div>
		</div>
                  <%@ include file="/include/pagination.jsp" %>
