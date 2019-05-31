<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

              <div class="widget box">
              
                <div class="widget-header">
                  <h4>
                    <i class="fa fa fa-th-list">
                    </i>
                   	角色[${role.roleName }]分配资源
                  </h4>
                </div>
                
                <div class="widget-content">
                  <form action="role/allotAccess" id="allotAccessForm" method="post" class="form-horizontal row-border" target="ajax">
						<input type="hidden" name="role.id" value="${role.id }" /> 
						<input type="hidden" name="role.source" id="roleSource" value="${role.source }"/> 
						<div class="row">
							<ul id="allotSourceTree" class="ztree"></ul>
						</div>
					</form>
                </div>
                <div class="widget-footer">
					<button type="button" class="btn btn-success" onclick="makeSure()">确定</button>
				</div>
              </div>

<script>

var allotAccessTree;

function onPageLoaded(){
	initAllotSourceTree();
}

function checkTrigger(){
	var sourceIds = $("#roleSource").val();
	var nodes = allotAccessTree.transformToArray(allotAccessTree.getNodes());
	$(nodes).each(function(i){
		var node = nodes[i];
		if(sourceIds.indexOf(node.controlId) > -1){
			node.checked = true;
			allotAccessTree.updateNode(node,true);
		}else{
			node.checked = false;
			allotAccessTree.updateNode(node,true);
		}
	});
}

function initAllotSourceTree(){
	ajaxRequest("source/getTree", {}, function(resp){
		$.fn.zTree.init($("#allotSourceTree"), allotSetting,resp);
		allotAccessTree = $.fn.zTree.getZTreeObj("allotSourceTree");
		checkTrigger();
	});
}

var allotSetting = {
		data: {
			simpleData: {
				enable: true
			}
		},check: {
			enable: true,
			autoCheckTrigger: true
		},
		view:{showIcon:false}
};

function makeSure(){
	 var nodes = allotAccessTree.getCheckedNodes(true);
	 var sourceIds = "";
	 $(nodes).each(function(i){
		 sourceIds += nodes[i].controlId + ","; 
	 });
	 $("#roleSource").val(sourceIds);
	 $("#allotAccessForm").submit();
}
</script>
