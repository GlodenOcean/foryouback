<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>行业信息列表
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="sysBusiness/search"
						method="post" class="form-inline" target="tab">
						<table class="searchTable">
							<tr>
								<td nowrap="nowrap" class="col-md-1">行业</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="Business" value="${Business }"></td>
								<td nowrap="nowrap" class="col-md-1">交易时段</td>
								<td class="col-md-3"><input class="form-control"
									type="text" name="Period" value="${Period }"></td>
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
					<a href="sysBusiness/form" id="formChannel_add"
						class="html-modal btn btn-xs" target="tab" refresh="true"><i
						class="fa fa-plus"></i>添加</a>
					<!-- 使用title会弹出确认框 -->
					<a href="sysBusiness/delete" id="merch_del"
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
							<th>行业</th>
							<th>开始时间段</th>
							<th>结束时间段</th>
							<th>交易时段</th>
							<th>最小金额</th>
							<th>最大金额</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sysBusinessList }" var="item"
							varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"
											value="${item.Business }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.Business}</td>
								<td>${item.StartTime}</td>
								<td>${item.EndTime}</td>
								<td>${item.Period}</td>
								<td>${item.MinAmount}</td>
								<td>${item.MaxAmount}</td>
								<td><a
									href="sysBusiness/form?Business=${item.Business}"
									class="btn btn-xs btn-info user_edit" title="修改商户" target="tab"
									refresh="true"> <i class="fa fa-pencil"></i>修改
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty sysBusinessList }">
							<tr class="odd gradeX">
								<td colspan="9" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>

				</table>

				<%@ include file="/include/pagination.jsp"%>

			</div>
		</div>
	</div>
</div>
