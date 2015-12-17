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
<script type="text/javascript">
	function submitForm() {
		document.getElementById("btRegist").click();
	}
</script>
<style type="text/css">
body {
	background-image: url(../common/images/sy.jpg);
}

#wrap {
	width: 759px;
	margin: 0px auto;
}

.msgtable td {
	color: #000;
	font-size: 18px;
	line-height: 30px;
}

label {
	line-height: 60px;
	height: 60px;
	text-align: center;
}

#wrap #title {
	width: 100%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	color: #FFF;
	background: #F00;
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
						<div id="client">
							<table class="msgtable" width="100%" align="center"
								cellspacing="0" cellpadding="0" border="0">
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td height="40" class="aligncenter"><b>出错啦</b></td>
									<td width="10%"></td>
								</tr>
								<tr>
									<td></td>
									<td><s:property value="MsgResponse" escape="false" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td>技术支持：中国科学院遥感与数字地球研究所 010-64849299</td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3"><table class="navitable">
											<tr>
												<td class="alignright">
													<div id="navi">
														<div id="naviItemMini">
															<a href="register.jsp"><label><b>继续注册</b></label></a>
														</div>
														<div id="naviItemMini">
															<a href="../default.html"><label><b>返回</b></label></a>
														</div>
													</div>
												</td>
											</tr>
										</table></td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>