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
<title>农村土地承包经营权流转管理系统</title>
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
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script language="javascript">
	/* 	alert("test:" + !document.getElementsByClassName); */
	if (!document.getElementsByClassName) {
		/* alert("test4:"); */
		document.getElementsByClassName = function(strClassName, oElm,
				strTagName) {
			var arrElements = document.getElementsByTagName("*");

			var arrReturnElements = new Array();
			strClassName = strClassName.replace(/\-/g, "\\-");
			var oRegExp = new RegExp("(^|\\s)" + strClassName + "(\\s|$)");
			var oElement;
			for ( var i = 0; i < arrElements.length; i++) {
				oElement = arrElements[i];
				if (oRegExp.test(oElement.className)) {
					arrReturnElements.push(oElement);
				}
			}
			/* alert("test3:" + arrReturnElements.length); */
			return (arrReturnElements);
		};
	}

	function init() {
		//alert("init脚本启动");
		var clientWidth = document.documentElement.clientWidth
				|| document.body.clientwidth;
		var iframepanels = document.getElementsByClassName("iframepanel");
		//alert("clientWidth:"+clientWidth+"iframepanels:"+iframepanels.length);
		for ( var i = 0; i < iframepanels.length; i++) {
			iframepanels[i].style.width = clientWidth - 20 + "px";
		}

	}
	function showTabpane(cursel) {
		/* 		var panels = document.getElementById("client").getElementsByClassName(
		 "panel"); */
		var panels = document.getElementsByClassName("panel");
		var tabs = document.getElementById("toc").getElementsByTagName("label");
		// 		alert(cursel + "\n" + tabs.length);
		for ( var i = 0; i < tabs.length; i++) {
			panels[i].style.display = "block";
			if (i == cursel) {
				tabs.item(i).className = "selected";
				/* panels.item(i).style.display = "block"; */
				panels[i].style.display = "block";
				var str = "btnSubmit" + String(i + 1);
				//alert(str);
				//document.getElementById(str).click();
			} else {
				tabs.item(i).className = "";
				/* 				panels.item(i).style.display = "none"; */
				panels[i].style.display = "none";
			}

		}
	}

	/* 	function landRightCheckType(checktype) {

	 var table = document.getElementById("landRightCheck");
	 table.rows[4].className = "";
	 table.rows[5].className = "";
	 table.rows[6].className = "";
	 for ( var i = 1; i < table.rows.length - 1; i++) {
	 table.rows[i].style.display = "none";

	 }

	 table.rows[checktype * 3 + 1].style.display = "";
	 table.rows[checktype * 3 + 2].style.display = "";
	 table.rows[checktype * 3 + 3].style.display = "";

	 }
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
	 } */

	/* 	function landtransfer(style) {
	 var rows = document.getElementById("tabContract")
	 .getElementsByClassName("landtransfer");
	 for ( var i = 0; i < rows.length; i++) {
	 rows[i].style.display = "none";
	 rows[i].className = "landtransfer";
	 var item = rows[i].getElementsByClassName("" + i);
	 for ( var j = 0; j < item.length; j++) {
	 item[j].disabled = "disabled";
	 }
	 }
	 if (style == 1) {
	 rows[0].style.display = "";
	 var item = rows[0].getElementsByClassName("" + style);
	 for ( var i = 0; i < item.length; i++) {
	 item[0].disabled = ""; 
	 }
	 }
	 } */

	function landtransfer(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("landtransfer");
		rows[0].style.display = "none";
		rows[0].className = "landtransfer";
		rows[0].getElementsByClassName("1")[0].disabled = "disabled";

		if (style == 1) {
			rows[0].style.display = "";
			rows[0].getElementsByClassName("1")[0].disabled = "";
		}
	}

	function showModelDialog(page, width, height) {
		var re = window.showModalDialog(page, null, 'dialogWidth:' + width
				+ 'px;dialogHeight:' + height + 'px;');
		if (re == 1) {
			window.location.reload();
		}
	}
</script>

<style type="text/css">
#dlgUploadIDCard {
	display: none;
}

#dlgUploadPhoto {
	display: none;
}

#adress {
	font-size: 14px;
	width: 400px;
}

#client div {<!--
	display: none;
	-->
}
</style>
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationRadio.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="dlg">
		<div id="dlgClient">
			<iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
		</div>
		<div id="dlgOperation">

			<div id="dlgAddParcel">
				<input type="button" value="提   交" onclick="parcelAdded()" />
			</div>
			<div id="dlgUploadIDCard">
				<input type="button" value="提   交" onclick="idcardUploaded()" />
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="title">
			<label>协议出租流转申请</label>
		</div>
		<div id="toolbar">
			<table align="right">
				<tr>
					<td><label><s:url action="Apply!previewApply"
								var="urlPreviewApply">
								<s:param name="apply.id" value="#Apply.id" />
							</s:url><a href="${urlPreviewApply}">预览</a></label></td>
					<td><label><s:url action="Apply!saveApply"
								var="urlSaveApply">
								<s:param name="apply.id" value="#Apply.id" />
							</s:url><a href="${urlSaveApply}">提交申请</a></label></td>
				</tr>
			</table>
		</div>
		<div id="toc">
			<table border="0" align="left" cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="selected" id="default"
						onclick="showTabpane(0)">出租方信息</label></td>
					<td><label onclick="showTabpane(1)">承租方信息</label></td>
					<td><label onclick="showTabpane(2)">流转土地基本情况</label></td>
					<td><label onclick="showTabpane(3)">权属证明信息</label></td>
					<td><label onclick="showTabpane(4)">转让协议详情</label></td>
				</tr>
			</table>
		</div>
		<div id="client">
			<div id="transferor" class="panel">
				<s:url action="Apply!viewApplierInfo" var="urlViewApplierInfo">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>

				<iframe src="${urlViewApplierInfo}" class="iframepanel"
					frameborder="0" width="100%" height="400" scrolling="no"></iframe>
			</div>
			<div id="transferee" class="panel hide">
				<s:url action="TransfereePerson!viewTransferee"
					var="urlViewTransferee">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>

				<iframe src="${urlViewTransferee}" class="iframepanel"
					frameborder="0" width="100%" height="600" scrolling="no"></iframe>
			</div>
			<div id="landinfo" class="panel hide">
				<s:url action="Apply!viewLandinfo" var="urlViewLandInfo">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>

				<iframe src="${urlViewLandInfo}" class="iframepanel" frameborder="0"
					width="100%" height="1200" scrolling="no"></iframe>
			</div>

			<div id="rightCheck" class="panel hide">
				<s:url action="Apply!viewRightCheck" var="urlRightCheck">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>

				<iframe src="${urlRightCheck}" class="iframepanel" frameborder="0"
					width="100%" height="1200" scrolling="no"></iframe>
			</div>

			<div id="contract" class="panel hide">
				<s:url action="Rentcontract!viewRentcontract"
					var="urlViewRentcontract">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>

				<iframe src="${urlViewRentcontract}" class="iframepanel"
					frameborder="0" width="100%" height="3500" scrolling="no"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
