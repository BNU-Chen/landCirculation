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
	function autoprint() {
		pagesetup_report();
		document.getElementById("WebBrowser").ExecWB(6, 6);
		setTimeout("window.close()", 1000); //毫秒 
	}
	
</script>
</head>
<!-- <body onload="autoprint();"> -->
<body onload="setTimeout('autoprint()',2000);">
	<center class="NOPRINT">
		<OBJECT id="WebBrowser" height="0" width="0"
			classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
		</OBJECT>
		<input type=button
			value=直接打印 onclick=document.all.WebBrowser.ExecWB(6,6) />
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<table class="title" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="title">土地流转申请公示</td>
			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="84" height="30">公示机构</td>
				<td colspan="3"><s:property value="#postApply.poster" /></td>
			</tr>
			<tr>
				<td height="30">起始日期</td>
				<td width="230"><s:date name="#postApply.startDate"
						format="yyyy年M月d日" /></td>
				<td width="102">结束日期</td>
				<td width="297"><s:date name="#postApply.endDate"
						format="yyyy年M月d日" /></td>
			</tr>
			<tr>
				<td height="30">反馈联系人</td>
				<td><s:property value="#postApply.responsePicname" /></td>
				<td>联系电话</td>
				<td><s:property value="#postApply.responseTel" /></td>
			</tr>
			<tr>
				<td height="30">电子邮件</td>
				<td><s:property value="#postApply.responseEmail" /></td>
				<td>联系住址</td>
				<td><s:property value="#postApply.responseAddress" /></td>
			</tr>
			<tr>
				<td height="30" colspan="4">土地流转申请列表</td>
			</tr>
			<tr>
				<td colspan="4"><table class="tableright0 tablebottom0"
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
						<s:iterator var="postdetailApply" value="#postdetailApplys"
							status="st">
							<tr>
								<td class="tdleft0"><s:property value="#st.index+1" /></td>
								<td><s:property value="#postdetailApply.applierName" /></td>
								<td><s:property value="#postdetailApply.applierIdcode" /></td>
								<td><s:property value="#postdetailApply.landRgArea" /></td>
								<td><s:property value="#postdetailApply.paddyfeildRgArea" /></td>
								<td><s:property value="#postdetailApply.drylandRgArea" /></td>
								<td><s:if test="#postdetailApply.rightAuthType==1">权证：<s:property
											value="#postdetailApply.landwarrantCode" />
									</s:if> <s:else>权证：<s:property
											value="#postdetailApply.landcontractCode" />
									</s:else></td>
								<td><s:property value="#postdetailApply.landAddress" /></td>
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
				<td colspan="4"><table width="100%" border="0" cellpadding="0"
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
							<td colspan="6"><s:property value="#postApply.poster" /></td>
						</tr>
						<tr>
							<td width="445">&nbsp;</td>
							<td width="115">&nbsp;</td>
							<td width="34"><s:date name="#postApply.publishDate"
									format="yyyy" /></td>
							<td width="16" height="30">年</td>
							<td width="29"><s:date name="#postApply.publishDate"
									format="M" /></td>
							<td width="17">月</td>
							<td width="30"><s:date name="#postApply.publishDate"
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
	<s:iterator var="postdetailApply" value="#postdetailApplys" status="st">
			<div class="PageNext"></div>
		<s:url var="urlPreviewApplyDetail"
			value="PostApply!previewApplyDetail">
			<s:param name="postdetailApply.id" value="#postdetailApply.id" />
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
