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
<link href="../commom/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
	<table >
		<tr>
			<td><img src="${userPerson.photoFilename}" width="98px"
				height="138px"><input id="userPerson.photoFilename"
				type="hidden" value="${userPerson.photoFilename}" /></td>
		</tr>
		<tr>
			<td>
				<form action="userPersonUploadPhoto" method="post"
					enctype="multipart/form-data" >
					<input name="photo" type="file" size="20" /> <input type="submit"
						value="上传照片" />
				</form>
			</td>
		</tr>
	</table>
</body>
</html>