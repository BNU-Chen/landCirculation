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
body {
	margin: 0px;
}

#wrap {
	margin: 50px auto;
	width: 70%;
	height: 300px;
	background: #39F;
	font-size: 14px;
}

#wrap #title {
	line-height:40px;
	text-align: center;
	background: #F00;
	font: 16px "黑体";
	color: #FFF;
}

#wrap #msgBody {
	background: #0FF;
	padding: 20px;
	font: 14px;
}
</style>
</head>
<body>

	<div id="wrap">
		<div id="title">用户管理操作提示</div>
		<div id="msgBody">
			<s:property value="MsgResponse" />
		</div>
	</div>

</body>
</html>