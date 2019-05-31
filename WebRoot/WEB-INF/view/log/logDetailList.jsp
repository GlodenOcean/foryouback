<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="widget box">
		
				<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>日志详情列表
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
                	
                	<table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
	                    <thead>
							<tr>
								<th class="checkbox-column">
									<div class="checker"> 
										<span><input type="checkbox" class="group-checkbox"></span>
									</div>
								</th>
								<th>编号</th>
								<th>操作对应表</th>
								<th>修改字段</th>
								<th>旧值</th>
								<th>新值</th>
								<th>操作时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${logDetailList }" var="item" varStatus="status">
								<tr>
									<td class="checkbox-column">
										<div class="checker">
											<span><input type="checkbox" name="ids"  value="${item.id }" /></span>
										</div>
									</td>
									<td>${item.detailId}</td>
									<td>${item.operateTable}</td>
									<td>${item.column }</td>
									<td>${item.oldValue }</td>
									<td>${item.newValue }</td>
									<td>${item.AddTime }</td>
								</tr>
							</c:forEach>
							<c:if test="${empty logDetailList }">
								<tr>
									<td colspan="6" class="empty-list">暂无相关结果.</td>
								</tr>
							</c:if>
						</tbody>
	                    
                  </table>
                </div>
                <div class="widget-footer">
					<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
				</div>
		</div>
                  <%@ include file="/include/pagination.jsp" %>
