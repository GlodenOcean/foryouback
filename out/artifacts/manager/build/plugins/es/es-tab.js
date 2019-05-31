var $ESTab = ESTab();

function ESTab(){
	var tab = new Object(); 
	tab.tabList = {};
	tab.itemList = {};
	tab.urlList = {};
	tab.currentOpenTabId = "";
	tab.tabCount = 0;
	
	//设置当前打开的tab    $ESTab.setOpenTab(tabId)
	tab.setOpenTab = function(tabId){
		this.hideOther();
		this.currentOpenTabId = tabId;
		this.getOpenTab().show();
		$("#"+this.itemList[tabId]).addClass("active");
	}
	
	//获取当前打开的tab对象   $ESTab.getOpenTab();
	tab.getOpenTab = function(){
		return $("#"+this.currentOpenTabId);
	}
	
	//获取某一个tab
	tab.getTab = function(tabId){
		return $("#"+tabId);
	}
	
	//新增一个tab
	tab.addTab = function(tabId,url,data){
		this.tabCount += 1;
		this.tabList[tabId] = tabId;
		this.itemList[tabId] = tabId + "_tabItem";
		this.urlList[tabId] = url; 
 		//加入导航栏
 		var html = "<li id='"+this.itemList[tabId]+"'><a class='tabItem' href='javascript:;'>"+data.tabTitle+"</a>";
 		    html+= "<a class='removeTab' href='javascript:;'><i class='fa fa-times'></i></a></li>";
 		if(this.tabCount > 1){
 			$("#"+this.itemList[this.currentOpenTabId]).after(html);
 		}else{
 			$("#tab-ul").append(html);
 		}
	    this.setOpenTab(tabId);
 		initSliderStatus();
 		tabNavigateSubLeft();
	}
	
	//隐藏其他tab
	tab.hideOther = function(){
		var tabId = this.currentOpenTabId;
		$("#" + this.tabList[tabId]).hide();
		$("#" + this.itemList[tabId]).removeClass("active");
	}
	
	//在导航栏中移除一个tab
	tab.removeTab = function(tabId){
		$("#"+tabId).remove();
		var removeTabItem = $("#"+this.itemList[tabId]);
		
		if(removeTabItem.hasClass("active")){
			var nextOpenTabId = removeTabItem.prev().prop("id");
			    nextOpenTabId = nextOpenTabId.substring(0,nextOpenTabId.indexOf("_"));
			this.setOpenTab(nextOpenTabId);
		}
		removeTabItem.remove();
		
		initSliderStatus();
		tabNavigateAddLeft();
		this.resetArray(tabId);
	}
	
	//右键菜单
	tab.initRightMenu = function(){
		context.init({preventDoubleContext: true});
    	context.attach("#tab-ul", [
			{text: "刷新当前", action: function(e){
				$ESTab.refreshTab();
			}},
    		{text: "关闭当前", action: function(e){
    			$ESTab.closeTab();
			}},
			{text: "关闭其他", action: function(e){
				$ESTab.closeOtherTab();
			}},
			{text: "关闭全部", action: function(e){
				$ESTab.closeAllTab();
			}}
    	]);
    	context.settings({compress: true});
	}
	
	//刷新
	tab.refreshTab = function(){
		var url = this.urlList[this.currentOpenTabId];
		this.search(url,{});
	}
	
	//关闭当前
	tab.closeTab = function(){
		this.removeTab(this.currentOpenTabId);
	}
	
	tab.closeOtherTab = function(){
		$("#tab-ul").find("li").each(function(){
			if(!$(this).hasClass("li-home")){
				var tabId = $(this).prop("id");
					tabId = tabId.substring(0,tabId.indexOf("_"));
				if(tabId != $ESTab.currentOpenTabId){
					$ESTab.removeTab(tabId);
					$ESTab.resetArray(tabId);
				}
			}
		});
	}
	
	tab.closeAllTab = function(){
		$("#tab-ul").find("li").each(function(){
			if(!$(this).hasClass("li-home")){
				var tabId = $(this).prop("id");
					tabId = tabId.substring(0,tabId.indexOf("_"));
				$ESTab.removeTab(tabId);
				$ESTab.resetArray(tabId);
			}
		});
	}
	
	tab.reload = function(){
		var searchForm = this.getOpenTab().find(".searchForm");
		if(searchForm){
			searchForm.submit();
		}
	}
	
	tab.search = function(url,data){
		this.ajaxReload(this.currentOpenTabId,url, data);
	}
	
	tab.resetArray = function(tabId){
		this.tabCount -= 1;
		this.tabList[tabId] = undefined;
		this.itemList[tabId] = undefined;
		this.urlList[tabId] = undefined;
	}
	
	tab.initHome = function(tabId,url){
		this.tabCount += 1;
		this.tabList[tabId] = tabId;
		this.itemList[tabId] = tabId + "_tabItem";
		this.urlList[tabId] = url; 
		this.currentOpenTabId = tabId;
	}
	
	tab.ajaxReload = function(tabId,url,data){
		this.urlList[tabId] = url;
		ajaxReloadTab(tabId,url, data);
	}
	
	return tab;
}

function initSliderStatus(){
	var tabContentWidth = $("#tab-navigate").width();
	var currrentWidth = $ESTab.tabCount * 110 + $ESTab.tabCount * 10 + 100;
	if(currrentWidth >= tabContentWidth){
		$("#slide_left").addClass("slide-active");
		$("#slide_right").addClass("slide-active");
	}else{	
		$("#slide_left").removeClass("slide-active");
		$("#slide_right").removeClass("slide-active");
	}
}

function tabNavigateAddLeft(){
	var tabNavigate = $("#tab-ul");
	var left = tabNavigate.position().left;
	if(left < 0){
		left += 120;
		tabNavigate.animate({ 
			left: left
		}, 200 );
	}
}

function tabNavigateSubLeft(){
	if($("#slide_left").hasClass("slide-active")){
		var tabNavigate = $("#tab-ul");
		var left = tabNavigate.position().left;
		left -= 120;
		tabNavigate.animate({ 
			 left: left
		  }, 200 );
	}
}
