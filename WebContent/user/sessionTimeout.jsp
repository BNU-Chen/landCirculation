<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<style type="text/css">
#wrap {
	margin: 0px auto;
	width: 60%;
}

#msgBody {
	color: #CCC;
	min-height: 300px;
	font-size: 32 px;
}

#navi {
	margin: 10px 10px;
	height: 30px;
}

table {
	margin: 0px 0px;
	border-top: 0px dotted #3CF;
	border-left: 0px dotted #3CF;
}

table tr td {
	height: 30px;
	border-bottom: 0px dotted #3CF;
	border-right: 0px dotted #3CF;
	font-size: 14px;
	line-height: 30px;
	vertical-align: middle;
	text-indent: 5px;
	text-align: left;
}

table tr th {
	height: 30px;
	border-bottom: 0px dotted #3CF;
	border-right: 0px dotted #3CF;
	font-size: 14px;
	line-height: 30px;
	vertical-align: middle;
	text-indent: 5px;
	text-align: center;
}

table tr:hover {
	background: 000;
}
</style>
<script language="javascript">
	function init() {
		//alert("init脚本启动"); 
		/*var clientWidth = document.documentElement.offsetWidth
				|| document.body.offsetWidth;*/
		var clientWidth = window.screen.availWidth;//浏览器可用宽度
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientHeight;
		//alert("\nclientWidth:" + clientWidth+"\nclientHeight:" + clientHeight); 
		//alert("设置前desktop height:"+document.getElementById("desktop").clientHeight);
		document.getElementById("desktop").style.height = clientHeight + "px";//全屏高度
		//alert("设置后desktop height:"+document.getElementById("desktop").clientHeight);
		//alert("设置前bkgnd height:"+document.getElementById("bkgnd").clientHeight);
		document.getElementById("bkgnd").style.height = clientHeight * .7
				+ "px";
		//alert("设置后bkgnd height:"+document.getElementById("bkgnd").clientHeight);

	}
</script>
</head>
<body onload="init();" onresize="init();">
	<div id="webClient">
		<table class="black" id="desktop" width="100%" border="1"
			cellspacing="0" cellpadding="0" bgcolor="#000">
			<tr>
				<td width="100%"><table id="bkgnd" width="100%" height="100%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<div id="wrap">
									<div id="title">
										<label>操作提示</label>
									</div>
									<div id="client" align="center">
										<table width="90%" align="center">
											<tr height="30">
												<td></td>
											</tr>
											<tr>
												<td>尊敬的用户：</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;您已经很长一段时间没有操作了，为了保护您的信息安全，系统已自动注消。如需继续操作，请<a
													href="../default.html" target="_parent">重新登录</a>！
												</td>
											</tr>
											<tr>
												<td><div align="right">技术支持：中国科学院遥感与数字地球研究所
														010-64849299</div></td>
											</tr>
											<tr>
												<td></td>
											</tr>
										</table>
									</div>
								</div>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>
</body>
</html>