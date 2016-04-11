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

	function showTabpane(cursel) {
		/* 		var panels = document.getElementById("client").getElementsByClassName(
		 "panel"); */
		var panels = document.getElementsByClassName("panel");
		var tabs = document.getElementById("toc").getElementsByTagName("label");
		// 		alert(cursel + "\n" + tabs.length);
		for (var i = 0; i < tabs.length; i++) {
			panels[i].style.display = "block";
			if (i == cursel) {
				tabs.item(i).className = "selected";
				/* panels.item(i).style.display = "block"; */
				panels[i].style.display = "block";
				var str = "btnSubmit" + String(i + 1);
				//alert(str);
				//document.getElementById(str).click();
			} else {
				tabs.item(i).className = "";
				/* 				panels.item(i).style.display = "none"; */
				panels[i].style.display = "none";
			}

		}
	}
</script>
<style type="text/css">
body {
	background-image: url(../common/images/sy.jpg);
	background-repeat:repeat;
	background-position:center center;
}

#wrap {
margin-top:250px;
	width: 675px;
}

#title {
	background: #33F;
}

#MsgLoginError {
	height: 60px;
	line-height: 60px;
	font-size: 18px;
	/* 	font-weight: bold; */
	background: #DDD;
	color: #F00;
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
						<div id="title">用户登录</div>
						<div id="toc">
							<table border="0" align="left" cellpadding="0" cellspacing="0">
								<tr>
									<td><label class="selected" id="default"
										onclick="showTabpane(0)">个人用户登录</label></td>
									<td><label onclick="showTabpane(1)">机构用户登录</label></td>
								</tr>
							</table>
						</div>
						<div id="client">
							<div id="login_person" class="panel">
								<iframe src="login_person.jsp" class="iframepanel"
									frameborder="0" width="100%" height="160" scrolling="no"></iframe>
							</div>
							<div id="login_organization" class="panel hide">
								<iframe src="login_organization.jsp" class="iframepanel"
									frameborder="0" width="100%" height="160" scrolling="no"></iframe>
							</div>
						</div>
						<div id=navi>
							<table class="navitable">
								<tr>
									<td class="alignright"><div id="naviItemMini">
											<a href="#"><label>忘记密码</label> </a>
										</div>
										<div id="naviItemMini">
											<a href="register.jsp" target="_parent"> <label>新用户注册
											</label></a>
										</div>
										<div id="naviItemMini">
											<a href="../default.html"><label>返回</label></a>
										</div></td>
								</tr>
							</table>
						</div>
						<div id="MsgLoginError">
							<s:property value="MsgLoginError" />
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>