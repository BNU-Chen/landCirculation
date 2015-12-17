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
<title>Insert title here</title>
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
<body onload="autoprint();">
	<center class="NOPRINT">
		<OBJECT id="WebBrowser" height="0" width="0"
			classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
		</OBJECT>
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<table class="title" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="title">县农村土地承包经营权流转申请表</td>
			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="70" height="30">申请人姓名</td>
				<td width="70"><s:property value="#applier.userName" /></td>
				<td width="28">年龄</td>
				<td width="28"><s:set var="idcode"
						value="#applier.userIdcode.substring(6,10)" scope="page" /> <%-- <s:set var="idcode"
						value="Integer.parseInt(#applier.userIdcode.substring(6,10))" /> --%>
					<%
						/* Date today=new Date();
												int thisyear=today.getYear(); */
						Calendar today = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
						int thisyear = today.get(Calendar.YEAR);
					%> <%=thisyear - Integer.parseInt(pageContext.findAttribute("idcode").toString())%>
				</td>
				<td width="28">文化</td>
				<td width="56">小学肄业</td>
				<td width="56">联系电话</td>
				<td width="77"><s:property value="#applier.mobilephone" /></td>
				<td width="56">电子邮件</td>
				<td width="222"><s:property value="#applier.email" /></td>
			</tr>
			<tr>
				<td height="30">身份证号码</td>
				<td colspan="3"><s:property value="#applier.userIdcode" /></td>
				<td>住址</td>
				<td colspan="5"><s:property value="#applier.address" /></td>
			</tr>
			<tr>
				<td height="30">土地权利证明</td>
				<s:if test="#Apply.rightAuthType==1">
					<td colspan="3">承包经营权证</td>
				</s:if>
				<s:else>
					<td>承包经营合同</td>
				</s:else>
				<td>编号</td>
				<s:if test="#Apply.rightAuthType==1">
					<td colspan="5" align="left">权证:<s:property
							value="#Apply.landWarrantCode" /></td>
				</s:if>
				<s:else>
					<td colspan="7" align="left">合同：<s:property
							value="#Apply.landContractCode" /></td>
				</s:else>
			</tr>
			<tr>
				<td colspan="10"><table class="tablenoborder" width="100%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="106" height="30">流转总面积：</td>
							<td width="77"><s:property value="#Apply.landRgArea" /></td>
							<td width="95">亩，其中：田</td>
							<td width="95"><s:property value="#Apply.paddyfieldRgArea" /></td>
							<td width="48">亩，土</td>
							<td width="97"><s:property value="#Apply.drylandRgArea" /></td>
							<td width="83">亩；地块数：</td>
							<td width="72"><s:property value="#Apply.landNumber" /></td>
							<td width="42">块</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td colspan="10"><table class="tableright0 tablebottom0"
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="31" rowspan="2" class="tdleft0 tdtop0">序号</td>
							<td width="120" rowspan="2" class="tdtop0">地块名称（编号）</td>
							<td width="38" rowspan="2" class="tdtop0">田<br /> （土）
							</td>
							<td width="91" rowspan="2" class="tdtop0">面积（亩）</td>
							<td colspan="4" class="tdtop0">四至界限</td>
							<td width="114" rowspan="2" class="tdtop0">是否基本农田</td>
						</tr>
						<tr>
							<td width="80">东</td>
							<td width="80">南</td>
							<td width="80">西</td>
							<td width="81">北</td>
						</tr>
						<s:iterator var="parcel" value="#parcels" status="st">
							<tr>
								<td height="30" class="tdleft0"><s:property
										value="#st.index+1" /></td>
								<td><s:property value="#parcel.parcelCode" /></td>
								<td><s:if test="#parcel.type==1">田</s:if> <s:if
										test="#parcel.type==2">地</s:if></td>
								<td><s:property value="#parcel.rgArea" /></td>
								<td><s:property value="#parcel.east" /></td>
								<td><s:property value="#parcel.south" /></td>
								<td><s:property value="#parcel.west" /></td>
								<td><s:property value="#parcel.north" /></td>
								<s:if test="#parcel.basicFarmland==1">
									<td>高标准基本农田</td>
								</s:if>
								<s:elseif test="#parcel.basicFarmland==2">
									<td>基本农田</td>
								</s:elseif>
								<s:else>
									<td>非基本农田</td>
								</s:else>
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
							<td>&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="45">流转事由</td>
				<td colspan="9">&nbsp;</td>
			</tr>
			<tr>
				<td height="45">转出方职业<br /> 和收入状况
				</td>
				<td colspan="9">&nbsp;</td>
			</tr>
			<tr>
				<td width="85" height="140">申请人意见(凡年满18周岁的家庭成员均应在此签署意见)</td>
				<td colspan="9"><table width="100%" border="0" cellpadding="0"
						cellspacing="0" class="tablenoborder">
						<tr>
							<td colspan="6" height="110">&nbsp;</td>
						</tr>
						<tr>
							<td width="478">&nbsp;</td>
							<td width="18">年</td>
							<td width="44">&nbsp;</td>
							<td width="19">月</td>
							<td width="45">&nbsp;</td>
							<td width="26">日</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="30">转入方姓名</td>
				<td>&nbsp;</td>
				<td>年龄</td>
				<td>&nbsp;</td>
				<td>文化</td>
				<td>&nbsp;</td>
				<td>联系电话</td>
				<td>&nbsp;</td>
				<td>电子邮件</td>
				<td><s:property value="#applier.email" /></td>
			</tr>
			<tr>
				<td height="30">身份证号码</td>
				<td colspan="3"><s:property value="#applier.userIdcode" /></td>
				<td>住址</td>
				<td colspan="5"><s:property value="#applier.address" /></td>
			</tr>
			<tr>
				<td height="45">转入方<br /> 经营情况
				</td>
				<td colspan="9">&nbsp;</td>
			</tr>
			<tr>
				<td height="30">流转合同号</td>
				<td colspan="5">&nbsp;</td>
				<td colspan="2">签订流转合同时间</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>发</br>包</br>方</br>意</br>见
				</td>
				<td colspan="9"><table width="100%" border="0" cellpadding="0"
						cellspacing="0" class="tablenoborder">
						<tr>
							<td height="120" colspan="6">&nbsp;</td>
						</tr>
						<tr>
							<td width="478">&nbsp;</td>
							<td height="30" colspan="5">签字</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td width="18">年</td>
							<td width="44">&nbsp;</td>
							<td width="19">月</td>
							<td width="45">&nbsp;</td>
							<td width="26" height="30">日</td>
						</tr>
					</table></td>
			</tr>
		</table>
		<hr align="center" width="100%" size="1" class="NOPRINT" />
	</div>
	<center class="NOPRINT">第1页</center>

	<!--分页-->
	<div class="PageNext"></div>
	第二页的内容
	<center class="NOPRINT">第2页</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
</body>
</html>
