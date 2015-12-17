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
<title>农村土地承包经营权流转合同（<s:property value="contractBase.contractNo" />）
</title>
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
		<input id="contractfilling.id" type=hidden
			value="${contractfilliing.id}" /> <input type=button value="浏览器打印 "
			onclick="autoprint();" /> <input type=button value="返回"
			onclick="window.close();" />
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<s:iterator var="contractfillingimg" value="#contractfillingimgs">
		<div class="A4">
			<div class="A4content"><img width="100%" height="100%" src="${contractfillingimg.contractfillingimgPathFilename}"></div>
		</div>
		<hr align="center" width="100%" size="1" class="NOPRINT" />
	</s:iterator>
</body>
</html>