<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>商戶列表
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="businessMap/searchMerch" method="post"
						class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td nowrap="nowrap" class="col-md-1">商户业务类型</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="MerchBusiness" value="${MerchBusiness }"></td>
								<td nowrap="nowrap" class="col-md-1">前端业务类型名称</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="MerchBusinessTypeName" value="${MerchBusinessTypeName }"></td>
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
					<!-- 添加用户另开界面 -->
					<a href="businessMap/formMerch" id="merch_add"
						class="html-modal btn btn-xs" target="tab" refresh="true"><i
						class="fa fa-plus"></i>添加</a>
					<!-- 使用title会弹出确认框 -->
				</div>

				<table
					class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
					<thead>
						<tr>
							<th style="width: 50px">序号</th>
							<th>商户业务类型</th>
							<th>前端业务类型名称</th>
							<th>服务的业务类型</th>
							<th>更新时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${merchBusinessMapList }" var="item" varStatus="status">
							<tr>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.MerchBusiness}</td>
								<td>${item.MerchBusinessTypeName}</td>
								<td>${item.MyBusiness}</td>
								<td><fmt:formatDate value="${item.UpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
								<a href="businessMap/formMerch?MerchBusiness=${item.MerchBusiness}&MyBusiness=${item.MyBusiness}"
									class="btn btn-xs btn-info user_edit" title="修改商户" target="tab"
									refresh="true"> <i class="fa fa-pencil"></i>修改</a> 
								<a href="businessMap/deleteMerch?MerchBusiness=${item.MerchBusiness}&MyBusiness=${item.MyBusiness}"
									id="merch_del" class="delete-link btn btn-xs" title="确定要删除?"
									target="ajax"><i class="fa fa-minus"></i>删除</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty merchBusinessMapList }">
							<tr class="odd gradeX">
								<td colspan="5" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>

				</table>

				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
