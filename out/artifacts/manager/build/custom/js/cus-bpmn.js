
$("#modelInfo").slimScroll({
			height: $(window).height()-40,
			alwaysVisible: true
		});

var currentSelectModel = "";
var BpmnJS = window.BpmnJS;
var viewer = new BpmnJS({ container: "#js-canvas",height:800,width:1780});
$("img").remove();

$.get($("#path").val()+"trans/getBpmnXml?flowName="+$("#flowName").val(),function(resp){
  
   viewer.importXML(resp, function(err) {
	   var overlays = viewer.get("overlays"),
       canvas = viewer.get("canvas"),
       elementRegistry = viewer.get("elementRegistry");
	   
	   //高亮显示模块
	   showLoading();
	   $.ajax({
			type : "POST",
			url : $("#path").val()+"trans/getFollowModel",
			data:{id:$("#uuid").val()},
			timeout:20000,
			dataType : "json",
			success:function(response) {
				hideLoading();
				if(response.data){
					for(var i = 0;i<response.data.length;i++){
						if(elementRegistry.get(response.data[i])){
							canvas.addMarker(response.data[i], "highlight");
						}
					}
				}
			}
		});

		//点击显示菜单
	    viewer.get("eventBus").on("element.click", function(e) {
			if(e.gfx.node.tagName == "g"){
				var modelName = e.gfx.node.textContent;
				if(modelName != ""){
					var x = e.originalEvent.clientX;
					var y = e.originalEvent.clientY;
					showMenu(e.element.type,x,y);
					currentSelectModel = modelName;
				}
			}else{
				hideMenu();
			}
	    });

   })
 });

function showMenu(type, x, y) {
	if (type == "bpmn:CallActivity") {
		$("#viewSubFlowBtn").show();
	} else {
		$("#viewSubFlowBtn").hide();
	}
	$("#menu ul").show();
	$("#menu").css({
		"top" : y + "px",
		"left" : x + "px",
		"visibility" : "visible"
	});
}

function hideMenu() {
	$("#menu").css({
		"visibility" : "hidden"
	});
	hideDetailsDiv();
}

function viewDetails() {
	hideMenu();
	showLoading();
	$.ajax({
		type : "POST",
		url : $("#path").val() + "trans/getModelInfo",
		data : {
			id : $("#uuid").val(),
			modelName : currentSelectModel
		},
		timeout : 20000,
		dataType : "json",
		success : function(response) {
			hideLoading();
			$("#modelInfo").html(response.message);
			showDetailsDiv();
		}
	});
	$("#detailTitle").html("[" + currentSelectModel + "]");
}

function viewSubFlow() {
	var flowName = "";
	if (currentSelectModel == "终端解包模块") {
		flowName = "TermUnPack";
	} else if (currentSelectModel == "渠道通讯") {
		flowName = "ChannelComm";
	} else if (currentSelectModel == "交易返回模块") {
		flowName = "TransBack";
	} else if (currentSelectModel == "交易模块") {
		flowName = "Trans1";
	} else if (currentSelectModel == "终端打包模块") {
		flowName = "TermPack";
	}
	hideMenu();
	window.open($("#path").val() + "trans/flow?flowName=" + flowName+ "&id=" + $("#uuid").val());
}

function showDetailsDiv(){
	$(".detailContent").show("300");
}

function hideDetailsDiv(){
	$(".detailContent").hide("300");
}

function unblockUI(target) {
       $.unblockUI();
}

/**
 * 显示加载中
 */
function showLoading(){
	 blockUI({boxed: true});
}

/**
 * 隐藏加载中
 */
function hideLoading(){
	unblockUI();
}




function blockUI(options) {
    options = $.extend(true, {}, options);
    var html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><img src="' + $("#path").val() + 'build/plugins/es/images/loading-spinner-grey.gif" align=""><span>&nbsp;&nbsp;' + (options.message ? options.message : '加载中...') + '</span></div>';
    
        $.blockUI({
            message: html,
            baseZ: options.zIndex ? options.zIndex : 1000,
            css: {
                border: '0',
                padding: '0',
                backgroundColor: 'none'
            },
            overlayCSS: {
                backgroundColor: options.overlayColor ? options.overlayColor : '#555',
                opacity: options.boxed ? 0.05 : 0.1,
                cursor: 'wait'
            }
        });
    
}

