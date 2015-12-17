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
<title>新用户快速注册</title>
<sx:head />
<link href="../user/general_user.css" rel="stylesheet" type="text/css" />
<script src="general.js" type="text/javascript"></script>
<script language="JavaScript">
	function stop() { //这个是禁用鼠标右键 
		return false;
	}
	document.oncontextmenu = stop;
</script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationConfirm.css" rel="stylesheet"
	type="text/css" />
<script src="SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="SpryAssets/SpryValidationPassword.js"
	type="text/javascript"></script>
<script src="SpryAssets/SpryValidationConfirm.js" type="text/javascript"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById("btRegist").click();
	}
</script>
<style type="text/css">
#wrap {
	width: 758px;
}

body {
	/* 	background-color: #F00; */
	background-image: url(../common/images/sy.jpg);
}

label {
	line-height: 40px;
	height: 40px;
	text-align: center;
}
</style>
</head>
<body onload="resizeWin();submitForm();">
	<div id="webClient">
		<table class="tablenoborder" width="100%" height="100%" align="center"
			cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td>
					<div id="wrap">
						<div id="title">新用户快速注册</div>
						<div id="navi">
							<table class="navitable">
								<tr>
									<td class="alignright">
										<div id="naviItemBig">
											<a href="register_person.jsp" target="working"><label><b>个人用户注册</b></label></a>
										</div>
										<div id="naviItemBig">
											<a href="register_organization.jsp" target="working"><label><b>单位用户注册</b></label></a>
										</div>
										<div id="naviItemMini">
											<a href="../default.html"><label><b>返回</b></label></a>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div id="client">
							<iframe id="working" height="320" frameborder="0" scrolling="no"
								width="100%" src="../user/registerWelcome.html"></iframe>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>