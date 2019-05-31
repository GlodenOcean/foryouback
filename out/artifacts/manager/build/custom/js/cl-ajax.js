/** 后台返回异常代码 "exception" */
var exceptionCode = "exception";
/** 后台返回成功代码 "success" */
var successCode = "success";
/** 后台返回失败代码 "fail" */
var failCode = "fail";
/** 后台返回登录超时代码 "timeout" */
var loginTimeOutCode = "timeout";
/** AJAX请求超时时间设定 */
var timeoutSecond = 60 * 1000;

/**
 * 修改左侧导航栏的样式为选中状态
 * @param sender
 */
function activeMenu(sender){
	$("#nav").find("li").removeClass("current");
	$(".sub-menu").find("li").removeClass("current");
	$(".open").addClass("current");
	if(sender){
		sender.parent().addClass("current");
	}
}

/**
 * 异步加载html文本数据,POST方式
 * @param url
 * @param data
 */
function loadHtml(url,data) {
	showLoading();
	data = appendRandomParameter(data);
	data.isPage = 1;
	$("#page-container").load(url,data, function(response) {
		$(this).html(response);
		hideLoading();
		//权限控制
		hideMenuAndControl();
		execInitFunction();
	});
}

/**
 * 异步加载html文本数据,POST方式
 * @param url
 * @param data
 */
function loadHtmlToDiv(url,data,divId) {
	showLoading();
	data = appendRandomParameter(data);
	data.isPage = 1;
	$("#"+divId).load(url,data, function(response) {
		$(this).html(response);
		hideLoading();
	});
}

/**
 * 异步加载HTML到模态框
 * @param url
 */
function loadHtmlToModal (url,data) {
	showLoading();
	data = appendRandomParameter(data);
	data.isModal = 1;
	$("#ajax-modal-body").load(url,data, function(response) {
		hideLoading();
		$(this).html(response);
		$("#ajax-modal").modal();
		execInitFunction();
	});
	
}

/**
 * 异步加载HTML到模态框
 * @param url
 */
function loadHtmlToFullModal(url,data) {
	showLoading();
	data = appendRandomParameter(data);
	data.isModal = 1;
	$("#ajax-modal-body-full").load(url,data, function(response) {
		hideLoading();
		$(this).html(response);
		$("#ajax-modal-full").modal();
		execInitFunction();
	});
	
}

/**
 * 加载HTML文本, 表单形式
 */
function loadHtmlByForm(formId){
	var sender = $("#"+formId);
	var url = sender.prop("action");
	var data = serializeObject(sender);
	data.isPage = 1;
	loadHtml(url, data);
}

/**
 * 异步加载JSON文本数据,POST方式
 * @param url
 * @param data
 */
function loadJson(url,data,callBack){
	if(!url){
		return false;
	}
	showLoading();
	$.ajax({
		type : "POST",
		url : url,
		data:data,
		timeout:timeoutSecond,
		dataType : "json",
		success:function(response) {
			hideLoading();
			if(callBack){
				callBack(response);
			}else{
				switch(response.code){
					case exceptionCode:
						showErrorNotice(response.message);
						break;
					case failCode:
						showErrorNotice(response.message);
						break;	
					case loginTimeOutCode:
						showLoginModal();
						break;
					case successCode:
						showSuccessNotice(response.message);
						break;
					default:
						if(callBack){
							callBack(response);
						}else{
							showErrorNotice("调用方法错误,请传入回调函数.");
						}
						break;
				}
			}
		}
	});
	
}

/**
 * 提交表单获取json结果
 * @param formId
 * @param callBack
 */
function loadJsonByForm(formId,callBack){
	var sender = $("#"+formId);
	var url = sender.prop("action");
	var data = serializeObject(sender);
	showLoading();
	$.ajax({
		type : "POST",
		timeout:timeoutSecond,
		url : url,
		data : data,
		dataType : "json",
		success : function(response) {
			hideLoading();
			if(callBack){
				callBack(response);
			}else{
				switch(response.code){
				case exceptionCode:
					showErrorNotice(response.message);
					break;
				case failCode:
					showErrorNotice(response.message);
					break;	
				case loginTimeOutCode:
					showLoginModal();
					break;
				case successCode:
					showSuccessNotice(response.message);
					break;
				default:
					showErrorNotice("调用方法错误,请传入回调函数.");
				break;
				}
			}
		}
	});
}

/**
 * 异步删除
 * @param href
 */
function ajaxDelete(href){
	bootbox.confirm("确认删除?",function(isSure){
		if(isSure){
			loadHtml(href);
		}
	});
}

/**
 * 给请求参数追加随机数,解决IE不刷新问题
 * @param data
 */
function appendRandomParameter(data){
	if(data){
		data.random = generateMixed(7);
	}else{
		data = {random:generateMixed(7)};
	}
	return data;
}

/**
 * 在每次异步加载页面后执行的函数,需在页面定义 onPageLoad
 */
function execInitFunction(){
	if(window.onPageLoad){
		onPageLoad();
		//执行完毕后移除，以免在load其他页面时再次执行
		window.onPageLoad = undefined;
	}
}

/**
 * 序列化Form表单内容为对象
 * @param formObj
 * @returns 结果
 */
function serializeObject(formObj) {
	var o = {};
	$.each(formObj.serializeArray(), function(index) {
		if (o[this["name"]]) {
			o[this["name"]] = o[this["name"]] + "," + this["value"];
		} else {
			o[this["name"]] = this["value"];
		}
	});
	return o;
} 

