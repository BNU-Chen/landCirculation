<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Insert title here</title>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<script src="../common/calendar.js" type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationRadio.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function paystyle(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paystyle");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paystyle";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}

		rows[style].style.display = "";

		var item = rows[style].getElementsByClassName("" + style);
		for ( var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}

	function paytime(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paytime");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paytime";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}
		rows[style].style.display = "";
		var item = rows[style].getElementsByClassName("" + style);
		for ( var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}
</script>
</head>
<body onload="init();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>流转合同-网上备案</label>
			</div>
			<div id="navi">
				<div id="naviItem">
					<s:a action="ContractSign!viewContractfilling" target="ViewTarget">
						<s:param name="contractfilling.id" value="#contractfilling.id" />流转合同基本信息
					</s:a>
				</div>
				<div id="naviItem">
					<s:a action="ContractSign!uploadContractfillingimgs"
						target="ViewTarget">
						<s:param name="contractfilling.id" value="#contractfilling.id" />上传合同扫描件</s:a>
				</div>
				<div id="naviItem"></div>
				<div id="naviItemMini">
					<s:a action="ContractfillingimgUpload!previewContractfillingimgs" target="_new">
						<s:param name="contractfilling.id" value="#contractfilling.id" />预览</s:a>
				</div>
				<div id="naviItemMini">
					<s:a action="ContractSign!submitContractfilling">
						<s:param name="contractfilling.id" value="#contractfilling.id" />提交审核</s:a>
				</div>
				<s:url action="ContractSign!printContract_rent" var="urlToPdf">
					<s:param name="contractfilling.id" value="#contractfilling.id" />
				</s:url>

			</div>
			<s:url var="urlContractInfo"
				action="ContractSign!viewContractfilling">
				<s:param name="contractfilling.id" value="#contractfilling.id" />
			</s:url>
			<div id="client">
				<iframe id="ViewTarget" name="ViewTarget" height="400"
					src="${urlContractInfo}" frameborder="0" scrolling="auto" width="100%"></iframe>

			</div>
		</div>
	</div>
</body>
</html>