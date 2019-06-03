<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/include/path.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit" />
<title>交易系统管理后台</title>
<link rel="icon" href="build/custom/images/logo_o.png"
	type="image/x-icon" />
<%@ include file="/include/style.jsp"%>

</head>

<body class="theme-dark">
	<input type="hidden" value="${removeControlId }" id="removeControlId" />

	<div class="modal" id="dialog-page" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" id="dialog-content"></div>
		</div>
	</div>

	<!-- 顶部 -->
	<header class="header navbar navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <!--   <img src="build/custom/images/logo.png" style="padding:5px;width:125px;height:40px;"/>  -->
			</a> <a href="#" class="toggle-sidebar bs-tooltip"
				data-placement="bottom" data-original-title="隐藏导航栏"> <i
				class="fa fa fa-th-list"></i>
			</a>

			<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
				<li><a href="javascript:;" onclick="changeTheme('theme-light')"
					class="dropdown-toggle"> <i class="fa fa-sun-o"></i>
				</a></li>
				<li><a href="javascript:;" onclick="changeTheme('theme-dark')"
					class="dropdown-toggle"> <i class="fa fa-moon-o"></i>
				</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li id="userDropDownMenu" class="dropdown user"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-user"> </i> <span class="username">
							${loginUser.userName} </span> <i class="fa fa-caret-down small"> </i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="user/changePasswordPage" target="dialog"> <i
								class="fa fa-lock"></i>修改密码
						</a></li>
						<li class="divider"></li>
						<li><a href="logout"> <i class="fa fa-sign-out"></i>退出
						</a></li>
					</ul></li>
			</ul>
		</div>

	</header>

	<!-- 导航栏 -->
	<div id="container">
		<div id="sidebar" class="sidebar-fixed">
			<div id="sidebar-content" style="width: 225px">

				<ul id="nav">

					<li id="order"><a href="javascript:void(0);"> <i
							class="fa fa-random"></i>交易查询
					</a>
						<ul class="sub-menu">


							<li id="order_orderhistory"><a href="order/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>近期交易查询
							</a></li>

							<li id="order_orderDaifu"><a href="order/searchDaifu"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>代付查询
							</a></li>
							<li id="order_reject"><a href="transReject/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>已拒绝交易查询
							</a></li>

							<li id="order_pushhistory"><a href="reTransPush/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>推送查询
							</a></li>
							<!-- 							<li id="order_pushhistory"><a href="order/searchFreeze"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>冻结管理
							</a></li> -->
							<li id="order_successRateForm"><a
								href="order/successRateForm" class="menu" target="tab"> <i
									class="fa fa-angle-right"></i>成功率统计
							</a></li>
						</ul></li>

					<li id="base"><a href="javascript:void(0);"> <i
							class="fa fa-fire"></i>基础管理
					</a>
						<ul class="sub-menu">

							<li id="base_merchList"><a href="merch/search" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>前端商户管理
							</a></li>

							<li id="base_upMerchList"><a href="upMerch/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>渠道商户管理
							</a></li>

							<li id="base_instList"><a href="instOnline/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>机构管理
							</a></li>

							<li id="base_permissionList"><a href="permission/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>商户权限管理
							</a></li>

						</ul></li>
					<li id="base"><a href="javascript:void(0);"> <i
							class="fa fa-fire"></i>代付管理
					</a>
						<ul class="sub-menu">

							<li id="order_orderDaifuRen"><a href="order/searchDaifuRen"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>人工代付查询
							</a></li>


						</ul></li>
					<li id="merch"><a href="javascript:void(0);"> <i
							class="fa fa-fire"></i>商户池管理
					</a>
						<ul class="sub-menu">

							<li id="merch_channelmerchList"><a
								href="channelMerch/search" class="menu" target="tab"> <i
									class="fa fa-angle-right"></i>交易渠道号管理
							</a></li>

							<li id="merch_countList"><a href="channelMerch/countList"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>交易渠道统计
							</a></li>

							<li id="merch_sysBusinessList"><a href="sysBusiness/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>系统行业管理
							</a></li>

							<li id="merch_merchBusinessMap"><a
								href="businessMap/searchMerch" class="menu" target="tab"> <i
									class="fa fa-angle-right"></i>商户业务映射
							</a></li>

							<li id="merch_channelBusinessMap"><a
								href="businessMap/searchChannel" class="menu" target="tab">
									<i class="fa fa-angle-right"></i>渠道业务映射
							</a></li>

							<li id="merch_merchPoolmap"><a href="merchPoolMap/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>指定商户池配置
							</a></li>

							<li id="merch_merchPool"><a href="merchPool/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>商户池配置
							</a></li>

						</ul></li>

					<li id="interface"><a href="javascript:void(0);"> <i
							class="fa fa-cog"></i>接口管理
					</a>
						<ul class="sub-menu">

							<li id="interface_createOrderJuHe"><a
								href="interface/gotoForm?pageForm=createOrderJuHeForm"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>聚合下单接口
							</a></li>
							<li id="interface_createBalancePay"><a
								href="interface/gotoForm?pageForm=balancePayForm" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>余额代付
							</a></li>
							<li id="interface_frozen"><a
								href="interface/gotoForm?pageForm=frozenForm" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>冻结或解冻
							</a></li>

						</ul></li>

					<li id="account"><a href="javascript:void(0);"> <i
							class="fa fa-cog"></i>账户管理
					</a>
						<ul class="sub-menu">

							<li id="account_account"><a href="account/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>账户总账
							</a></li>

							<li id="account_accountDetail"><a
								href="accountDetail/search" class="menu" target="tab"> <i
									class="fa fa-angle-right"></i>记帐明细
							</a></li>

							<li id="account_accountMerch"><a href="accountMerch/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>商户账户管理
							</a></li>

							<li id="account_accountMerchHistory"><a
								href="accountMerch/searchHistory" class="menu" target="tab">
									<i class="fa fa-angle-right"></i>历史商户余额
							</a></li>

							<li id="account_accountInst"><a href="accountInst/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>代理商账户管理
							</a></li>

							<li id="account_accountInst"><a
								href="accountInst/searchChannel" class="menu" target="tab">
									<i class="fa fa-angle-right"></i>渠道账户管理
							</a></li>

							<li id="account_upchannelBalance"><a
								href="upchannelBalance/search" class="menu" target="tab"> <i
									class="fa fa-angle-right"></i>渠道余额
							</a></li>

							<li id="account_rate"><a href="rate/search" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>费率设置
							</a></li>

						</ul></li>

					<li id="system"><a href="javascript:void(0);"> <i
							class="fa fa-cog"></i>系统管理
					</a>
						<ul class="sub-menu">

							<li id="system_user"><a href="user/search" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>用户管理
							</a></li>

							<li id="system_role"><a href="role/search" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>角色管理
							</a></li>

							<li id="system_source"><a href="source/index" class="menu"
								target="tab"> <i class="fa fa-angle-right"></i>资源管理
							</a></li>

							<li id="system_operationLog"><a href="log/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>操作日志
							</a></li>

							<li id="system_exceptionLog"><a href="exceptionlog/search"
								class="menu" target="tab"> <i class="fa fa-angle-right"></i>异常日志
							</a></li>

						</ul></li>
				</ul>

			</div>

			<div id="divider" class="resizeable"></div>

		</div>
		<!-- 内容 -->
		<div id="content">
			<!-- 顶部tab导航栏 -->
			<div id="tab-navigate">
				<div id="slide_left">
					<i class="fa fa-chevron-left"></i>
				</div>
				<div id="slide_right">
					<i class="fa fa-chevron-right"></i>
				</div>
				<div id="slide-center">
					<ul id="tab-ul">
						<li id="ShouYe_tabItem" class="active li-home"><a
							href="javascript:;" class="tabItem"><i class="fa fa-home"></i><span>首页</span></a>
						</li>
					</ul>
				</div>

			</div>

			<!-- tab内容 -->
			<div class="container" id="page-container">
				<div id="ShouYe">
					<%@ include file="welcome.jsp"%>
				</div>
			</div>

		</div>

	</div>
	<!-- JS 最后引入可加快页面加载 -->
	<%@ include file="/include/javascript.jsp"%>

	<script>
		$(document).ready(function() {
			App.init();
			hideMenuAndControl();
			setLayout();
			$ESTab.initRightMenu();
			$ESTab.initHome("ShouYe", "welcome");

			/*  $(window).bind('beforeunload', function() {  
			     //关闭浏览器则执行退出程序  
			     $.ajax({  
			         url : "logout2",  
			         type : "post",  
			         success : function() {  
			             messagebox.alert("退出","您已成功登出！");  
			         }  
			     });  
			 });   */

		});
		function changeTheme(theme) {
			if (theme == 'theme-dark') {
				$("body").removeClass("theme-light");
				$("body").addClass(theme);
			} else {
				$("body").removeClass("theme-dark");
				$("body").addClass(theme);
			}
		}
		/* $.ajaxSettings.async = false; 
		 $.getJSON('log_analyze.php',{r:Math.random(),logid:logid,op:2,j:j},function(data){
		 if(data.success_agent){
		 var width=j*10;
		 $("#up_time_loading").empty().append("<div style=\"width:"+width+"px;height:10px;border:1px solid #333;background-color:#333\"></div>");
		 }
		 })
		 */
	</script>
</body>
</html>