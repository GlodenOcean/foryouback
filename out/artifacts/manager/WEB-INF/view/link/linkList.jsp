<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="widget box">
		
			<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>终端关联列表
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
	                	<div class="dataTables_header clearfix">
	                		<form class="searchForm" action="link/search" method="post" target="tab">
								<table class="searchTable">
									<tr>
										<td class="col-md-1">机构号</td>
										<td class="col-md-3"><input class="form-control" type="text" name="instNo" value="${instNo }"></td>
										<td class="col-md-1">终端号</td>
										<td class="col-md-3"><input class="form-control" type="text" name="termId" value="${termId }"></td>
										<td class="col-md-1">商户号</td>
										<td class="col-md-3"><input class="form-control" type="text" name="merchId" value="${merchId }"></td>
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
                		<a href="link/importForm" id="terminalLink_add" target="tab"><i class="fa fa-plus"></i>批量导入</a>
                    	<a href="link/delete" id="terminalLink_del" target="selectAjax"><i class="fa fa-trash"></i>删除</a>
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
							<th>机构号</th>
							<th>商户号</th>
							<th>终端号</th>
							<th>规则名称</th>
							<th>配置1</th>
							<th>配置2</th>
							<th>配置3</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${linkList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"  value="${item.uuid }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.InstNo}</td>
								<td>${item.MerchId}</td>
								<td>${item.TermId}</td>
								<td>${item.ruleName}</td>
								<td>
									${item.itemName1}&emsp;
									<c:if test="${item.itemValue1 != null}">
										(${item.itemValue1})
									</c:if>
								</td>
								<td>${item.itemName2}&emsp;
									<c:if test="${item.itemValue2 != null and item.itemValue2 != 'null'}">
										(${item.itemValue2})
									</c:if>
								</td>
								<td>${item.itemName3}&emsp;
									<c:if test="${item.itemValue3!= null}">
										(${item.itemValue3})
									</c:if>
								</td>
								<td>
									<a href="link/form?id=${item.uuid }" class="btn btn-xs btn-info terminalLink_edit" target="tab" title="修改终端关联" refresh="true">
										修改
									</a> 
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty linkList }">
							<tr>
								<td colspan="10" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                  
                </div>
		</div>
                  <%@ include file="/include/pagination.jsp" %>

