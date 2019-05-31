<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="widget box">
            <div class="widget-content  no-padding">
                
				<div class="row">
					<div class="col-md-12">
						<div style="border-bottom:1px solid #dedede;padding:5px;">
							<button id="bsRule_template_addRoot" onclick="openAddRootTemplateNodeForm();" class="btn btn-sm">
								<i class="fa fa-plus"></i>根节点
							</button>&nbsp;
							
							<button id="bsRule_template_addSub" onclick="openAddTemplateNodeForm();" class="btn btn-sm">
								<i class="fa fa-plus"></i>子节点
							</button>&nbsp;
							
							<button id="bsRule_template_edit" onclick="openUpdateTemplateNodeForm();" class="btn btn-sm">
								<i class="fa fa-edit"></i>修改
							</button>&nbsp;
							
							<button id="bsRule_template_del" onclick="removeTemplateNode();" class="btn btn-sm">
								<i class="fa fa-trash"></i>删除
							</button>&nbsp;
							
							<button onclick="viewTemplateNodeDetails();" class="btn btn-sm">
								<i class="fa fa-search"></i>查看明细
							</button>&nbsp;
							
							<button onclick="changeTemplNodePriority('up')" class="btn btn-sm">
								<i class="fa fa-arrow-up"></i>
							</button>&nbsp;
							
							<button onclick="changeTemplNodePriority('down')" class="btn btn-sm">
								<i class="fa fa-arrow-down"></i>
							</button>&nbsp;
							
							<button onclick="initTemplateTree();" class="btn btn-sm">
								<i class="fa fa-refresh"></i>
							</button>&nbsp;
							&emsp;
							<strong>子节点合并方法 ：</strong>
							<img alt="" src="build/custom/images/or.png">-<strong>Or</strong>&emsp;
							<img alt="" src="build/custom/images/and.png">-<strong>And</strong>&emsp;
							<img alt="" src="build/custom/images/other.png">-<strong>复杂</strong>&emsp;
							<i class="fa fa-arrow-up"></i><strong>上调优先级</strong>&emsp;
							<i class="fa fa-arrow-down"></i><strong>下调优先级</strong>
						</div>
						<ul id="templateTree" class="ztree" style="min-height:350px"></ul>
					</div>
			    </div>
				
			</div>
		</div>

<script type="text/javascript">

	/** 声明变量 **/
	var templateTree;
	
	function initTemplateTree(){
		ajaxRequest("businessrule/getTemplateTree", {}, function(resp){
			$.fn.zTree.init($("#templateTree"), templateTreeSetting,resp);
			templateTree = $.fn.zTree.getZTreeObj("templateTree");
		});
	}
	
	function onPageLoaded(){
		initTemplateTree();
	}
	
	function getTemplateSelectedNode(){
		var nodes = templateTree.getSelectedNodes();
		return nodes[0];
	}
	
	function openAddRootTemplateNodeForm(){
		var data = {uuid:"",upBusiID:"-1"};
		ajaxDialog("businessrule/toTemplateForm", data);
	}
	
	function viewTemplateNodeDetails(){
		var node = getTemplateSelectedNode();
		if(node){
			var data = {id:node.uuid};
			ajaxDialog("businessrule/details",data);
		}
	}
	
	function openAddTemplateNodeForm(){
		var snode = getTemplateSelectedNode();
		if(snode){
			var data = {uuid:"",upBusiID:snode.id};
			ajaxDialog("businessrule/toTemplateForm", data);
		}else{
			bootbox.alert("请选择父节点进行添加.");
		}
	}
	
	function openUpdateTemplateNodeForm(){
		var snode = getTemplateSelectedNode();
		if(snode){
			var data = {uuid:getTemplateSelectedNode().uuid,upBusiID:""};
			ajaxDialog("businessrule/toTemplateForm", data);
		}
	}
	
	function removeTemplateNode(){
		var node = getTemplateSelectedNode();
		if(node){
			bootbox.confirm("此操作将删除规则下所有规则,确认删除?",function(isSure){
				if(isSure){
					ajaxRequest("businessrule/deleteTemplate", {uuid:node.uuid}, function(resp){
						templateTree.removeNode(node,false);
					});
				}
			});
		}
	}
	
	function changeTemplNodePriority(operator){
		var node = getTemplateSelectedNode();
		var data = {uuid:node.uuid,operator:operator};
		ajaxRequest("businessrule/changePriority",data,function(resp){
				if(resp.data){
					if(operator == "up"){
						templateTree.moveNode(node.getPreNode(),node,"prev");			
					}else{
						templateTree.moveNode(node.getNextNode(),node,"next");
					}
				}
		});
	}
	
	
	function addTemplateNodeToRoot(newNode){
		templateTree.addNodes(null,newNode);
	}
	
	function addChildrenTemplateNode(childrenNode){
		templateTree.addNodes(getTemplateSelectedNode(),childrenNode);
	}
	
	function reAsyncTemplateForUpdate(newNode){
		var updateNode = getTemplateSelectedNode();
		updateNode.name = newNode.name;
		updateNode.iconSkin = newNode.iconSkin;
		templateTree.updateNode(updateNode,false);
	}
	
	var templateTreeSetting = {
			data: {simpleData: {enable: true}},
			view:{selectedMulti: false}
			}; 

</script>
