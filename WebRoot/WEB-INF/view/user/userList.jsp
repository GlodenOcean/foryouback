<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="widget box" id="widgetBox">
		
				<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>用户列表
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
                
	                	<div class="dataTables_header clearfix">
	                		<!-- class=searchForm target=tab 必须 -->
	                		<form class="searchForm" action="user/search" method="post" class="form-inline" target="tab">
								<table class="searchTable">
									 <tr>
										<td class="col-md-1">用户名</td>
										<td class="col-md-3"><input class="form-control" type="text" name="loginId" value="${loginId }"></td>
										<td class="col-md-1">姓名</td>
										<td class="col-md-3"><input class="form-control" type="text" name="userName" value="${userName }"></td>
										<td class="col-md-1">使用状态</td>
										<td class="col-md-3">
											<select class="form-control" name="status">
												<option value="">全部</option>
												<option value="1" ${status == '1' ? 'selected' : '' }>启用</option>
												<option value="0" ${status == '0' ? 'selected' : '' }>禁用</option>
											</select>
										</td>
										<td >
											<button type="submit" class="btn green-haze">
												<i class="fa fa-search"></i>&nbsp;查询
											</button> 
										</td>
									 </tr>
								</table>
							</form>
	                	</div>
                	
                  <div class="button-group">
                    <!-- 添加用户另开界面 -->
                  	<a href="user/form" id="user_add" target="tab"><i class="fa fa-plus"></i>添加用户</a>
                  	<!-- 使用title会弹出确认框 -->
                  	<a href="user/delete" id="user_del" target="selectAjax" title="确定要删除?"><i class="fa fa-trash"></i>删除</a>
                  </div>
                
                  <table class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
                    <thead>
						<tr>
							<th class="checkbox-column">
								<div class="checker"> 
									<span><input type="checkbox" class="group-checkbox"></span>
								</div>
							</th>
							<th style="width:50px">序号</th>
							<th>用户名</th>
							<th>姓名</th>
							<th>角色</th>
							<th class="text-center">修改时间</th>
							<th class="text-center">使用状态</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"  value="${item.id }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.loginId}</td>
								<td>${item.userName}</td>
								<td>${item.roleName == null ? '无' : item.roleName}</td>
								<td class="text-center">${item.updateTime}</td>
								<td class="text-center">
									<c:if test="${item.status == '0' }">
										<span class="label label-warning">
											禁用
										</span>
									</c:if>
									<c:if test="${item.status == '1' }">
										<span class="label label-success">
											启用
										</span>
									</c:if>
								</td>
								<td class="text-center">
										<!-- target="dialog" 请求链接需返回html页面然后已dialog窗口模式展示 -->
										<a href="user/openResetPassword?userId=${item.id }" class="btn btn-xs btn-info user_reset" target="dialog">
											重置密码
										</a>  
									&emsp;
									    <!-- refresh="true" 每次点击都会刷新已经打开的tab -->
										<a href="user/form?id=${item.id }" class="btn btn-xs btn-info user_edit" title="修改用户" target="tab" refresh="true">
											修改
										</a> 
									&emsp;
									    <!-- target="ajax" 请求连接需返回json数据,框架会根据结果自动处理,成功会刷新当前页面 -->
										<a href="user/changeStatus?id=${item.id }" class="btn btn-xs btn-info user_changeStatus" target="ajax">
											${item.status == '0' ? '启用' : '禁用' }
										</a> 
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty userList }">
							<tr class="odd gradeX">
								<td colspan="10" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                </div>
		</div>
		<%@ include file="/include/pagination.jsp" %>
