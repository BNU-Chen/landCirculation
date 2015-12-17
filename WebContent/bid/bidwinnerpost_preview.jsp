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
<title>流转申请公示打印</title>
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
	function print() {
		var bidwinnerpostid = document.getElementById("bidwinnerpostid").value;
		url = "Bidwinnerpost!printBidwinnerpost?bidwinnerpost.id=" + bidwinnerpostid;
		alert(url);
		window
				.open(
						url,
						"打印流转申请公示",
						'height=5100, width=714, top=0, left=100, toolbar=no, menubar=no, scrollbars=1, resizable=no,location=n o, status=no');

	}
</script>
</head>
<body onload="pagesetup_report();">
	<center class="NOPRINT">
		<OBJECT id="WebBrowser" height="0" width="0"
			classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
		</OBJECT>
		<input id="bidwinnerpostid" type=hidden value="${bidwinnerpost.id}" />
		<%--<input
			type=button value=打印 onclick=window.print() /> <input type=button
			value=直接打印 onclick=document.all.WebBrowser.ExecWB(6,6) /> <input
			type=button value="页面设置" onclick=document.all.WebBrowser.ExecWB(8,1) />
		<input type=button value="打印预览 " onclick="printPreview()" />
		<s:url action="Apply!previewApply" var="urlPreviewApply">
			<s:param name="apply.id" value="#Apply.id" />
		</s:url>
		<label><a href="${urlPreviewApply}" target="_blank">打印测试</a></label> --%>
		<input type=button value="打印中标公告" onclick="print()" />
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<table class="title" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="title">竞标结果公告</td>

			</tr>
			<tr>
				<td class="title2">编号：<s:property
						value="#bidwinnerpost.winnerpostNo" />&nbsp;&nbsp;
				</td>

			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="30" colspan="6">竞标项目信息</td>
			</tr>
			<tr>
				<td class="emtd" width="13%" height="30">招标机构</td>
				<td width="20%"><s:property value="#bidwinnerpost.posterName" /></td>
				<td class="emtd" width="13%">招标编号</td>
				<td width="20%"><s:property value="#bidwinnerpost.postNo" /></td>
				<td class="emtd" width="13%">招标类型</td>
				<td ><s:property value="#bidwinnerpost.bidTypename" /></td>
			</tr>
			<tr>
				<td class="emtd" height="30">总面积(亩)</td>
				<td><s:property value="#bidwinnerpost.landRgArea" /></td>
				<td class="emtd">旱地面积(亩)</td>
				<td><s:property value="#bidwinnerpost.drylandRgArea" /></td>
				<td class="emtd">水田面积(亩)</td>
				<td><s:property value="#bidwinnerpost.paddyfieldRgArea" /></td>
			</tr>
			<tr>
				<td class="emtd" height="30">旱地起价</br>(元/亩)
				</td>
				<td><s:property value="#bidwinnerpost.drylandBaseprice" /></td>
				<td class="emtd" >水田起价</br>(元/亩)
				</td>
				<td><s:property value="#bidwinnerpost.paddyfieldBaseprice" /></td>
				<td class="emtd">投标保证金</br>(元)</td>
				<td><s:property value="#bidwinnerpost.deposit" /></td>
			</tr>
			<tr>
				<td class="emtd" height="30">竞标公告</br>发布日期
				</td>
				<td><s:date name="#bidwinnerpost.publishDate"
						format="yyyy年M月d日" /></td>
				<td class="emtd" >报名截止日期</td>
				<td><s:date name="#bidwinnerpost.applyEndDate"
						format="yyyy年M月d日" /></td>
				<td class="emtd" >投标时间</td>
				<td><s:date name="#bidwinnerpost.bidDate" format="yyyy年M月d日" /></td>
			</tr>

			<tr>
				<td height="30" colspan="6">中标人信息</td>
			</tr>
			<tr>
				<td class="emtd" class="emtd" width="84" height="30">竞标报名编号</td>
				<td ><s:property value="#bidwinnerpost.enrollNo" /></td>
				<td  class="emtd" width="84">中标人名称</td>
				<td ><s:property value="#bidwinnerpost.bidderName" /></td>
				<td class="emtd" width="84">中标人联系人</td>
				<td><s:property value="#bidwinnerpost.picName" /></td>
			</tr>
			<tr>
				<td class="emtd" height="30">联系人</br>身份证号码
				</td>
				<td><s:property value="#bidwinnerpost.picIdcode" /></td>
				<td class="emtd">联系人电话</td>
				<td><s:property value="#bidwinnerpost.picTel" /></td>
				<td class="emtd">电子邮件</td>
				<td><s:property value="#bidwinnerpost.picEmail" /></td>
			</tr>
			<tr>
				<td height="30" colspan="6">中标价格信息</td>
			</tr>
			<tr>
				<td class="emtd" width="84" height="30">总价（元）</td>
				<td> <s:property value="#bidwinnerpost.totalprice" /></td>
				<td class="emtd" width="84">土地单价</br>（元/亩）
				</td>
				<td ><s:property value="#bidwinnerpost.drylandprice" /></td>
				<td class="emtd" width="84">水田单价</br>（元/亩）
				</td>
				<td><s:property value="#bidwinnerpost.paddyfieldprice" /></td>
			</tr>
			<tr>
				<td class="emtd" height="30">补偿金增长率</br>（%/年）
				</td>
				<td><s:property value="#bidwinnerpost.increaserate" /></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="6"><table width="100%" border="0" cellpadding="0"
						cellspacing="0" class="tablenoborder">
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td height="30">&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="30">公示机构（盖章）</td>
							<td colspan="6"><s:property value="#bidwinnerpost.poster" /></td>
						</tr>
						<tr>
							<td width="445">&nbsp;</td>
							<td width="115">&nbsp;</td>
							<td width="34"><s:date
									name="#bidwinnerpost.winnerpostPublishdate" format="yyyy" /></td>
							<td width="16" height="30">年</td>
							<td width="29"><s:date
									name="#bidwinnerpost.winnerpostPublishdate" format="M" /></td>
							<td width="17">月</td>
							<td width="30"><s:date
									name="#bidwinnerpost.winnerpostPublishdate" format="d" /></td>
							<td width="26">日</td>
						</tr>
					</table></td>
			</tr>
		</table>

	</div>
</body>
</html>
