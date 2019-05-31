/**
 * 
 *	des by zhongzf
 *
 */

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

var requestTypeTab = "tab";
var requestTypeJson = "json";
var requestTypeDialog = "dialog";

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
 * 重新加载tab数据，此方法针对已经存在的tab进行重新加载数据
 * @param tabId
 * @param url
 * @param data
 */
function ajaxReloadTab(tabId,url,data){
	data = appendRandomParameter(data);
	data.requestType = requestTypeTab;
	showLoading();
	$("#"+tabId).load(url,data,function(response){
		hideLoading();
		//权限控制
		hideMenuAndControl();
		execInitFunction();
		execOrderBy();
		setLayout();
		initDatepicker();
	});
}

/**
 * 加载数据到tab，如果重复打开同一个将不进行网络请求。
 * @param url
 * @param data
 */
function ajaxTab(url,data) {
	var tabId = data.tabId;
	if($ESTab.tabList[tabId]){
		$ESTab.setOpenTab(tabId);
		if(data.refresh){
			$ESTab.ajaxReload(tabId,url,data);
		}
	}else{
		data = appendRandomParameter(data);
		data.requestType = requestTypeTab;
		//开始加载数据
		showLoading();
		$.get(url,data, function(response) {
			var responseHtml = "<div id='"+tabId+"'>";
			    responseHtml += response;
			    responseHtml += "</div>"
			$("#page-container").append(responseHtml);
			hideLoading();
			hideMenuAndControl();
			execInitFunction();
			execOrderBy();
			setLayout();
			initDatepicker();
		});
		$ESTab.addTab(tabId,url,data);
	}
}


/**
 * 异步加载HTML到模态框
 * @param url
 */
function ajaxDialog(url,data,width) {
	showLoading();
	data = appendRandomParameter(data);
	data.requestType = requestTypeDialog;
	$("#dialog-content").load(url,data, function(response) {
		hideLoading();
		var dialogPage = $("#dialog-page");
		if(width){
			dialogPage.children(".modal-dialog").css("width",width);
		}else{
			dialogPage.children(".modal-dialog").css("width","");
		}
		$(this).html(response);
		dialogPage.modal({backdrop: 'static'});
		execInitFunction();
		initDatepickerInDialog();
	});
	
}

function formAjaxRequest(formId,callBack){
	var $form = $("#"+formId);
	var url = $form.prop("action");
	var data = serializeObject($form);
	ajaxRequest(url, data, callBack)
}

function ajaxRequest(url,data,callBack){
	showLoading();
	data.requestType = requestTypeJson;
	$.ajax({
		type : "POST",
		url : url,
		data:data,
		timeout:timeoutSecond,
		dataType : "json",
		cache: false,
		success:function(response) {
				if(response.code == exceptionCode || response.code == failCode){
					showErrorNotice(response.message);
				}else if(response.code == loginTimeOutCode){
					showLoginDialog("ajax");
				}else{
					if(callBack){
						callBack(response);
					}else{
						$("#dialog-page").modal("hide");
						if(response.closeCurrent){
							$ESTab.closeTab();
							$ESTab.reload();
						}else{
							$ESTab.reload();
						}
						showSuccessNotice(response.message);
					}
				}
		},
        error:function(response){
        	showErrorNotice("请求发生错误。");
        }
	});
	hideLoading();
}

function ajaxUpload(formObj,callBack){
	showLoading();
	formObj.ajaxSubmit({
        type:"post",
        url:formObj.attr("action"),
        dataType : "json",
        success:function(response) {
			hideLoading();
			if(response.code == exceptionCode || response.code == failCode){
				showErrorNotice(response.message);
			}else if(response.code == loginTimeOutCode){
				showLoginDialog("ajax");
			}else{
				if(callBack){
					callBack(response);
				}else{
					showSuccessNotice(response.message);
				}
			}
		},
        error:function(response){
        	showErrorNotice("请求发生错误。");
        }
	});
	hideLoading();
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
 * 在每次异步加载页面后执行的函数,需在页面定义 onPageLoaded
 */
function execInitFunction(){
	if(window.onPageLoaded){
		onPageLoaded();
		//执行完毕后移除，以免在load其他页面时再次执行
		window.onPageLoaded = undefined;
	}
}

/**
 * 对列表进进行排序渲染
 */
function execOrderBy(){
	var searchForm = $ESTab.getOpenTab().find(".searchForm");
	//为排序字段绑定click事件
	$ESTab.getOpenTab().find(".sortCloumn").each(function(){
		$(this).click(function(){
			var orderField = $(this).attr("orderField");
			var orderDirection = searchForm.find("input[name='orderDirection']").val();
			if(orderDirection){
				if(orderDirection == "desc"){
					orderDirection = "asc";
					$(this).append("<i class='icon-caret-up'></i>")
				}else{
					orderDirection = "desc";
				}
			}else{
				orderDirection = "desc";
			}
			searchForm.find("input[name='orderField']").val(orderField);
			searchForm.find("input[name='orderDirection']").val(orderDirection);
			searchForm.submit();
		});
	});
	
	//为排序字段更改图标
	var orderField = searchForm.find("input[name='orderField']").val();
	var orderDirection = searchForm.find("input[name='orderDirection']").val();
	$ESTab.getOpenTab().find(".sortCloumn").each(function(){
		var $this = $(this);
		if($this.attr("orderField") == orderField){
			if(orderDirection == "desc"){
				$this.addClass("sortDesc");
			}else{
				$this.addClass("sortAsc");
			}
		}else{
				$this.addClass("sortBoth");
		}
	});
}

/**
 * 换页操作
 * @param index
 * @param pageSize
 */
function changePage(index,pageSize){
	var searchForm = $ESTab.getOpenTab().find(".searchForm");
	var url = searchForm.prop("action");
	var data = serializeObject(searchForm);
	data.pageIndex = index;
	if(pageSize){
		data.pageSize = pageSize;
	}
	ajaxReloadTab($ESTab.currentOpenTabId,url, data);
}

function setLayout(){
	var width = $(document).width();
	var silder = $("#sidebar");
	if(silder.css("display") == "block"){
		width = width - silder.width();
	}
	var $currentOpenTab = $ESTab.getOpenTab();
	$currentOpenTab.find(".pageRow").width($currentOpenTab.find(".widget").width());
	$("#tab-navigate").width(width);
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

/**
 * 对页面日期控件进行初始化
 */
function initDatepicker(){
	$ESTab.getOpenTab().find("input[class*='date-picker']").each(function(){
		$(this).datetimepicker({format:'YYYY-MM-DD'});
	});
	$ESTab.getOpenTab().find("input[class*='datetime-picker']").each(function(){
		$(this).datetimepicker({format:'YYYY-MM-DD hh:mm:ss'});
	});
}

function initDatepickerInDialog(){
	$("#dialog-content").find("input[class*='date-picker']").each(function(){
		$(this).datetimepicker({format:'YYYY-MM-DD'});
	});
	$("#dialog-content").find("input[class*='datetime-picker']").each(function(){
		$(this).datetimepicker({format:'YYYY-MM-DD hh:mm:ss'});
	});
}

