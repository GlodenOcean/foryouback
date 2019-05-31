<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>资源管理
		</h4>
	</div>
	<div class="widget-content">
		<ul id="sourceTree" class="ztree" style="padding-bottom: 40px;"></ul>
	</div>
</div>

<div id="rightMenu" class=rightMenu>
	<ul>
		<li id="addNode"><a href="javascript:;" onclick="addForm();"  class="btn">增加</a></li>
		<li id="editNode"><a href="javascript:;" onclick="updateForm();" class="btn">修改</a></li>
		<li id="removeNode"><a href="javascript:;" onclick="removeNode();" class="btn">删除</a></li>
	</ul>
</div>
<script>

/**
 * 加载树数据
 */
function onPageLoaded(){
	initSourceTree();
	$("#sourceTree").slimScroll({
		height: $(window).height()-200,
		alwaysVisible: true
	});
}

var sourceTree,rightMenu;

function initSourceTree(){
	ajaxRequest("source/getTree", {}, function(resp){
		$.fn.zTree.init($("#sourceTree"), setting,resp);
		sourceTree = $.fn.zTree.getZTreeObj("sourceTree");
		rightMenu = $("#rightMenu");
	});
}

function getSelectedNode(){
	var nodes = sourceTree.getSelectedNodes();
	return nodes[0];
}

function addNewNode(data,isRoot){
	var newNode = {name:data.name,id:data.id,pId:data.parentId,iconSkin:data.iconSkin};
	if(isRoot){
		sourceTree.addNodes(null, newNode);
	}else{
		var node = getSelectedNode();
		sourceTree.addNodes(node, newNode);
	}
}

function addForm(){
	hideMenu();
	var node = getSelectedNode();
	var data = {};
	if(!node){
		data.isRoot = true;
	}else{
		data.isRoot = false;
		data.parentId = node.id;
	}
	ajaxDialog("source/form",data);
}

function updateForm(){
	hideMenu();
	var node = getSelectedNode();
	var data = {isRoot:false,id:node.id};
	ajaxDialog("source/form",data);
}

/**
 * 删除节点
 */
function removeNode(){
	hideMenu();
	bootbox.confirm("删除将删除所有子目录,确认删除?",function(isSure){
		if(isSure){
			var node = getSelectedNode();
		 	var data = {id:node.id};
		 	ajaxRequest("source/delete", data, function(resp){
				if(resp.code == successCode){
					sourceTree.removeNode(node,true);
				}
			});
		}
	});
}

var setting = {
				data: {simpleData: {enable: true}},
				callback: {onRightClick: treeRightClick},
				view:{selectedMulti: false}
				};

function treeRightClick(event, treeId, treeNode) {
	if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
		sourceTree.cancelSelectedNode();
		showMenu("root", event.clientX, event.clientY);
	} else if (treeNode && !treeNode.noR) {
		sourceTree.selectNode(treeNode);
		showMenu("node", event.clientX, event.clientY);
	}
}

function showMenu(type, x, y) {
	$("#rightMenu ul").show();
	if (type=="root") {
		$("#addNode").show();
		$("#editNode").hide();
		$("#removeNode").hide();
	} else {
		$("#addNode").show();
		$("#editNode").show();
		$("#removeNode").show();
	}
	rightMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});
	$("body").bind("mousedown", onBodyMouseDown);
}

function hideMenu() {
	if (rightMenu) rightMenu.css({"visibility": "hidden"});
	$("body").unbind("mousedown", onBodyMouseDown);
}

function onBodyMouseDown(event){
	if (!(event.target.id == "rightMenu" || $(event.target).parents("#rightMenu").length>0)) {
		hideMenu();
	}
}

</script>
