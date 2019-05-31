/**
 * by zhongzf
 * 绑定事件都在这里定义 
 * 
 */

$(document).ready(function() {
	
	$("#slide_left").click(function(){
		var tabNavigate = $("#tab-ul");
		var left = tabNavigate.position().left;
		if(left != 0){
			left += 120;
			tabNavigate.animate({ 
				 left: left
			  }, 200 );
		}
	});
	
	$("#slide_right").click(function(){
		var tabContentWidth = $("#tab-navigate").width();
		var currrentWidth = $ESTab.tabCount * 110 + $ESTab.tabCount * 10 + 100;
		if(currrentWidth <= tabContentWidth){
			return;
		}
		var tabNavigate = $("#tab-ul");
		var left = tabNavigate.position().left;
		if(currrentWidth + left >= tabContentWidth){
			left -= 120;
			tabNavigate.stop().animate({ 
				left: left
			}, 200 );
		}
	});
	
	/**
	 *  对a标签进行绑定打开tab事件 <a href=".." target="tab" >
	 */
	$("div").on("click", "a[target=tab]", function() {
		var $this = $(this);
		var title = $this.attr("title");
		var refresh = $this.attr("refresh");
		if(!title){
			title = $.trim($this.text());
		}
		if(!refresh){
			refresh = false;
		}else{
			refresh = true;
		}
		var data = {"tabTitle":title,"refresh":refresh};
		data.tabId = pinyin.getFullChars(title);
		ajaxTab($this.prop("href"),data);
		if($this.hasClass("menu")){
			activeMenu($this);
		}
		return false;
	});
	
	/**
	 *  对a标签进行绑定ajax事件 <a href=".." target="ajax" >
	 */
	$("div").on("click", "a[target=ajax]", function() {
		ajaxRequest($(this).prop("href"),{});
		return false;
	});
	
	/**
	 * 对a标签进行绑定关闭当前tab事件 <a href=".." target="closeTab" >
	 */
	$("div").on("click", "a[target=closeTab]", function() {
		$ESTab.closeTab();
		return false;
	});
	
	$("div").on("click", "a[target=selectAjax]", function() {
		var $this = $(this);
		var title = $this.attr("title");
		var idsMap = {};
		var isSelected = false;
		$ESTab.getOpenTab().find("input[name='ids']").each(function(){			
			if($(this).attr("checked") == "checked"){
				var id = $(this).val();
				idsMap[id] = id;
				isSelected = true;
			}
		});
		
		var data =  $.map(idsMap, function(val, i) {
				return {name: "ids", value: val};
			});
		
		if(isSelected == false){
			bootbox.alert("<span class='red strong'><i class='fa fa-warning'></i>请至少选择一项进行操作.</span>");
		}else{
			if(title){
				bootbox.confirm(title, function(isSure) {
					if(isSure){
						ajaxRequest($this.prop("href"),data);
					}
				}); 
			}else{
				ajaxRequest($this.prop("href"),data);
			}
		}
		
		return false;
	});
	
	// 模态层
	$("div").on("click", "a[target=dialog]", function() {
		var $this = $(this);
		var width = $this.attr("width");
		ajaxDialog($this.prop("href"),{},width);
		return false;
	});
	
	//表单
	$("div").on("submit", "form[target=tab]", function() {
		var sender = $(this);
		if(sender.hasClass("searchForm")){
			$ESTab.search(sender.prop("action"),serializeObject(sender));
		}else{
			ajaxTab(sender.prop("action"),serializeObject(sender));
		}
		return false;
	});
	
	$("div").on("submit", "form[target=ajax]", function() {
		ajaxRequest($(this).prop("action"),serializeObject($(this)));
		return false;
	});
	
	// 绑定全选
	$("div").on("click",".group-checkbox",function(){
		var sender = $(this);
		var checked = sender.closest("span").hasClass("checked");
		if(checked){
			sender.closest("span").removeClass("checked");
			sender.removeAttr("checked");			
		}else{
			sender.closest("span").addClass("checked");
			sender.attr("checked","true");
		}
		
		$ESTab.getOpenTab().find("input[name='ids']").each(function(){			
			if(checked){
				$(this).closest("span").removeClass("checked");
				$(this).removeAttr("checked");
			}else{
				$(this).closest("span").addClass("checked");
				$(this).attr("checked","true");
			}
		});
		
		return false;
	});
	
	//绑定单选
	$("div").on("click","input[name='ids']",function(){
		var sender = $(this);
		var checked = sender.closest("span").hasClass("checked");
		if(checked){
			sender.closest("span").removeClass("checked");
			sender.removeAttr("checked");			
		}else{
			sender.closest("span").addClass("checked");
			sender.attr("checked","true");
		}
	});
	
	$("div").on("click", ".tabItem", function() {
		var tabId = $(this).parent().prop("id");
		tabId = tabId.substring(0,tabId.indexOf("_"));
		$ESTab.setOpenTab(tabId);
		return false;
	});
	
	$("div").on("click", ".removeTab", function() {
		var tabId = $(this).parent().prop("id");
		tabId = tabId.substring(0,tabId.indexOf("_"));
		$ESTab.removeTab(tabId);
		return false;
	});
	
});

