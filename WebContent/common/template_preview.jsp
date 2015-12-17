<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@page
	import="java.util.*,com.opensymphony.xwork2.util.*,cn.ac.irsa.landcirculation.UserPerson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>农村土地承包经营权流转-转入需求申报表</title>
<sx:head />
<link href="../common/print.css" rel="stylesheet" type="text/css" />
<script src="../common/print.js" type="text/javascript"></script>
<!--media=print 这个属性可以在打印时有效-->
<style media=print>
.NOPRINT {
	display: none;
	font-family: "宋体";
	font-size: 9pt;
}

.PageNext {
	page-break-after: always;
}
</style>
<script language="javascript">
	function printPreview() {
		/* 		alert("test: invoked!");
		 alert("WebBrowser:" + document.getElementById("WebBrowser")); */
		document.getElementById("WebBrowser").ExecWB(7, 1);
	}
	function print_newwindow() {
		var contractfillingId = document.getElementById("contractfilling.id").value;

		url = "ContractfillingimgUpload!previewContractfillingimgs?contractfilliingimg.id="
				+ contractfillingId;
		alert(url);
		window
				.open(
						url,
						"打印申请表",
						'height=1100, width=714, top=0, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');

	}

	function autoprint() {
		window.print();
		setTimeout("window.close()", 5000); //毫秒 
	}
</script>
</head>
<body onload="pagesetup_report();">
	<center class="NOPRINT">
		<OBJECT id="WebBrowser" height="0" width="0"
			classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
		</OBJECT>
		<input id="circulatinDemand.id" type=hidden
			value="${circulationDemand.id}" /> <input type=button value="浏览器打印 "
			onclick="autoprint();" /> <input type=button value="返回"
			onclick="window.close();" />
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<div class="A4content">
			<div class="pageTop">
				<table class="tablenoborder" cellspacing="0" cellpadding="0">
					<tr>
						<td height="80"></td>
					</tr>
				</table>
			</div>
			<div class="pageContent">
				<table class="tablenoborder" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="40"></td>
						<td width="634" height="960"></td>
						<td width="40"></td>
					</tr>
				</table>
			</div>
			<div class="pageBottom">
				<table class="tablenoborder" cellspacing="0" cellpadding="0">
					<tr>
						<td height="80"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
</body>
</html>