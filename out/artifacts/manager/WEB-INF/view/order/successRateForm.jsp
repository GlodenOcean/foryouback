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
					<i class="icon-reorder"></i>成功率
				</h4>
			</div>

			<div class="widget-content  no-padding">
				<div class="dataTables_header clearfix">
					<!-- class=searchForm target=tab 必须 -->
					<form class="searchForm" action="order/successRateForm"
						method="post" class="form-inline" target="tab">
						<table class="search-table">
							<tr>
								<td nowrap="nowrap" class="col-md-1">日期</td>
								<td nowrap="nowrap" class="col-md-3"><input
									class="form-control" id="startCreateTimeRate"
									name="startCreateTime" type="text" value="${startCreateTime }"
									readonly="readonly"></td>
								<td nowrap="nowrap" class="col-md-1">支付类型</td>
								<td nowrap="nowrap" class="col-md-3"><select name="PayType"
									id="PayType" class="form-control">
										<option value="">所有</option>
										<option value="QQ" ${PayType eq '支付宝H5' ? 'selected' : '' }>支付宝H5</option>
										<option value="QQ" ${PayType eq 'QQ' ? 'selected' : '' }>QQ</option>
										<option value="银联在线" ${PayType eq '银联在线' ? 'selected' : '' }>银联在线</option>
										<option value="网关支付" ${PayType eq '网关支付' ? 'selected' : '' }>网关支付</option>
								</select></td>
								<td nowrap="nowrap">
									<button type="submit" class="btn green-haze">
										<i class="icon-search"></i>&nbsp;查找
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
								</form>
								<div>
									  <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	    							<div id="line" style="width: 1030px;height:400px;float: left;"></div>
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
var line = echarts.init(document.getElementById('line'));
var data=${data};
if(data == ""){
	alert("统计日期无交易，请重新选择日期！");
}
var option = {
     xAxis: {
        type: 'category',
        data: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
    },
    yAxis: {
        type: 'value',
    },
    series: [{
        data:data,
        type: 'line'
    }]
};

line.setOption(option);
</script>
<script>
	$("#startCreateTimeRate").datetimepicker({
		format : 'YYYY-MM-DD'
	});
	/* $("#endCreateTimeRate").datetimepicker({
		format : 'YYYY-MM-DD'
	}); */
</script>