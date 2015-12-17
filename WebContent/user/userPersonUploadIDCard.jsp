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
<link href="general.css" rel="stylesheet" type="text/css" />
<script src="general.js" type="text/javascript"></script>
</head>
<body>
	<table>
		<tr>
			<td><img width="300px" height="200px"
				src="${userPerson.idcard1}"><input type="hidden"
				name="userPerson.idcard1" id="userPerson.idcard1"
				value="${userPerson.idcard1}" />
				<form action="userPersonUploadIDCard" method="post"
					enctype="multipart/form-data" >
					<input name="IDCard" type="file" size="20" /> <input type="hidden"
						name="page" value="1" /><input type="submit" value="上传身份证扫描件正面" />
				</form></td>
			<td><img width="300px" height="200px"
				src="${userPerson.idcard2}"><input type="hidden"
				name="userPerson.idcard2" id="userPerson.idcard2"
				value="${userPerson.idcard2}" />
				<form action="userPersonUploadIDCard" method="post"
					enctype="multipart/form-data" >
					<input name="IDCard" type="file" size="20" /> <input type="hidden"
						name="page" value="2" /><input type="submit" value="上传身份证扫描件背面" />
				</form></td>

		</tr>
	</table>
</body>
</html>