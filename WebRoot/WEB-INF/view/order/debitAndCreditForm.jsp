<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="build/custom/js/echarts.js"></script>

<div class="row">
	<div class="col-md-12">
		<div class="widget box">

			<div class="widget-header">
				<h4>
					<i class="icon-reorder"></i>借贷比
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="order/debitAndCredit"
						method="post" class="form-inline" target="tab">
						<table class="search-table">
							<tr>
								<td nowrap="nowrap" class="col-md-1">统计时间</td>
								<td nowrap="nowrap" class="col-md-3"><select
									name="searchTime" class="form-control">
										<option value="3" ${searchTime == '3' ? 'selected' : '' }>当天</option>
										<option value="2" ${searchTime == '2' ? 'selected' : '' }>一周</option>
										<option value="1" ${searchTime == '1' ? 'selected' : '' }>一个月</option>
								</select></td>
								<td nowrap="nowrap" class="col-md-1">前端商户号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="MerchId"
									value="${MerchId }"></td>
								<td nowrap="nowrap" class="col-md-1">发送机构号</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" type="text" name="AccInst"
									value="${AccInst }"></td>
								<td nowrap="nowrap">
									<button type="submit" class="btn green-haze">
										<i class="icon-search"></i>&nbsp;搜索
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>

				<div class="widget-header">
					<h4>
						<i class="icon-reorder"></i>统计结果
					</h4>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-content">
								<form class="row-border" action="#">
									<div class="row">
										<div class="col-md-6">
											<label class="control-label col-md-4">借记卡：</label> <label
												class="control-text col-md-2" style="white-space:nowrap;">${DEBIT } 笔</label>
										</div>
										<div class="col-md-6">
											<label class="control-label col-md-4">贷记卡:</label> <label
												class="control-text col-md-2" style="white-space:nowrap;">${CREDIT } 笔</label>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label class="control-label col-md-4">支付宝花呗:</label> <label
												class="control-text col-md-2" style="white-space:nowrap;">${PCREDIT } 笔</label>
										</div>
										<div class="col-md-6">
											<label class="control-label col-md-4">支付宝余额宝:</label> <label
												class="control-text col-md-2" style="white-space:nowrap;">${ALIPAYACCOUNT } 笔</label>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label class="control-label col-md-4">微信零钱：</label> <label
												class="control-text col-md-2" style="white-space:nowrap;">${CFT } 笔</label>
										</div>
										<div class="col-md-6">
											<label class="control-label col-md-4">借记卡占比：</label>
											<label class="control-text col-md-2">
												<c:if test="${DEBIT eq 0 and ALIPAYACCOUNT eq 0 and CFT eq 0 }">0%</c:if> 
												<c:if test="${DEBIT ne 0 or ALIPAYACCOUNT ne 0 or CFT ne 0 }">${fn:substring((DEBIT+ALIPAYACCOUNT+CFT)/(DEBIT+CREDIT+PCREDIT+ALIPAYACCOUNT+CFT)*100,0,5) }%</c:if> 
											</label>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label class="control-label col-md-4">贷记卡占比：</label>
											<label class="control-text col-md-2">
												<c:if test="${CREDIT eq 0 and PCREDIT eq 0 }">0%</c:if> 
												<c:if test="${CREDIT ne 0 or PCREDIT ne 0 }">${fn:substring((CREDIT+PCREDIT)/(DEBIT+CREDIT+PCREDIT+ALIPAYACCOUNT+CFT)*100,0,5) }% </c:if> 
												
											</label>
										</div>
										<div class="col-md-6">
											<label class="control-label col-md-4">借记卡比贷记卡：</label>
											<label class="control-text col-md-2">
											<c:choose>
													<c:when test="${CREDIT eq 0 and PCREDIT eq 0 and DEBIT eq 0 and ALIPAYACCOUNT eq 0 and CFT eq 0 }">1:1</c:when>
													<c:when test="${(CREDIT+PCREDIT)/(DEBIT+ALIPAYACCOUNT+CFT) > 1}">1:${fn:substring((CREDIT+PCREDIT)/(DEBIT+ALIPAYACCOUNT+CFT),0,1) }</c:when>
													<c:when test="${(DEBIT+ALIPAYACCOUNT+CFT)/(CREDIT+PCREDIT) > 1}">${fn:substring((DEBIT+ALIPAYACCOUNT+CFT)/(CREDIT+PCREDIT),0,1) }:1</c:when>
													<c:otherwise>1:1</c:otherwise>
											</c:choose>
											</label>
										</div>
									</div>
								</form>
								<div>
									  <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	    							<div id="merchAndInst" style="width: 430px;height:300px;float: left;"></div>
	    							<div id="channel" style="width: 430px;height:300px;float: left;"></div>
    							</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="/include/pagination.jsp"%>
			</div>
		</div>
	</div>
</div>
<script>
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('merchAndInst'));
var channelChart = echarts.init(document.getElementById('channel'));

var debitNum = ${DEBIT } ; 		//借记卡
var creditNum = ${CREDIT } ;		//信用卡
var pcreditNum = ${PCREDIT } ;	//支付宝花呗
var alipayaccountNum = ${ALIPAYACCOUNT } ;		//支付宝余额宝
var cftNum = ${CFT } ;	//微信零钱

var option = {
    title: {
    	top:10,
        text: '商户和机构统计图'
    },
    tooltip: {
    	top:50,
    	trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    legend: {
        top:50,
    	orient: 'vertical',
        x: 'left',
        data:['支付宝花呗','支付宝余额宝','微信零钱','借记卡','贷记卡']
    },
    series: [
        {
        	name:'无卡统计',
            type:'pie',
            radius: ['50%', '80%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '25',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:pcreditNum, name:'支付宝花呗'},
                {value:alipayaccountNum, name:'支付宝余额宝'},
                {value:cftNum, name:'微信零钱'},
                {value:debitNum, name:'借记卡'},
                {value:creditNum, name:'贷记卡'}
            ]
        }
    ]
};

var msPrivate = ${msPrivate } ; 		
var msPublic = ${msPublic } ;		
var channel = {
	    title: {
	    	top:10,
	        text: '对公对私统计图'
	    },
	    tooltip: {
	    	top:50,
	    	trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	        top:50,
	    	orient: 'vertical',
	        x: 'left',
	        data:['民生对公','民生对私']
	    },
	    series: [
	        {
	        	name:'无卡统计',
	            type:'pie',
	            radius: ['50%', '80%'],
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'center'
	                },
	                emphasis: {
	                    show: true,
	                    textStyle: {
	                        fontSize: '25',
	                        fontWeight: 'bold'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	                {value:msPublic, name:'民生对公'},
	                {value:msPrivate, name:'民生对私'}
	            ]
	        }
	    ]
	};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
channelChart.setOption(channel);
</script>