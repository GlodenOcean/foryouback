<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row" style="padding:5px;padding-left:20px">
	<strong>子节点合并方法 ：</strong>
	<img alt="" src="build/custom/images/or.png">-<strong>Or</strong>&emsp;
	<img alt="" src="build/custom/images/and.png">-<strong>And</strong>&emsp;
	<img alt="" src="build/custom/images/other.png">-<strong>复杂</strong>&emsp;
	<i class="fa fa-arrow-up"></i><strong>上调优先级</strong>&emsp;
	<i class="fa fa-arrow-down"></i><strong>下调优先级</strong>
</div>
<div class="row">
	<div class="col-md-6" style="padding-right:1px">
		<div class="widget box">
               <div class="widget-header">
                 <h4>规则管理</h4>
                  <div class="toolbar no-padding">
                    <div class="btn-group">
                   		<button id="bsRule_addRoot" onclick="openAddRootNode();" class="btn btn-sm">
                   			<i class="fa fa-plus"></i>根节点
                   		</button>
                    	<button id="bsRule_addSub" class="btn btn-sm" onclick="openAddSubNode();">
                   			<i class="fa fa-plus"></i>子节点
                   		</button>
                    	<button id="bsRule_edit" class="btn btn-sm" onclick="openUpdateNode();">
                   			<i class="fa fa-edit"></i>修改
                   		</button>
                    	<button id="bsRule_del" class="btn btn-sm" onclick="removeNode();">
                   			<i class="fa fa-trash"></i>删除
                   		</button>
                    	<button class="btn btn-sm" onclick="ruleDetails()">
                   			<i class="fa fa-search"></i>明细
                   		</button>
                   		<button class="btn btn-sm" onclick="changePriority('up')">
                   			<i class="fa fa-arrow-up"></i>
                   		</button>
                    	<button class="btn btn-sm" onclick="changePriority('down')">
                   			<i class="fa fa-arrow-down"></i>
                   		</button>
                   		<button class="btn btn-sm" onclick="initManageTree()">
                   			<i class="fa fa-refresh"></i>
                   		</button>
                    </div>
                  </div>
               </div>
               <div class="widget-content">
				<ul id="manageTree" class="ztree"></ul>
			</div>
		</div>
	</div>
	
	<div class="col-md-6" style="padding-left:1px">
		<div class="widget box">
               <div class="widget-header">
                 <h4>规则模板</h4>
                 <div class="toolbar no-padding">
	                 <div class="btn-group">
	                 	<button id="bsRule_useTemplate" class="btn btn-sm" onclick="manageJoinNode();" disabled="disabled">
                   			<i class="fa fa-hand-o-left"></i>使用此模板
                   		</button>
                    	<button class="btn btn-sm" onclick="templateRuleDetails()">
                   			<i class="fa fa-search"></i>明细
                   		</button>
                    	<button class="btn btn-sm" onclick="manageInitTemplateTree()">
                   			<i class="fa fa-refresh"></i>
                   		</button>
	                 </div>
                 </div>
               </div>
               <div class="widget-content">
				<ul id="manageTemplateTree" class="ztree"></ul>
			</div>
		</div>
	</div>
	
</div>

<script type="text/javascript">

$("#manageTree").slimScroll({
	height: $(window).height()-220,
	alwaysVisible: true
});

$("#manageTemplateTree").slimScroll({
	height: $(window).height()-220,
	alwaysVisible: true
});

/** 变量声明 **/
var manageTree;

/**
 * 加载树数据
 */
function onPageLoaded(){
	initManageTree();
	manageInitTemplateTree();
}

function initManageTree(){
	ajaxRequest("businessrule/getTree?type=all", {}, function(resp){
		$.fn.zTree.init($("#manageTree"), manageTreeSetting,resp);
		manageTree = $.fn.zTree.getZTreeObj("manageTree");
	});
}

function getSelectedNode(){
	var nodes = manageTree.getSelectedNodes();
	return nodes[0];
}

function openAddRootNode(){
	var data = {uuid:"",upBusiID:"0"};
	ajaxDialog("businessrule/form", data);
}

function openAddSubNode(){
	var node = getSelectedNode();
	if(node){
		var data = {uuid:"",upBusiID:getSelectedNode().id};
		ajaxDialog("businessrule/form", data);
	}
}

function openUpdateNode(){
	var node = getSelectedNode();
	if(node){
		var data = {uuid:node.uuid,upBusiID:""};
		ajaxDialog("businessrule/form", data);
	}
}

/**
 * 删除节点
 */
function removeNode(){
	var node = getSelectedNode();
	if(node){
		bootbox.confirm("此操作将删除规则下所有规则,确认删除?",function(isSure){
			if(isSure){
				ajaxRequest("businessrule/delete", {uuid:node.uuid}, function(resp){
					manageTree.removeNode(node,false);
				});
			}
		});
	}
}

function changePriority(operator){
	var node = getSelectedNode();
	var data = {uuid:node.uuid,operator:operator};
	ajaxRequest("businessrule/changePriority",data,function(resp){
		if(resp.data){
			if(operator == "up"){
				manageTree.moveNode(node.getPreNode(),node,"prev");			
			}else{
				manageTree.moveNode(node.getNextNode(),node,"next");
			}
		}
	});
}


function addNodeToRoot(newNode){
	manageTree.addNodes(null,newNode);
}

function addChildrenNode(childrenNode){
	manageTree.addNodes(getSelectedNode(),childrenNode);
}

function reAsyncForUpdate(newNode){
	var updateNode = getSelectedNode();
	updateNode.name = newNode.name;
	updateNode.iconSkin = newNode.iconSkin;
	manageTree.updateNode(updateNode,false);
}


var manageTreeSetting = {
		data: {simpleData: {enable: true}},
		view:{selectedMulti: false}
		}; 

function ruleDetails(){
	var node = getSelectedNode();
	if(node){
		details(node.uuid);
	}
}

function templateRuleDetails(){
	var node = manageTemplateTree.getSelectedNodes()[0];
	if(node){
		details(node.uuid);
	}
}

function details(id){
	var data = {id:id};
	ajaxDialog("businessrule/details",data);
}


/****************************模板树***************************** */
var manageTemplateTree;
var manageTemplateTreeSetting = {
		data: {simpleData: {enable: true}},
		view:{selectedMulti: false},
		callback:{onClick:checkNodeCanUse}
		}; 

function checkNodeCanUse(event, treeId, treeNode){
	if(treeNode.canBeUse){
		$("#bsRule_useTemplate").attr("disabled",false);
	}else{
		$("#bsRule_useTemplate").attr("disabled",true);
	}
}

/**
 * 初始化规则模板树
 */
function manageInitTemplateTree(){
	ajaxRequest("businessrule/getTemplateTree", {}, function(resp){
		$.fn.zTree.init($("#manageTemplateTree"), manageTemplateTreeSetting,resp);
	manageTemplateTree = $.fn.zTree.getZTreeObj("manageTemplateTree");
	});
}

/**
 * 将规则模板中的某一节点加入到左侧
 */
function manageJoinNode(){
	var targetNode = getSelectedNode();
	var templateNode = manageTemplateTree.getSelectedNodes()[0];
	if(!targetNode){
		bootbox.alert("请选择左侧其中一项业务规则节点进行操作.");
		return;
	}
	
	if(!templateNode){
		bootbox.alert("请选择右侧其中一项规则模板节点进行操作.");
		return;
	}

	ajaxRequest("businessrule/findById",{uuid:templateNode.uuid},function(resp){
		var data = {targetId:targetNode.uuid,templateId:templateNode.uuid,upBusiID:targetNode.id};
		ajaxDialog("businessrule/parameterForm",data);
	});
	
}

</script>
