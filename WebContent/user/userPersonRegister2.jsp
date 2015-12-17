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
#content {
	margin: auto;
	width: 90% background-color:   #FC3;
}

#content #login #navi {
	float: right;
}

.tip {
	font-size: 13px;
	color: #F00;
}

body {
	font-size: 15px;
	color: #666;
	font-family: "黑体";
	padding: 10px;
}

.tip {
	color: #999;
}

.red {
	color: #F00;
}

.fieldlable {
	float: right;
	vertical-align: middle;
}

#content #title {
	background-color: #F00;
	padding: 5px;
}
}
</style>
</head>
<body>
	<div id="content">
		<div id="title">用户登录</div>
		<div id="login">
			<form action="user/userPerson!addUser" method="post">
				<table>
					<tr>
						<td class="fieldlable"><label for="userId">身份证号码</label></td>
						<td><input type="text" name="userPerson.userId" size="18"
							value="" id="userId" /> <span class="red">*</span> <label
							class="tip" for="userId">18位身份证号码</label></td>
					</tr>
					<tr>
						<td><label for="userName" class="fieldlable">姓名</label></td>
						<td><input type="text" name="userPerson.userName" size="20"
							value="" id="userName" /> <label class="tip" for="userName">不超过20个字</label></td>
					<tr>
						<td><label for="password" class="fieldlable">密码</label></td>
						<td><input type="password" name="userPerson.password"
							size="12" id="password" /> <label class="tip" for="password"><span
								class="red">*</span>8位数字密码</label></td>
					</tr>
					<tr>
						<td><label for="password2">再次输入密码</label></td>
						<td><input type="password" size="12" id="password2" /> <label
							class="tip" for="password"><span class="red">*</span>8位数字密码</label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" id="input" value="登   录" /> <input
							type="reset" name="button" id="button" value="重   填" /></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</body>
</html>