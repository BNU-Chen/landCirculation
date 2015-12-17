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
	margin: 0;
}

#wrap {
	margin: 0px 0;
	width: 100%;
	font-size: 14px;
	background: #EEE;
}

#wrap #title {
	height: 40px;
	background: #F00;
}

#wrap #title label {
	height: 40px;
	color: #FFF;
	background: #666;
	width: 100%;
	line-height: 40px;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

#wrap #operation #navi tr td label {
	text-align: center;
	height: 30px;
	width: 80px;
	border: 1px double #F00;
	background: #CCC;
	font-size: 18px;
	line-height: 30px;
	font-weight: bold;
}

#wrap #operation #navi tr td label:hover {
	background: #FC0;
}

#wrap #content {
	min-height: 200px;
}

#wrap #operation {
	background: #AAA;
	margin: 5px 0px;
	height: 40px;
}

label {
	font-size: 14px;
	width: 200px;
	height: 30px;
	line-height: 30px;
	text-align: right;
	display: block;
	font-size: 14px;
	margin-right: 5px;
}

a:link {
	color: #06F;
	text-decoration: none;
}

a:visited {
	color: #F00;
	text-decoration: none;
}

a:hover {
	color: #F00;
	text-decoration: underline;
}

a:active {
	color: #F00;
}

span {
	color: #F00;
	height: 30px;
	font-size: 16px;
	line-height: 30px;
	text-align: left;
	vertical-align: middle;
}

table {
	margin: 0px auto;
	border-top: 1px dotted #3CF;
	border-right: 1px dotted #3CF;
}

table tr td {
	height: 30px;
	border-bottom: 1px dotted #3CF;
	border-left: 1px dotted #3CF;
	font-size: 14px;
	line-height: 30px;
	vertical-align: middle;
	text-indent: 5px;
}
</style>
</head>
<body>
	尊敬的
	<s:property value="#CurrentUserPerson.userName" />
	用户(身份证号码：
	<s:property value="#CurrentUserPerson.userId" />
	),恭喜您，密码修改成功！
</body>
</html>