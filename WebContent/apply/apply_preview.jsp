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
<%@page import="java.util.*"%>
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
	// 	function print() {
	// 		var applyid = document.getElementById("applyId").value;
	// 		url = "Apply!printApply?apply.id=" + applyid;
	// 		alert(url);
	// 		window
	// 				.open(
	// 						url,
	// 						"打印申请表",
	// 						'height=1100, width=714, top=0, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');

	// 	}

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
		<input id="applyId" type=hidden value="${Apply.id}" />
		<%--<input
			type=button value=打印 onclick=window.print() /> <input type=button
			value=直接打印 onclick=document.all.WebBrowser.ExecWB(6,6) /> <input
			type=button value="页面设置" onclick=document.all.WebBrowser.ExecWB(8,1) />
		<input type=button value="打印预览 " onclick="printPreview()" />
		<s:url action="Apply!previewApply" var="urlPreviewApply">
			<s:param name="apply.id" value="#Apply.id" />
		</s:url>
		<label><a href="${urlPreviewApply}" target="_blank">打印测试</a></label> --%>
		<!-- 		<input type=button value="打印测试 " onclick="print()" /> -->
		<input type=button value="浏览器打印 " onclick="autoprint();" />
		<!-- 		<input type=button value="返回" onclick="window.close();" /> -->
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<div class="A4content">
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="40"></td>
				</tr>
			</table>
			<table class="tablenoborder" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="40"></td>
					<td width="634" height="1000" valign="top">
						<table class="tablenoborder" width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tr>
								<td><div class="title1">
										<s:property value="#Apply.landCountyName" />
										农村土地承包经营权流转申请表
									</div>
									<table class="tableborder1" width="100%" border="0"
										cellpadding="0" cellspacing="0">
										<tr>
											<td width="70" height="30">申请人姓名</td>
											<td width="70"><s:property value="#applier.userName" /></td>
											<td width="28">年龄</td>
											<td width="28"><s:set var="idcode"
													value="#applier.userIdcode.substring(6,10)" scope="page" />
												<%
													Calendar today = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
													int thisyear = today.get(Calendar.YEAR);
												%> <%=thisyear - Integer.parseInt(pageContext.findAttribute("idcode").toString())%>
											</td>
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
										<!-- 										<tr> -->
										<!-- 											<td height="30">土地权利证明</td> -->
										<%-- 											<s:if test="#Apply.rightAuthType==1"> --%>
										<!-- 												<td colspan="3">承包经营权证</td> -->
										<%-- 											</s:if> --%>
										<%-- 											<s:else> --%>
										<!-- 												<td colspan="3">承包经营合同</td> -->
										<%-- 											</s:else> --%>
										<!-- 											<td>编号</td> -->
										<%-- 											<s:if test="#Apply.rightAuthType==1"> --%>
										<%-- 												<td colspan="5" align="left">权证:<s:property --%>
										<%-- 														value="#Apply.landWarrantCode" /></td> --%>
										<%-- 											</s:if> --%>
										<%-- 											<s:else> --%>
										<%-- 												<td colspan="5" align="left">合同：<s:property --%>
										<%-- 														value="#Apply.landContractCode" /></td> --%>
										<%-- 											</s:else> --%>
										<!-- 										</tr> -->
										<tr>
											<td height="30">土地座落</td>
											<td colspan="7"><s:property value="#Apply.landAddress" /></td>
											<td>权利证明</td>
											<s:if test="#Apply.rightAuthType==1">
												<td align="left">权证:<s:property
														value="#Apply.landWarrantCode" /></td>
											</s:if>
											<s:else>
												<td align="left">合同：<s:property
														value="#Apply.landContractCode" /></td>
											</s:else>
										</tr>
										<tr>
											<td colspan="10"><table class="tablenoborder"
													width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="106" height="30">流转总面积：</td>
														<td width="77"><s:property value="#Apply.landRgArea" /></td>
														<td width="95">亩，其中：田</td>
														<td width="95"><s:property
																value="#Apply.paddyfieldRgArea" /></td>
														<td width="48">亩，土</td>
														<td width="97"><s:property
																value="#Apply.drylandRgArea" /></td>
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
														<td width="38" rowspan="2" class="tdtop0">田<br />
															（土）
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
															<s:set name="count" value="#st.count" />
														</tr>
													</s:iterator>
													<s:bean name="org.apache.struts2.util.Counter" id="counter">
														<s:param name="first" value="#count+1" />
														<s:param name="last" value="10" />
														<s:iterator>
															<tr>
																<td class="tdleft0" height="30">#</td>
																<td>#</td>
																<td>#</td>
																<td>#</td>
																<td>#</td>
																<td>#</td>
																<td>#</td>
																<td>#</td>
																<td>#</td>
															</tr>
														</s:iterator>
													</s:bean>
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
											<td width="85" height="100">申请人意见(凡年满18周岁的家庭成员均应在此签署意见)</td>
											<td colspan="9"><table class="tablenoborder"
													width="100%" border="0" cellpadding="0" cellspacing="0"
													class="tablenoborder">
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
											<td><s:property value="#transfereePerson.transfereeName" /></td>
											<td>年龄</td>
											<td><s:if
													test="#transfereePerson.transfereeIdcode.substring(6,10)!=null">
													<s:set var="idcode"
														value="#transfereePerson.transfereeIdcode.substring(6,10)"
														scope="page" />
													<%-- <s:set var="idcode"
						value="Integer.parseInt(#applier.userIdcode.substring(6,10))" /> --%>
													<%
														/* Date today=new Date();
																																																																																																																																																																																																																																																																																																																												int thisyear=today.getYear(); */
															Calendar today2 = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
															int thisyear2 = today2.get(Calendar.YEAR);
													%>
													<%=thisyear2 - Integer.parseInt(pageContext.findAttribute("idcode").toString())%></s:if></td>

											<td>文化</td>
											<td>&nbsp;</td>
											<td>联系电话</td>
											<td><s:property value="#transfereePerson.transfereeTel" /></td>
											<td>电子邮件</td>
											<td><s:property value="#transfereePerson.transfereeTel" /></td>
										</tr>
										<tr>
											<td height="30">身份证号码</td>
											<td colspan="3"><s:property
													value="#transfereePerson.transfereeIdcode" /></td>
											<td>住址</td>
											<td colspan="5"><s:property
													value="#transfereePerson.transfereeAddress" /></td>
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
											<td colspan="9"><table class="tablenoborder"
													width="100%" border="0" cellpadding="0" cellspacing="0"
													class="tablenoborder">
													<tr>
														<td height="90" colspan="6">&nbsp;</td>
													</tr>
													<tr>
														<td width="478">&nbsp;</td>
														<td height="30" colspan="2" align="left">签字</td>
														<td colspan="3"></td>
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
									</table></td>
							</tr>
						</table>
					<td width="40"></td>
				</tr>
			</table>
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="40">第1页（共1页）</td>
				</tr>
			</table>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
</body>
</html>
