<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="widget box">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>制定商户池配置
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="merchPoolMap/search" method="post"
						class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td nowrap="nowrap" class="col-md-1">唯一序列号</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="SeqNo" value="${SeqNo }"></td>
								<td nowrap="nowrap" class="col-md-1">商户池标识序号</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="MerchPool" value="${MerchPool }"></td>
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
					<a href="merchPoolMap/form" id="merch_add"
						class="html-modal btn btn-xs" target="tab" refresh="true"><i
						class="fa fa-plus"></i>添加</a>
					<!-- 使用title会弹出确认框 -->
					<a href="merchPoolMap/delete" id="merch_del"
						class="delete-link btn btn-xs" target="selectAjax" title="确定要删除?"><i
						class="fa fa-plus"></i>删除</a>
				</div>

				<table
					class="table table-hover table-checkable table-striped table-bordered table-highlight-head">
					<thead>
						<tr>
							<th class="checkbox-column">
								<div class="checker">
									<span><input type="checkbox" class="group-checkbox"></span>
								</div>
							</th>
							<th style="width: 50px">序号</th>
							<th nowrap="nowrap">唯一序列号</th>
							<th nowrap="nowrap">商户池标识序号</th>
							<th nowrap="nowrap">选取条件</th>
							<th nowrap="nowrap">关联池匹配条件</th>
							<th nowrap="nowrap">ConditionY输入参数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${merchPoolMapList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"
											value="${item.SeqNo }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.SeqNo}</td>
								<td>${item.MerchPool}</td>
								<td>${item.ConditionX}</td>
								<td>${item.ConditionY}</td>
								<td>${item.paraY}</td>
								<td><a href="merchPoolMap/form?SeqNo=${item.SeqNo}"
									class="btn btn-xs btn-info user_edit" title="修改商户池" target="tab"
									refresh="true"> <i class="fa fa-pencil"></i>修改
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty merchPoolMapList }">
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
