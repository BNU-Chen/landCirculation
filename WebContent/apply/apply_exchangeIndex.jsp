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
</head>
<body onload="resizeWin();submitForm();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>流转申请-互换</label>
			</div>
			<div id="navi">
				<div>
					<table class="tablenoborder" border="0" cellpadding="0"
						cellspacing="0" align="left" height="100%">
						<tr>
							<td><label><a
									href="../apply/Apply!newApply_exchange_agreement">新建<b>【协议流转】</b>互换申请
								</a></label></td>
							<td><label><a
									href="../apply/Apply!newApply_exchange_bid">新建<b>【委托交易】</b>互换申请
								</a></label></td>
							<td><label></label></td>
							<td><label><a
									href="../apply/Apply!listtoSubmitApply_exchange"><b>查看【待提交】</b>互换申请
								</a></label></td>
							<td><label><a
									href="../apply/Apply!listSubmitedApply_exchange">查看<b>【已提交】</b>互换申请状态
								</a></label></td>
						</tr>
					</table>
				</div>
			</div>

			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td>流转申请列表</td>
						</tr>
					</table>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="6">序号</th>
						<th width="80">建立日期</th>
						<th width="65">交易类型</th>
						<th width="81">申请人姓名</th>
						<th width="100">申请人身份证号码</th>
						<th width="65">处理进程</th>
						<th width="150">状态</th>
						<th width="150">操作</th>
						<th>最新反馈</th>
					</tr>
					<s:iterator var="Apply" value="#Applys" status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:date name="#Apply.id.applyDate" format="yyyy-MM-dd" /></td>
						<td><s:property value="#Apply.id.transferTypeName" /></td>
						<td><s:property value="#Apply.id.applierUserName" /></td>
						<td><s:property value="#Apply.id.applierIdcode" /></td>
						<td><s:property value="#Apply.id.stepName" /></td>
						<td><s:property value="#Apply.id.statusDesc" /></td>
						<td><s:property value="#Apply.id.id" /> <s:if
								test="#Apply.id.statusCode=='010101'">
								<s:a action="Apply!updateApply">修改
													<s:param name="apply.id" value="#Apply.id.id" />
								</s:a>
								<s:a action="Apply!deleteApply">删除
													<s:param name="apply.id" value="#Apply.id.id" />
								</s:a>
							</s:if></td>
						<td><s:property value="#Apply.id.msgText" /></td>
						</tr>
					</s:iterator>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
