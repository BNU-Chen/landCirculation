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
</script>

<style type="text/css">
#wrap {
	width: 675px;
}

#wrap {
	margin: 0px auto;
	width: 675px;
	background: #EEE;
}

#wrap #title {
	width: 100%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-weight: bold;
	color: #FFF;
	background: #F00;
}

#wrap #navi {
	width: 100% -5px;
	background: #DDD;
	height: 100%;
	margin: 0px 0px 0px 5px;
}

#wrap #client {
	width: 100%;
	height: 100%;
	background: #EEE;
}

#naviItemBig {
	height: 40px;
	min-width: 232px;
	display: inline-block;
	position: relative;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
	font-size: 18px;
	background: #CCC;
	border: 1px solid #FFF;
	margin: 1px -3px;
}

#naviItemBig:hover {
	background: #FC0;
	text-decoration: none;
	border: 1px solid #FFF;
	text-decoration: none;
}
</style>
</head>
<body onload="resizeWin();submitForm();">
	<div id="webClient">
		<table width="100%" height="100%" align="center" cellspacing="0"
			cellpadding="0" border="0">

			<tr>
				<td>
					<div id="wrap">
						<div id="title">
							<label>新用户快速注册</label>
						</div>
						<div id="navi">
							<div id="naviItemBig">
								<a href="userPersonRegister.jsp" target="working">个人用户注册</a>
							</div>
							<div id="naviItemBig">
								<a href="userOrganizationRegister.jsp" target="working">单位用户注册</a>
							</div>
							测试

						</div>
						<div id="client">
							<iframe id="working" height="240" frameborder="0" scrolling="no"
								width="100%"></iframe>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>