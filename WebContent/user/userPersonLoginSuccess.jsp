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
<style type="text/css">
#status {
	height: 40px;
	line-height: 40px;
	vertical-align: middle;
	font-size: 15px;
}

#status a #quit {
	float: right;
}

body {
	margin: 0px;
}
</style>
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

<script type="text/JavaScript">
	function initArray() {
		this.length = initArray.arguments.length
		for ( var i = 0; i < this.length; i++)
			this[i] = initArray.arguments[i]
	}

	function timer() {
		var time = new Date();
		//time.toLocaleFormat("YYYY-MM-DD"); 
		YYYY = time.getFullYear();
		MM = time.getMonth();
		DD = time.getDate();
		hh = time.getHours();
		mm = time.getMinutes();
		ss = time.getSeconds();
		var d = new initArray("，星期日", "，星期一", "，星期二", "，星期三", "，星期四", "，星期五",
				"，星期六");

		document.getElementById("currentTime").innerHTML = YYYY + "年" + MM
				+ "月" + DD + "日  " + d[parseInt(time.getDay())] + "  " + hh
				+ "时" + mm + "分" + ss + "秒";
		//document.write("当前时间：" + time); //因为页面内容被覆盖，所以页面显示当前时间后不会更新  
	}
	setInterval("timer()", 1000);
</script>
</head>
<body>
	<div id="status">
		<a href="#"><span id="quit">注销</span></a> <span id="currentUser">
			当前用户 :<s:property value="#CurrentUserPerson.userName" /> 身份证号码：
		</span> <span id="currentTime">当前时间：时间载入中……</span>

	</div>
</body>
</html>