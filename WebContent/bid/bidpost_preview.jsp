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
		var bidpostid = document.getElementById("bidpostid").value;
		url = "BidPost!printBidpost?bidpost.id=" + bidpostid;
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
		<input id="bidpostid" type=hidden value="${bidpost.id}" />
		<%--<input
			type=button value=打印 onclick=window.print() /> <input type=button
			value=直接打印 onclick=document.all.WebBrowser.ExecWB(6,6) /> <input
			type=button value="页面设置" onclick=document.all.WebBrowser.ExecWB(8,1) />
		<input type=button value="打印预览 " onclick="printPreview()" />
		<s:url action="Apply!previewApply" var="urlPreviewApply">
			<s:param name="apply.id" value="#Apply.id" />
		</s:url>
		<label><a href="${urlPreviewApply}" target="_blank">打印测试</a></label> --%>
		<input type=button value="打印测试 " onclick="print()" />
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<table class="title" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="title">土地流转招标公告</td>
			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="84" height="30">招标机构</td>
				<td width="150"><s:property value="#bidpost.posterName" /></td>
				<td width="84">招标编号</td>
				<td width="150"><s:property value="#bidpost.postNo" /></td>
			<td width="84">招标类型</td>
				<td><s:property value="#bidpost.bidTypename" /></td>	
			</tr>
			<tr>
				<td height="30">总面积(亩)</td>
				<td><s:property value="#bidpost.landRgArea" /></td>
				<td>旱地面积(亩)</td>
				<td><s:property value="#bidpost.drylandRgArea" /></td>
				<td>水田面积(亩)</td>
				<td><s:property value="#bidpost.paddyfieldRgArea" /></td>
			</tr>
			<tr>
				<td height="30">旱地起价</br>(元/亩)</td>
				<td><s:property value="#bidpost.drylandBaseprice" /></td>
				<td>水田起价</br>(元/亩)</td>
				<td><s:property value="#bidpost.paddyfieldBaseprice" /></td>
				<td>投标保证金(元)</td>
				<td><s:property value="#bidpost.deposit" /></td>
			</tr>
			<tr>
				<td height="30">报名起始日期</td>
				<td><s:date name="#bidpost.applyStartDate" format="yyyy年M月d日" /></td>
				<td>报名结束日期</td>
				<td><s:date name="#bidpost.applyEndDate" format="yyyy年M月d日" /></td>
				<td>开标时间</td>
				<td><s:date name="#bidpost.bidDate" format="yyyy年M月d日" /></td>
			</tr>
			<tr>
				<td height="30">招标联系人</td>
				<td><s:property value="#bidpost.picName" /></td>
				<td>联系电话</td>
				<td><s:property value="#bidpost.picTel" /></td>
				<td>电子邮件</td>
				<td><s:property value="#bidpost.picEmail" /></td>
			</tr>
			<tr>
				<td height="30">联系住址</td>
				<td colspan="5"><s:property value="#bidpost.picAddress" /></td>
			</tr>
			<tr>
				<td height="30" colspan="6">土地流转申请列表</td>
			</tr>
			<tr>
				<td colspan="6"><table class="tableright0 tablebottom0"
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="16" class="tdleft0 tdtop0">序号</td>
							<td width="60" class="tdtop0">申请人姓名</td>
							<td width="120" class="tdtop0">申请人身份证号码</td>
							<td width="48" class="tdtop0">总面积（亩）</td>
							<td width="48" class="tdtop0">田面积（亩）</td>
							<td width="48" class="tdtop0">地面积（亩）</td>
							<td width="184" class="tdtop0">权证（合同）编号</td>
							<td class="tdtop0">土地地址</td>
						</tr>
						<s:iterator var="bidpostDetail" value="#bidpostDetails"
							status="st">
							<tr>
								<td height="30" class="tdleft0"><s:property
										value="#st.index+1" /></td>
								<td><s:property value="#bidpostDetail.applierName" /></td>
								<td><s:property value="#bidpostDetail.applierIdcode" /></td>
								<td><s:property value="#bidpostDetail.landRgArea" /></td>
								<td><s:property value="#bidpostDetail.paddyfeildRgArea" /></td>
								<td><s:property value="#bidpostDetail.drylandRgArea" /></td>
								<td><s:if test="#bidpostDetail.rightAuthType==1">权证：<s:property
											value="#bidpostDetail.landwarrantCode" />
									</s:if> <s:else>权证：<s:property
											value="#bidpostDetail.landcontractCode" />
									</s:else></td>
								<td><s:property value="#bidpostDetail.landAddress" /></td>
							</tr>
						</s:iterator>
						<tr>
							<td height="30" class="tdleft0">&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table></td>
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
							<td colspan="6"><s:property value="#bidpost.poster" /></td>
						</tr>
						<tr>
							<td width="445">&nbsp;</td>
							<td width="115">&nbsp;</td>
							<td width="34"><s:date name="#bidpost.publishDate"
									format="yyyy" /></td>
							<td width="16" height="30">年</td>
							<td width="29"><s:date name="#bidpost.publishDate"
									format="M" /></td>
							<td width="17">月</td>
							<td width="30"><s:date name="#bidpost.publishDate"
									format="d" /></td>
							<td width="26">日</td>
						</tr>
					</table></td>
			</tr>
		</table>

	</div>
	<center class="NOPRINT">第1页</center>
	<hr align="center" width="100%" size="1" class="NOPRINT" />

	<!--分页-->
	<s:iterator var="bidpostDetail" value="#bidpostDetails" status="st">
		<div class="PageNext"></div>
		<s:url var="urlPreviewApplyDetail" value="BidPost!previewApplyDetail">
			<s:param name="bidpostDetail.id" value="#bidpostDetail.id" />
		</s:url>
		<sx:div href="%{urlPreviewApplyDetail}">
		</sx:div>
		<div class="NOPRINT">
			<center>
				第
				<s:property value="#st.index+2" />
				页
			</center>
			<hr align="center" width="100%" size="1" class="NOPRINT" />
		</div>
	</s:iterator>
</body>
</html>
