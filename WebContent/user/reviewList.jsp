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
<title>Insert title here</title>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<style type="text/css">
</style>
</head>
<!-- <body onload="resizeWin();"> -->
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>注册用户信息审核</label>
			</div>
			<div id="client">
				<div id="tabletitle">
					<label>待审核用户列表</label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="40">序号</th>
						<th width="60">系统编号</th>
						<th width="200">用户名称</th>
						<th width="100">用户类别</th>
						<th width="100">用户性质</th>
						<th width="120">证件类型</th>
						<th width="160">证件号码</th>
						<th width="100">电话号码</th>
						<th>操作</th>
					</tr>
					<s:iterator var="user" value="#reviewList" status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td class="aligncenter"><s:property value="#st.count" /></td>
						<td class="aligncenter"><s:property value="#user.id" /></td>
						<td><s:property value="#user.userName" /></td>
						<td class="aligncenter"><s:property
								value="#user.userCategoryName" /></td>
						<td class="aligncenter"><s:property
								value="#user.userTypeName" /></td>
						<td class="aligncenter"><s:property
								value="#user.userIdtypeName" /></td>
						<td><s:property value="#user.userIdcode" /></td>
						<td class="aligncenter"><s:property value="#user.mobilephone" /></td>
						<td class="aligncenter"><s:a
								action="userPerson!reviewUserPerson">
								<s:param name="userPerson.id" value="#user.id" />审核
					</s:a></td>
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