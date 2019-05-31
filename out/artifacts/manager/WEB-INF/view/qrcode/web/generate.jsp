<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="icon-reorder"></i>生成二维码
		</h4>
	</div>

	<div class="widget-content">
		<div>
			<label>商户类型：</label> <input type="radio" value="0" name="merchtype"
				id="clmerch" checked /> 存量商户 <input type="radio" value="1"
				name="merchtype" id="premerch" /> 预生成商户 <input type="radio"
				value="3" name="merchtype" id="spemerch" /> 指定商户号生成
		</div>
		<div id="divnum1">
			<label>二维码的数量：</label> <input type="number" name="nums" id="nums" />
		</div>
		<div id="divnum3" style="display: none;">
			<label>机构号：</label> <input type="text" name="orgCode" id="orgCode"
				maxlength="8" />
		</div>

		<div id="divnum2" style="display: none;">
			<label>商户号(英文','分隔)：</label> <input type="text" name="serialIds"
				id="merchs" />
		</div>
		<div>
			<label>二维码是否包含背景图：</label> <input type="radio" value="0"
				name="qrCode" checked /> 是 <input type="radio" value="1"
				name="qrCode" /> 否
		</div>
		<div>
			<label>背景图片</label> <input type="radio" value="1" name="bgtype"
				checked />汇云付 <input type="radio" value="0" name="bgtype" />民生
		</div>
		<button type="submit" class="btn green-haze" onclick="generate()">
			<i class="icon-search"></i>&nbsp;生成
		</button>
	</div>
</div>
<script>
	function generate() {

		var type = $("input[name='merchtype']:checked").val();
		if (type == undefined) {
			alert("请选择商户类型");
			return false;
		}

		var num = 0;
		var orgcode = "";
		if (type == 3) {
			num = $("#merchs").val();
		} else {
			num = $("#nums").val();
			if (type == 1) {
				orgcode = $("#orgCode").val();
				if (orgcode == "") {
					alert("请输入机构号");
					return false;
				}
			}

		}

		if (num == "") {
			if (type == 3) {
				alert("请输入商户号");
			} else {
				alert("请输入生成数量");
			}
			return false;
		} else {
			if (type != 3 && num > 1000) {
				alert("每次最多生成1000个");
				document.getElementById("nums").value = "1000";
				return false;
			}
		}
		var qrcode = $("input[name='qrCode']:checked").val();
		if (qrcode == undefined) {
			alert("请选择二维码图片是否带背景");
			return false;
		}
		var bgtype = $("input[name='bgtype']:checked").val();

		var data = "";
		var url = "";
		if (type == 3) {
			data = "qrCode=" + qrcode + "&serialIds=" + num + "&merchtype="
					+ type + "&bgtype=" + bgtype;
			url = "qrCode/createBySerialNo";
		} else {
			data = "qrCode=" + qrcode + "&nums=" + num + "&merchtype=" + type
					+ "&orgCode=" + orgcode + "&bgtype=" + bgtype;
			url = "qrCode/create";
		}
		loadJson(url, data);

	}
	$(function() {
		$("#clmerch").click(function() {
			$("#divnum1").show();
			$("#divnum2").hide();
			$("#divnum3").hide();
		});
		$("#premerch").click(function() {
			$("#divnum1").show();
			$("#divnum2").hide();
			$("#divnum3").show();
		});
		//指定商户
		$("#spemerch").click(function() {
			$("#divnum1").hide();
			$("#divnum2").show();
			$("#divnum3").hide();
		});

	});
</script>
