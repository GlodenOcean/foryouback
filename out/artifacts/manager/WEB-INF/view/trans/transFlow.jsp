<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/path.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <link href="<%=basePath%>build/plugins/bpmn-js/assets/diagram-js.css" rel="stylesheet" type="text/css"/>
  <link href="<%=basePath%>build/custom/css/custom.css" rel="stylesheet" >
  <link href="<%=basePath%>build/framework/css/main.css" rel="stylesheet" type="text/css" />
  <link href="<%=basePath%>build/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<style>
		body{
			margin:0px;
			padding:0px;
		}
		.header{
			border-bottom:1px solid #dedede;
			background-color: #4D7496;
			padding:6px;
			color:#fff;
			font-weight: bold;
		}
		 .highlight:not(.djs-connection) .djs-visual > :nth-child(1) {
	      fill: #52B415 !important; /* color elements as green */
	    }
	
	    .highlight-overlay {
	      background-color: #52B415; /* color elements as green */
	      opacity: 0.4;
	      pointer-events: none; /* no pointer events, allows clicking through onto the element */
	    }
	    a{
	    	text-decoration: none;
	    }
	    
	    .detailContent{ 
			width:70%;
			height:600px; 
			position:absolute; 
			z-index:1; 
			left:0px; 
			top:0px;
			display:none;
			background-color:#fff;
			border:1px solid #dedede; 
		} 
		td{
			padding:3px;
			padding-left:6px;
			border-bottom:1px solid #dedede;
		}
		.btn{
			background: #4D7496 !important;
			color:#fff;
			font-size:12px;
			width:100%;
		}
		.btn:hover{
			color:#fff;
		}
	</style>
	<title>
		<c:choose>
			<c:when test="${flowName == 'process0' }">总模块</c:when>
			<c:when test="${flowName == 'ChannelComm' }">渠道通讯模块</c:when>
			<c:when test="${flowName == 'TermUnPack' }">终端解包模块</c:when>
			<c:when test="${flowName == 'TransBack' }">交易返回模块</c:when>
			<c:when test="${flowName == 'Trans1' }">交易模块</c:when>
			<c:otherwise>终端打包模块</c:otherwise>
		</c:choose>
         -交易流程图
	</title>
  </head>
  
  <body>
  	<input type="hidden" id="path" value="<%=basePath%>" />
  	<input type="hidden" id="uuid" value="${uuid }" />
  	<input type="hidden" id="flowName" value="${flowName }" />
  	
  	<div class="detailContent">
  		<div class="header">
  			<span id="detailTitle"></span>数据详情
  		</div>
		<div class="cus-scroller" id="modelInfo"></div>
  	</div>
 	
	 <div class="canvas" id="canvas">
	    <div id="js-canvas"></div>
	 </div>
	 
   	<div id="menu" class="rightMenu">
		<ul>
			<li><a href="javascript:;" onclick="viewDetails();"  class="btn">查看详细属性</a></li>
			<li id="viewSubFlowBtn"><a href="javascript:;" onclick="viewSubFlow();" class="btn">查看子流程</a></li>
		</ul>
	</div>
	
  </body>
  
  	<script src="<%=basePath%>build/framework/js/jquery.min.js" type="text/javascript"></script>
  	<script src="<%=basePath%>build/plugins/blockui/jquery.blockUI.min.js" type="text/javascript"></script>
  	<script src="<%=basePath%>build/plugins/bpmn-js/bpmn-viewer.min.js" type="text/javascript"></script>
  	<script src="<%=basePath%>build/plugins/slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>build/custom/js/cus-bpmn.js" type="text/javascript"></script>
</html>
