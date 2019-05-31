<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="es/ui/function" prefix="cl"%>

		<div class="widget box">
		
			<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>角色列表
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
                	<!-- 查询 -->
	                	<div class="dataTables_header clearfix">
	                		<form class="searchForm" action="role/search" method="post" class="form-inline" target="tab">
	                			<input type="hidden" name="orderField" value="${orderField }" />
	                			<input type="hidden" name="orderDirection" value="${orderDirection }" />
								<table class="searchTable">
									 <tr>
										<td class="col-md-1">角色名</td>
										<td class="col-md-3"><input class="form-control" type="text" name="roleName" value="${roleName }"></td>
										<td>
											<button type="submit" class="btn">
												<i class="fa fa-search"></i>&nbsp;查询
											</button> 
										</td>
										<td class="col-md-8">&nbsp;</td>
									 </tr>
								</table>
							</form>
	                	</div>
                	
                	<!-- 操作按钮 -->
                	 <div class="button-group">
                	 	<a href="role/form" target="dialog"><i class="fa fa-plus"></i>添加</a>
                    	<a href="role/export"><i class="fa fa-file-excel-o"></i>导出</a>
                    	<a href="role/delete" target="selectAjax" title="确定要删除?"><i class="fa fa-trash"></i>删除</a>
                	 </div>
                
                  <!-- 内容 -->
                  <table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
                    <thead>
						<tr>
							<th class="checkbox-column">
								<div class="checker"> 
									<span><input type="checkbox" class="group-checkbox"></span>
								</div>
							</th>
							<th style="width:50px">序号</th>
							<th style="width:200px" class="sortCloumn" orderField="roleName">角色名称</th>
							<th style="width:350px">描述</th>
							<th class="text-center sortCloumn" orderField="updateDateTime">修改时间</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${roleList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids" value="${item.id }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.roleName}</td>
								<td>
									${cl:shortString(item.description,0,25)}
								</td>
								<td class="text-center">${item.updateDateTime }</td>
								<td class="text-center">
									<a href="role/toAllotAccess?id=${item.id }" class="btn btn-xs btn-info role_access" target="tab" refresh="true">
										修改角色权限
									</a> 
									&emsp;
									<a href="role/form?id=${item.id }" class="btn btn-xs btn-info role_edit" target="dialog">
										修改
									</a> 
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty roleList }">
							<tr class="odd gradeX">
								<td colspan="5" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                </div>
                
		</div>
		<%@ include file="/include/pagination.jsp" %>


