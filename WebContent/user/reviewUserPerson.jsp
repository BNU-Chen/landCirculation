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
</head>
<body>
	<div id="wrap">
		<div id="title">
			<label>用户注册信息审核</label>
		</div>
		<div id="toolbar">
			<table border="0" align="right" cellpadding="0" cellspacing="0"
				id="btnArray" height="100%">
				<tr>
					<td height="40"><label><a
						href="reviewAddAdvice.jsp?userPersonid=${userPerson.id}">
							填写审核意见
					</a></label></td>
					<td height="40"><a href="/welcome.jsp"><label>退&nbsp;&nbsp;出</label></a></td>
				</tr>
			</table>
		</div>
		<div id="client">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>&nbsp;</td>
					<td><span>识别信息</span></td>
				</tr>
				<tr>
					<td><label for="userPerson.Id">系统编号</label></td>
					<td><s:property value="#userPerson.id" /></td>
				</tr>
				<tr>
					<td><label for="user.userIdcode">身份证号码</label></td>
					<td><s:property value="#userPerson.userIdcode" /></td>
				</tr>
				<tr>
					<td><label for="user.userName">用户姓名</label></td>
					<td><s:property value="#userPerson.userName" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><span>联信信息</span></td>
				</tr>
				<tr>
					<td><label for="userPerson.mobilephone">联系手机号码</label></td>
					<td><s:property value="#userPerson.mobilephone" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.email">电子邮件</label></td>
					<td><s:property value="#userPerson.email" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.address">地址</label></td>
					<td><s:property value="#userPerson.address" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.contactAddress">紧急通讯地址</label></td>
					<td><s:property value="#userPerson.contactAddress" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><span>身份证所在行政区域</span></td>
				</tr>
				<tr>
					<td><label for="userPerson.province">省（自治区、直辖市）</label></td>
					<td><s:property value="#userPerson.province" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.city">地级市（自治州、盟）</label></td>
					<td><s:property value="#userPerson.city" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.county">区（县、旗）</label></td>
					<td><s:property value="#userPerson.county" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.town">乡镇（街道）</label></td>
					<td><s:property value="#userPerson.town" /></td>
				</tr>
				<tr>
					<td><label for="userPerson.village">村委会（居委会）</label></td>
					<td><s:property value="#userPerson.village" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><span>身份证明附件</span></td>
				</tr>
				<tr>
					<td><label>一寸免冠照片</label></td>
					<td><img src="${userPerson.photoFilename}" width="98"
						height="138" /></td>
				</tr>
				<tr>
					<td><label>身份证正面</label></td>
					<td><img src="${userPerson.idcard1}" width="300" height="200" /></td>
				</tr>
				<tr>
					<td><label>身份证反面</label></td>
					<td><img src="${userPerson.idcard2}" width="300" height="200" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

</body>
</html>