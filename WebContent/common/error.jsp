<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="general.css" rel="stylesheet" type="text/css" />
<script src="general.js" type="text/javascript"></script>

<style type="text/css">
#wrap {
	margin: 0px auto;
	width: 50%;
}

#msgBody {
	color: #F88;
	min-height: 300px;
	font-size: 24 px;
}

#navi {
	margin: 10px 10px;
	height: 30px;
}
</style>
</head>
<body onload="resizeWin()">
	<div id="webClient">
		<table width="100%" height="100%" align="center">
			<tr>
				<td>
					<div id="wrap">
						<div id="title">
							<label>用户管理操作提示</label>
						</div>

						<div id="msgBody">
							<table width="90%">
								<tr> 
									<td></td>
								</tr>
								<tr>
									<td><s:property value="MsgResponse" /></td>
								</tr>

								<tr>
									<td></td>
								</tr>
								<tr>
									<td>技术支持：中国科学院遥感与数字地球研究所 010-64849299</td>
								</tr>
							</table>
							<div id="navi">
								<table align="right">
									<tr>
										<td><a href="userPersonRegister.jsp">继续注册</a></td>
										<td><a href="userPerson!login">直接登录</a></td>
									</tr>
								</table>
							</div>
						</div>

					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>