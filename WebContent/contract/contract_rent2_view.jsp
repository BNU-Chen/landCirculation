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
<script src="../common/calendarDatetime.js" type="text/javascript"></script>
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
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td width="160"><span><b>二、出租期限</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ContractRent!saveContract_rent2">
					<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
						width="100%">
						<tr class="hide">
							<td></td>
							<td><input id="contractBase.id" name="contractBase.id"
								type="hidden" value="${contractBase.id}" /><input
								id="contractRent.id" name="contractRent.id" type="hidden"
								value="${contractRent.id}"  /></td>
						</tr>
						<tr>
							<td width="200"><label>流转起止期限</label></td>
							<td><span id="sprytextfield7"> <input
									name="contractBase.fromDate" type="text" id="text6"
									onclick="setDay(this);"
									<s:if test="#contractBase.fromDate!=null">
										value=<s:date name="#contractBase.fromDate" format="yyyy-MM-dd" /></s:if>
									size="8" /> <span class="textfieldRequiredMsg">输入起始日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span> 至<span
								id="sprytextfield8"> <input name="contractBase.toDate"
									type="text" id="text7" onclick="setDay(this);"
									<s:if test="#contractBase.toDate!=null">
										value=<s:date name="#contractBase.toDate" format="yyyy-MM-dd" /></s:if>
									size="8" /> <span class="textfieldRequiredMsg">输入终止日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span>（不得超过土地承包期的剩余期限）,共<input
								type="text" value="${contractBase.duration}" disabled="disabled" />年。</td>
							
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" value="保存" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield7 = new Spry.Widget.ValidationTextField(
				"sprytextfield7", "date", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					format : "yyyy-mm-dd"
				});
		var sprytextfield8 = new Spry.Widget.ValidationTextField(
				"sprytextfield8", "date", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					format : "yyyy-mm-dd"
				});
		
	</script></
						body>
</html>