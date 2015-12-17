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
<link href="general_user.css" rel="stylesheet" type="text/css" />
<script src="general.js" type="text/javascript"></script>
<style type="text/css">
#wrap {
	width: 90%;
}

#navi {
	height: 60px;
}

#MsgLoginError {
	margin: auto 20px;
	font: 16px;
	color: #F00;
}
</style>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet"
	type="text/css" />
<script src="SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="SpryAssets/SpryValidationPassword.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById("btLogin").click();
	}
</script>
</head>
<body onload="resizeWin();submitForm();">
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<div>
					<form id="user/userRegister" name="userRegister" method="post"
						action="userPerson!login" target="_parent">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="120"><label for="userPerson.userIdcode">身份证号码</label></td>
								<td><span id="userPerson_userIdcode"> <input
										name="userPerson.userIdcode" type="text"
										id="userPerson.userIdcode" size="18" /> <span
										class="textfieldRequiredMsg">18位身份证号码。</span><span
										class="textfieldMinCharsMsg">18位身份证号码，不足18位。</span><span
										class="textfieldMaxCharsMsg">18位身份证号码，多于18位。</span>
								</span></td>
							</tr>
							<tr>
								<td><label for="userPerson.password">密码</label></td>
								<td><span id="userPerson_password"> <input
										name="userPerson.password" type="password"
										id="userPerson.password" size="8" /> <span
										class="passwordRequiredMsg">8位数字密码。</span><span
										class="passwordMinCharsMsg">8位数字密码，位数不足。</span><span
										class="passwordInvalidStrengthMsg">8位数字密码，位数超8位。</span></span></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" id="btLogin" value="登    录" /> <input
									type="reset" name="button" id="reset" value="重     填" /></td>
							</tr>
							<tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"userPerson_userIdcode", "none", {
					minChars : 18,
					maxChars : 18,
					validateOn : [ "blur", "change" ]
				});
		var sprypassword1 = new Spry.Widget.ValidationPassword(
				"userPerson_password", {
					minChars : 8,
					minNumbers : 8,
					maxNumbers : 8,
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>
</html>