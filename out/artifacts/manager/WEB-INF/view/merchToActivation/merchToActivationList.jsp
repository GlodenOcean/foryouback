<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="widget box" id="widgetBox">
		
				<div class="widget-header">
					<h4>
						<i class="fa fa fa-th-list"></i>非接激活管理
					</h4>
				</div>
		
                <div class="widget-content  no-padding">
                
	                	<div class="dataTables_header clearfix">
	                		<form class="searchForm" action="merchToActivation/search" method="post" class="form-inline" target="tab">
								<table class="searchTable">
									 <tr>
										<td class="col-md-1">商户编号</td>
										<td class="col-md-3"><input class="form-control" type="text" name="MerchId" value="${MerchId }"></td>
										<td class="col-md-1">终端号</td>
										<td class="col-md-3"><input class="form-control" type="text" name="TermId" value="${TermId }"></td>
										<td class="col-md-1">交易类型</td>
										<td class="col-md-3">
											<select class="form-control" name="ICFlag">
												<option value="">全部</option>
												<option value="0" ${ICFlag == '0' ? 'selected' : '' }>磁条卡补刷</option>
												<option value="1" ${ICFlag == '1' ? 'selected' : '' }>非接激活</option>
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
                  	<a href="merchToActivation/toImport" id="user_add" target="tab"><i class="fa fa-plus"></i>批量导入</a>
                  	<a href="merchToActivation/delete" id="user_del" target="selectAjax" title="确定要删除?"><i class="fa fa-trash"></i>删除</a>
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
							<th>渠道号</th>
							<th>商户编号</th>
							<th>终端号</th>
							<th>交易笔数</th>
							<th>成功笔数</th>
							<th>交易金额</th>
							<th>卡号</th>
							<th>批次</th>
							<th class="text-center">任务开始时间</th>
							<th class="text-center">任务结束时间</th>
							<th class="text-center">交易类型</th>
							<th>完成笔数</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${merchToActivationList }" var="item" varStatus="status">
							<tr>
								<td class="checkbox-column">
									<div class="checker">
										<span><input type="checkbox" name="ids"  value="${item.UUID }" /></span>
									</div>
								</td>
								<td>${status.index+(page.index-1)*page.size+1}</td>
								<td>${item.InstNo}</td>
								<td>${item.MerchId}</td>
								<td>${item.TermId}</td>
								<td>${item.TotalNum}</td>
								<td>${item.CompletedNum}</td>
								<td>${item.Amount}</td>
								<td>${item.CardNo}</td>
								<td>${item.BatchNo}</td>
								<td class="text-center">${item.StartDate}</td>
								<td class="text-center">${item.EndDate}</td>
								<td class="text-center">
									<c:if test="${item.ICFlag == '0' }">
										<span class="label label-warning">
											磁条卡补刷
										</span>
									</c:if>
									<c:if test="${item.ICFlag == '1' }">
										<span class="label label-success">
											非接激活
										</span>
									</c:if>
								</td>
								<td>${item.ExecNum}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty merchToActivationList }">
							<tr class="odd gradeX">
								<td colspan="15" class="empty-list">暂无相关结果.</td>
							</tr>
						</c:if>
					</tbody>
                    
                  </table>
                  
                </div>
		</div>
		<%@ include file="/include/pagination.jsp" %>
