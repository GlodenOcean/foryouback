<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">
		
                <div class="widget-header">
                  <h4>
                    <i class="icon-reorder"></i>前端商戶列表
                  </h4>
                </div>
                
                <div class="widget-content  no-padding">
	                <div class="dataTables_header clearfix">
	               		<!-- class=searchForm target=tab 必须 -->
	               		<form class="searchForm" action="merch/search" method="post" class="form-inline" target="tab">
							<table class="searchTable">
								 <tr>
									<td class="col-md-1">商户号</td>
									<td class="col-md-3"><input class="form-control" type="text" name="MerchId" value="${MerchId }"></td>
									<td class="col-md-1">商户名称</td>
									<td class="col-md-3"><input class="form-control" type="text" name="MerchName" value="${MerchName }"></td>
									<td class="col-md-1">机构号</td>
									<td class="col-md-3"><input class="form-control" type="text" name="InstNo" value="${InstNo }"></td>
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
                  	<a href="merch/form" id="merch_add" class="html-modal btn btn-xs" target="tab" refresh="true"><i class="fa fa-plus"></i>添加</a>
                  	<!-- 使用title会弹出确认框 -->
                  	<a href="merch/delete" id="merch_del" class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?"><i class="fa fa-plus"></i>删除</a>
                  	<a href="merch/exportMerch"
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
							<th style="width:50px">序号</th>
							<th>商户编号/商户名称</th>
							<th>商户余额</th>
							<th>商户状态</th>
							<th>T0状态</th>
							<th>所属机构</th>
							<th>上级商户号</th>
							<th>行业</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${MerchList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids" value="${item.MerchId }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchId}<br>${item.MerchName}</td>
								<td><div style="float: right;">
									<c:forEach items="${AccountMerchList }" var="accountMerch">
										<c:if test="${fn:contains(accountMerch.AccountNo, item.MerchId) and fn:contains(accountMerch.AccountNo, 'AM_')}">
											<font color="red">${accountMerch.Balance}</font>元
										</c:if>
									</c:forEach></div>
								</td>
								<td>
									<c:if test="${item.MerchStatus == '0' }">
										<span class="label label-warning">
											禁用
										</span>
									</c:if>
									<c:if test="${item.MerchStatus == '1' }">
										<span class="label label-success">
											启用
										</span>
									</c:if>
								</td>
								<td>
									<c:forEach items="${t0TypeEnumList }" var="t0Type">
										<c:if test="${item.T0_Contorl eq t0Type.value }">
											<span class="label label-info">${t0Type.desc}</span>
										</c:if>
									</c:forEach>

								</td>
								<td>${item.InstNo}</td>
								<td>${item.UpMerchId}</td>
								<td>${item.Business}</td>
								<td>
									<%-- <a href="merch/view?merchId=${item.MerchId}" class="btn btn-xs btn-info user_edit" title="查看商户" target="tab" refresh="true">
										<i class="fa fa-pencil"></i>查看
									</a>  --%>
									<a href="merch/form?merchId=${item.MerchId}" class="btn btn-xs btn-info user_edit" title="修改商户" target="tab" refresh="true">
										<i class="fa fa-pencil"></i>修改
									</a> 
									
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty MerchList }">
							<tr class="odd gradeX">
								<td colspan="10" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                  <%@ include file="/include/pagination.jsp" %>
                  
                </div>
		</div>
	</div>
</div>
