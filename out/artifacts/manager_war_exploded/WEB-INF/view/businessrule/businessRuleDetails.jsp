
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header">
				<button type="button" id="close-btn" class="close" data-dismiss="modal" >×</button>
				<h5 class="modal-title">
					<i class="fa fa-lock"></i>&nbsp;规则明细
				</h5>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form id="ruleForm" action="#" class="form-horizontal">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">规则名称</label>
									<div class="col-md-7">
										<input class="form-control" type="text" readonly="readonly" value="${br.busiName }">
									</div>
									<c:if test="${br.busiNo != '' and br.busiNo != null }">
										<label class="control-label">(${br.busiNo })</label>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">子节点合并方法</label>
									<div class="col-md-7">
										<input class="form-control" type="text" readonly="readonly" value="${br.childType }">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">执行脚本</label>
									<div class="col-md-7">
										<textarea class="form-control" readonly="readonly" style="height:200px">${br.luaBusiness }</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">说明</label>
									<div class="col-md-7">
										<input  class="form-control" type="text" readonly="readonly" value="${br.remark }">
									</div>
								</div>
							</div>
						</form>
							
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">关 闭</button>
			</div>
