<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>Insert title here</title>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<style media="print">
.NOPRINT {
	display: none;
	font-family: "宋体";
	font-size: 9pt;
}

.PageNext {
	page-break-after: always;
}
</style>
<script type="text/JavaScript">
	//禁止刷新，回退 
	/* 	function onKeyDown() {
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
	 document.oncontextmenu = stop; */
</script>
<script type="text/JavaScript">
	function initArray() {
		this.length = initArray.arguments.length;
		for (var i = 0; i < this.length; i++)
			this[i] = initArray.arguments[i];
	}
	function timer() {
		var time = new Date();
		//time.toLocaleFormat("YYYY-MM-DD"); 
		YYYY = time.getFullYear();
		MM = time.getMonth() + 1;
		DD = time.getDate();
		hh = time.getHours();
		mm = time.getMinutes();
		ss = time.getSeconds();
		var d = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");

		document.getElementById("currentTime").innerHTML = "今天是" + YYYY + "年"
				+ MM + "月" + DD + "日   " + d[parseInt(time.getDay())]
				+ "    当前时间：" + hh + "时" + mm + "分" + ss + "秒";
		//document.write("当前时间：" + time); //因为页面内容被覆盖，所以页面显示当前时间后不会更新  
	}
	setInterval("timer()", 1000);
</script>
<script type="text/javascript">
	function init() {
		/* alert("init脚本启动"); */
		var clientWidth = document.documentElement.clientWidth
				|| document.body.clientwidth;
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientheight;
		// alert("clientHeight:" + clientHeight); 
		document.getElementById("contentwrap").style.height = clientHeight
				- 130 + "px";
		/* 		alert("contentwrap height:"+document.getElementById("contentwrap").style.height);
		 */var iframepanels = document.getElementsByName("naviTarget");
		//alert("clientWidth:"+clientWidth+"iframepanels:"+iframepanels.length);
		// 		alert("iframepanels.length:" + iframepanels.length);
		for (var i = 0; i < iframepanels.length; i++) {
			iframepanels[i].style.height = clientHeight - 130 + "px";
		}
		var iframepanels = document.getElementsByName("contentTarget");
		//alert("clientWidth:"+clientWidth+"iframepanels:"+iframepanels.length);
		for (var i = 0; i < iframepanels.length; i++) {
			iframepanels[i].style.height = clientHeight - 130 + "px";
			iframepanels[i].style.width = clientWidth - 200 + "px";
		}
	}
</script>
<style type="text/css">
body {
	margin: 0px;
}

#desktop #header {
	height: 60px;
	color: #fff;
	background-color: #0C6;
	font-size: 36px;
	line-height: 60px;
	vertical-align: middle;
	font-family: "黑体";
}

#desktop #topmenu {
	background-color: #CFC;
	height: 40px;
}

#status {
	height: 40px;
	line-height: 40px;
	vertical-align: middle;
	font-size: 15px;
}

#status #currentUser {
	display: inline-block;
}

#status #currentTime {
	display: inline-block;
}

#desktop #contentwrap #leftnavi {
	background: #EEE;
	width: 200px;
	float: left;
	margin: 0px;
}

#desktop #contentwrap #content {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 200px;
}

#desktop #footer {
	height: 30px;
	background-color: #F60;
	text-align: center;
	vertical-align: middle;
	line-height: 30px;
}

.navitable tr:hover {
	background:  #CFC;
}
</style>
</head>
<body onload="init();">
	<div id="desktop">
		<div id="header" class="NOPRINT">
			<img src="../common/images/dl.png" width="582" height="60" />
		</div>
		<div id="topmenu">
			<div id="status" class="NOPRINT">
				<table width="99.5%" border="0" class="navitable" cellspacing="0"
					cellpadding="0">
					<tr>
						<td class="navitd">
							<div id="currentUser">
								当前用户：
								<s:property value="#CurrentUserPerson.userName" />
								<s:if test="#CurrentUserPerson.userType=='01'">身份证号码：</s:if>
								<s:else> 组织机构代码：</s:else>
								<s:property value="#CurrentUserPerson.userIdcode" />
							</div>
							<div id="currentTime">当前时间：时间载入中……</div>
						</td>
						<td class="navitd alignright"><div id="naviItemMini">
								<a href="../default.html">注销</a>
							</div></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="contentwrap">
			<div id="leftnavi" class="NOPRINT">
				<iframe id="naviTarget" name="naviTarget" height="460"
					src="mainMenu.jsp" frameborder="0" width="200" scrolling="no"></iframe>
			</div>
			<div id="content">
				<iframe id="contentTarget" name="contentTarget" height="460"
					src="http://www.cqgtfw.gov.cn" frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
		<div id="footer" class="NOPRINT">国家科技技术部 科技支撑计划项目成果
			中国科学院遥感与数字地球研究所 版权所有</div>
	</div>
</body>
</html>
