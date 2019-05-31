toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "positionClass": "toast-bottom-right",
				  "onclick": null,
				  "showDuration": "1000",
				  "hideDuration": "1000",
				  "timeOut": "3000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				};

/**
 * 显示登录模态层
 */
function showLoginDialog(preRequestType){
	ajaxDialog("loginDialog",{preRequestType:preRequestType});
}

/**
 * 显示错误提示
 * @param message
 */
function showErrorNotice(message){
	if($("#toast-container").css("display")){
		return;
	}
	toastr.options.timeOut = "7000";
	toastr["error"]("",message);
}

/**
 * 显示成功提示
 * @param message
 */
function showSuccessNotice(message){
	if($("#toast-container").css("display")){
		return;
	}
	toastr["success"]("",message);
}

/**
 * 显示加载中
 */
function showLoading(){
	 options = $.extend(true, {}, {boxed: true});
	    var html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><img src="build/plugins/es/images/loading-spinner-grey.gif" align=""><span>&nbsp;&nbsp;' + (options.message ? options.message : '加载中...') + '</span></div>';
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

/**
 * 隐藏加载中
 */
function hideLoading(){
	 $.unblockUI();
}


