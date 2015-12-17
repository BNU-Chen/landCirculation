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
<title>农村土地承包经营权流转-转入需求登记表</title>
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
						<td height="40"></td>
					</tr>
				</table>
			</div>
			<div class="pageContent">
				<table class="tablenoborder" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="40"></td>
						<td width="634" height="1000" valign="top">
							<table class="tablenoborder" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td>
										<div class="title1">农村土地承包经营权流转需求登记表</div>
										<table class="tableborder1" cellpadding="0" cellspacing="0">
											<tr>
												<td colspan="6" height="40"><b>需求方基本信息</b></td>
											</tr>
											<tr>
												<td height="40" width=16% align="right"><b>需求方名称</b></td>
												<td width=17%><s:property
														value="#circulationDemand.demanderName" /></td>
												<td width=16%><b>证件类型</b></td>
												<td width=17%><s:property
														value="#circulationDemand.demanderTypeName" /></td>
												<td width=16%><b>证件号码</b></td>
												<td><s:property
														value="#circulationDemand.demanderIdcode" /></td>
											</tr>
											<tr>
												<td height="40"><b>电话</b></td>
												<td><s:property value="#circulationDemand.demanderTel" /></td>
												<td><b>电子邮件</b></td>
												<td colspan="3"><s:property
														value="#circulationDemand.demanderEmail" /></td>
											</tr>
											<tr>
												<td height="40"><b>地址</b></td>
												<td colspan="5"><s:property
														value="#circulationDemand.demanderAddress" /></td>
											</tr>
											<tr>
												<td colspan="6" height="40"><b>意向地块信息</b></td>
											<tr>
											</tr>
											<tr>
												<td height="40"><b>意向地块位置</b></td>
												<td colspan="5"><s:property
														value="#circulationDemand.landAddress" /></td>
											</tr>
											<tr>
												<td height="40"><b>流转形式</b></td>
												<td><s:property
														value="#circulationDemand.circulationTypeName" /></td>
												<td><b>流转期限</b></td>
												<td><s:property value="#circulationDemand.landDuration" /></td>
												<td><b>土地类型</b></td>
												<td><s:property value="#circulationDemand.landTypeName" /></td>
											</tr>
											<tr>
												<td height="40"><b>意向面积</b></td>
												<td><s:property value="#circulationDemand.landArea" /></td>
												<td><b>意向价格</b></td>
												<td><s:property value="#circulationDemand.landPrice" /></td>
												<td><b>转后用途</b></td>
												<td><s:property value="#circulationDemand.landUseType" /></td>
											</tr>
											<tr>
												<td colspan="6" height="40"><b>联系人信息</b></td>
											<tr>
											<tr>
												<td height="40" width=16% align="right"><b>联系人姓名</b></td>
												<td width=17%><s:property
														value="#circulationDemand.picName" /></td>
												<td width=16%><b>证件类型</b></td>
												<td width=17%>居民身份证</td>
												<td width=16%><b>证件号码</b></td>
												<td><s:property value="#circulationDemand.picIdcode" /></td>
											</tr>
											<tr>
												<td height="40"><b>电话</b></td>
												<td><s:property value="#circulationDemand.picTel" /></td>
												<td><b>电子邮件</b></td>
												<td colspan="3"><s:property
														value="#circulationDemand.picEmail" /></td>
											</tr>
											<tr>
												<td height="40"><b>地址</b></td>
												<td colspan="5"><s:property
														value="#circulationDemand.picAddress" /></td>
											</tr>
											<tr>
												<td colspan="6" height="40"><b>背景扩展信息</b></td>
											<tr>
											<tr>
												<td height="160" valign="top" align="left"><b>需求方简介</b></td>
												<td colspan="5"><s:property value="#circulationDemand.demanderDescript" /></td>
											</tr>
											<tr>
												<td height="200" valign="top" align="left"><b>经营项目简介</b></td>
												<td colspan="5"><s:property value="#circulationDemand.projectDescript" /></td>
											</tr>
											<tr>
												<td colspan="6"><table class="tablenoborder"
														width="100%" border="0" cellpadding="0" cellspacing="0"
														class="tablenoborder">
														<tr>
															<td height="40" align="left">盖章（签字）</td>
															<td colspan="6"></td>
														</tr>
														<tr>
															<td></td>
															<td width="40"><s:date
																	name="#circulationDemand.setupDate" format="yyyy" /></td>
															<td width="20">年</td>
															<td width="40"><s:date
																	name="#circulationDemand.setupDate" format="M" /></td>
															<td width="10">月</td>
															<td width="40"><s:date
																	name="#circulationDemand.setupDate" format="d" /></td>
															<td width="20" height="30">日</td>
														</tr>
													</table></td>
											</tr>

										</table>
									</td>
									<td width="40"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<div class="pageBottom">
				<table class="tablenoborder" cellspacing="0" cellpadding="0">
					<tr>
						<td height="40">第1页（共1页）</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
</body>
</html>