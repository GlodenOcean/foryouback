<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">
		
                <div class="widget-header">
                  <h4>
                    <i class="icon-reorder"></i>银行编码列表
                  </h4>
                </div>
                
                <div class="widget-content  no-padding">
	                <div class="dataTables_header clearfix">
	               		<!-- class=searchForm target=tab 必须 -->
	               		<form class="searchForm" action="bankCode/search" method="post" class="form-inline" target="tab">
							<table class="searchTable">
								 <tr>
									<td class="col-md-1">银行联行号</td>
									<td class="col-md-3"><input class="form-control" type="text" name="BankCode" value="${BankCode }"></td>
									<td class="col-md-1">银行名称</td>
									<td class="col-md-3"><input class="form-control" type="text" name="BankName" value="${BankName }"></td>
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
                  	<a href="bankCode/form" id="bankCode_add" class="html-modal btn btn-xs" target="tab" refresh="true"><i class="fa fa-plus"></i>添加</a>
                  	<!-- 使用title会弹出确认框 -->
                  	<a href="bankCode/delete" id="bankCode_del" class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?"><i class="fa fa-plus"></i>删除</a>
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
							<th>银行联行号</th>
							<th>银行名称</th>
							<th>银行营业地址</th>
							<th>银行电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${BankCodeList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids" value="${item.BankCodeId }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.BankCode}</td>
								<td>${item.BankName}</td>
								<td>${item.BankAdder}</td>
								<td>${item.BankTelNo}</td>
								<td>
									<a href="bankCode/form?bankCode=${item.BankCodeId}" class="btn btn-xs btn-info user_edit" title="修改商户" target="tab" refresh="true">
										<i class="fa fa-pencil"></i>修改
									</a> 
									
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty BankCodeList }">
							<tr class="odd gradeX">
								<td colspan="6" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                  <%@ include file="/include/pagination.jsp" %>
                  
                </div>
		</div>
	</div>
</div>
