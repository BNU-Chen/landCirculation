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
<%@page import="java.util.*"%>
<title>Insert title here</title>
<sx:head />
<link href="../common/print.css" rel="stylesheet" type="text/css" />
<script src="../common/print.js" type="text/javascript"></script>
</head>
<body>
	<div class="A4">
		<table class="title" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="title"><s:property value="Apply.landCounty" />县农村土地承包经营权流转申请表</td>
			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="70" height="30">申请人姓名</td>
				<td width="70"><s:property value="#applier.userName" /></td>
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
				<td width="28"></td>
				<td width="28">文化</td>
				<td width="56">小学肄业</td>
				<td width="56">联系电话</td>
				<td width="77"><s:property value="#applier.mobilephone" /></td>
				<td width="56">电子邮件</td>
				<td width="228"><s:property value="#applier.email" /></td>
			</tr>
			<tr>
				<td height="30">身份证号码</td>
				<td colspan="3"><s:property value="#applier.userIdcode" /></td>
				<td>住址</td>
				<td colspan="5"><s:property value="#applier.address" /></td>
			</tr>
			<tr>
				<td height="30" colspan="2">土地权利证明</td>
				<s:if test="#Apply.rightAuthType==1">
					<td colspan="4">承包经营权证</td>
				</s:if>
				<s:else>
					<td colspan="4">承包经营合同</td>
				</s:else>
				<td>编号</td>
				<s:if test="#Apply.rightAuthType==1">
					<td colspan="4" align="left">权证:<s:property
							value="#Apply.landWarrantCode" /></td>
				</s:if>
				<s:else>
					<td colspan="4" align="left">合同：<s:property
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
		</table>
	</div>
</body>
</html>