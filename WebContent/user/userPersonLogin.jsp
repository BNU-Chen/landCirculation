<%@page language="java" contentType="text/html; charset=UTF-8"
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
<script language="JavaScript">
	//禁止刷新，回退 
	function onKeyDown() {
		if ((event.altKey)
				|| ((event.keyCode == 8) && (event.srcElement.type != "text"
						&& event.srcElement.type != "textarea" && event.srcElement.type != "password"))
				|| ((event.ctrlKey) && ((event.keyCode == 78) || (event.keyCode == 82)))
				|| (event.keyCode == 116)) {
			event.keyCode = 0;
			event.returnValue = false;
		}
	}
	document.onkeydown = onKeyDown;

	function stop() { //这个是禁用鼠标右键 
		return false;
	}
	document.oncontextmenu = stop;
</script>
<style type="text/css">
#UserPersonLoginbody form table {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
}

#UserPersonLogin form table tr td lable {
	font-family: "黑体";
	font-size: 14px;
	background-color: #FFF;
	display: block;
	height: 20px;
	line-height: 20px;
	float: none;
	width: auto;
	margin-right: auto;
	margin-left: auto;
}

#UserPersonLogin {
	width: 300px;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<div id="UserPersonLogin">
		<form action="user/userPerson!login" method="post" >
			<table>
				<tr>
					<td><label for="userID">身份证号码</label></td>
					<td><s:textfield id="userIdcode" name="userPerson.userIdcode"
							size="18" theme="simple" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label for="password">密码</label></td>
					<td><s:password id="password" name="userPerson.password"
							size="12" theme="simple" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><s:submit value="登  录" /> <a href="user/userPerson!test">测试</a></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>