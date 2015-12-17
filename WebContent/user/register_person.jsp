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
<script src="general.js" type="text/javascript"></script>
<script language="JavaScript">
	function stop() { //这个是禁用鼠标右键 
		return false;
	}
	document.oncontextmenu = stop;
</script>
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationPassword.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationConfirm.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryValidationRadio.css" rel="stylesheet"
	type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationPassword.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationConfirm.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById("btRegist").click();
	}
</script>
<style type="text/css">
#wrap {
	width: 90%;
	margin: 0 auto;
}
</style>
</head>
<body onload="submitForm();">
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<form id="user/userRegister" name="userRegister" method="post"
					action="userPerson!addUser" target="_parent">
					<table border="0" cellpadding="0" cellspacing="0" width="100%"
						align="center">
						<tr class="hide">
							<td>用户性质</td>
							<td><input type="text" name="userPerson.userType" value="01"></td>
						</tr>
						<tr class="hide">
							<td>证件类型</td>
							<td><input type="text" name="userPerson.userIdtype"
								value="01"></td>
						</tr>
						<tr>
							<td><label for="spryradio1">用户类别</label></td>
							<td><div class="navi">
									<div id="spryradio1">
										<table width="100%" class="navitable">
											<tr>
												<td><div id="naviItemMini">
														<label> <input type="radio"
															name="userPerson.userCategory" value="01"
															id="userPerson.userCategory_0" checked="checked" /> 转出方
														</label>
													</div>
													<div id="naviItemMini">
														<label> <input type="radio"
															name="userPerson.userCategory" value="02"
															id="userPerson.userCategory_1" /> 转入方
														</label>
													</div>
													<div id="naviItemMini">
														<label> <input type="radio"
															name="userPerson.userCategory" value="03"
															id="userPerson.userCategory_2" /> 中介机构
														</label>
													</div>
													<div id="naviItemMini">
														<label> <input type="radio"
															name="userPerson.userCategory" value="04"
															id="userPerson.userCategory_3" /> 监管机构
														</label>
													</div>
													<div id="naviItemMini">
														<label> <input type="radio"
															name="userPerson.userCategory" value="05"
															id="userPerson.userCategory_4" /> 用户管理员
														</label>
													</div>
													<div id="naviItemMini">
														<label> <input type="radio"
															name="userPerson.userCategory" value="6"
															id="userPerson.userCategory_5" /> 系统管理员
														</label>
													</div></td>
											</tr>
										</table>
									</div>
								</div></td>
						</tr>
						<!-- 						<tr> -->
						<!-- 							<td width="120"><label for="userPerson.userIdcode">用户类别</label></td> -->
						<%-- 							<td><span id="spryselect1"> <select --%>
						<%-- 									name="userPerson.userCategory" id="select1"> --%>
						<!-- 										<option value="01">转入方</option> -->
						<!-- 										<option value="02">转出方</option> -->
						<!-- 										<option value="03">中介机构</option> -->
						<!-- 										<option value="04">监控机构</option> -->
						<!-- 										<option value="05">用户管理员</option> -->
						<!-- 										<option value="06">系统管理员</option> -->
						<%-- 								</select> <span class="selectRequiredMsg">请选择注册类别。</span></span></td> --%>
						<!-- 						</tr> -->
						<tr>
							<td width="120"><label for="userPerson.userIdcode">身份证号码</label></td>
							<td><span id="userPerson_userId"> <input
									name="userPerson.userIdcode" type="text" id="userPerson.userId"
									size="18" /> <span class="textfieldRequiredMsg">18位身份证号码。</span><span
									class="textfieldMinCharsMsg">18位身份证号码，不足18位。</span><span
									class="textfieldMaxCharsMsg">18位身份证号码，多于18位。</span></span></td>
						</tr>
						<tr>
							<td><label for="userPerson.userName">姓名</label></td>
							<td><span id="userPerson_userName"> <input
									name="userPerson.userName" type="text" id="userPerson.userName"
									size="20" /> <span class="textfieldRequiredMsg">身份证姓名。</span><span
									class="textfieldMinCharsMsg">最小2个字符。</span><span
									class="textfieldMaxCharsMsg">最大20个字符。</span></span></td>
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
							<td><label for="passwordConfirm">密码确认</label></td>
							<td><span id="spryconfirm_user_userPassword"> <input
									type="password" id="passwordConfirm" size="8" /> <span
									class="confirmRequiredMsg">再次输入密码。</span><span
									class="confirmInvalidMsg">两次输入的密码不一致。</span></span></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" id="btRegist" value="注    册" /> <input
								type="reset" name="button" id="reset" value="重     填" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var spryradio1 = new Spry.Widget.ValidationRadio("spryradio1");
		var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {
			validateOn : [ "change", "blur" ]
		});
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"userPerson_userId", "none", {
					minChars : 18,
					maxChars : 18,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"userPerson_userName", "none", {
					minChars : 2,
					maxChars : 20,
					validateOn : [ "blur", "change" ],
				});
		var sprypassword1 = new Spry.Widget.ValidationPassword(
				"userPerson_password", {
					minChars : 8,
					minNumbers : 8,
					maxNumbers : 8,
					validateOn : [ "blur", "change" ]
				});
		var spryconfirm1 = new Spry.Widget.ValidationConfirm(
				"spryconfirm_user_userPassword", "userPerson.password", {
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>
</html>