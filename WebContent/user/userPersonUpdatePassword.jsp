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
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<style type="text/css">
#tdwebClient {
	height: 400px;
}

#wrap {
	margin: auto;
	width: 60%;
	height: 320px;
}

#client {
	margin: auto;
	width: 80%;
	text-align: center;
}
</style>
</head>
<link href="../common/SpryAssets/SpryValidationPassword.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationConfirm.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationPassword.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationConfirm.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById("btRegist").click();
	}

	function init() {
		//alert("init脚本启动");
		/*var clientWidth = document.documentElement.offsetWidth
				|| document.body.offsetWidth;*/
		var clientWidth = window.screen.availWidth;//浏览器可用宽度
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientHeight;
		//alert("\nclientWidth:" + clientWidth+"\nclientHeight:" + clientHeight); 

		//alert("设置前tdwebClient height:"+document.getElementById("tdwebClient").clientHeight);
		document.getElementById("tdwebClient").style.height = clientHeight
				+ "px";
		//alert("设置后tdwebClient height:"+document.getElementById("tdwebClient").clientHeight);

	}
</script>
</head>
<body onload="init();">
	<div id="webClient">
		<table class="layouttable" width="100%" cellspacing="0"
			cellpadding="0">
			<tr>
				<td id="tdwebClient">
					<div id="wrap">
						<div id="title">
							<label>用户密码修改--个人用户</label>
						</div>
						<div id="client">
							<form id="user/userRegister" name="userRegister" method="post"
								action="userPerson!updatePassword">
								<table class="contenttable" width="100%" cellspacing="0"
									cellpadding="0">
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td width="40%"><label for="userPerson.password">密码</label></td>
										<td width="60%"><span id="userPerson_password"> <input
												name="userPerson.password" type="password"
												id="userPerson.password" size="8" /> <span
												class="passwordRequiredMsg">必填,8位数字密码。</span><span
												class="passwordMinCharsMsg">8位数字密码，位数不足。</span><span
												class="passwordInvalidStrengthMsg">8位数字密码，位数超8位。</span></span></td>
									</tr>
									<tr>
										<td><label for="newPassword">新密码</label></td>
										<td><span id="spry_newPassword"> <input
												type="password" name="newPassword" id="newPassword" /> <span
												class="passwordRequiredMsg">必填,8位数字密码。</span><span
												class="passwordMinCharsMsg">8位数字密码，位数不足。</span><span
												class="passwordInvalidStrengthMsg">8位数字密码，位数超8位。</span></span></td>
									</tr>
									<tr>
										<td><label for="newPassword">新密码确认</label></td>
										<td><span id="spryconfirm_newPassword"> <input
												type="password" id="newPassword" /> <span
												class="confirmRequiredMsg">必填,8位数字密码。</span><span
												class="confirmInvalidMsg">新密码两次输入不一致。</span></span></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="submit" id="btRegist" value="修改密码" /></td>
									</tr>
									<tr>
										<td></td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		var sprypassword1 = new Spry.Widget.ValidationPassword(
				"userPerson_password", {
					minNumbers : 8,
					maxNumbers : 8,
					validateOn : [ "blur", "change" ]
				});
		var sprypassword2 = new Spry.Widget.ValidationPassword(
				"spry_newPassword", {
					minNumbers : 8,
					maxNumbers : 8,
					validateOn : [ "blur", "change" ]
				});
		var spryconfirm1 = new Spry.Widget.ValidationConfirm(
				"spryconfirm_newPassword", "newPassword", {
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>