<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
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
<link href="../general.css" rel="stylesheet" type="text/css" />
<script src="../general.js" type="text/javascript"></script>
<script>
	function func() {
		var iFlag = false;
		var oImg = new Image();
		oImg.onload = function() {
			oImg.src = myform1.file1.value;
			if (!iFlag) {
				alert("test");
				iFlag = true;
				alert("width:" + oImg.width + "\nheight:" + oImg.height
						+ "\nfilesize:" + (oImg.fileSize / 1024).toFixed(1)
						+ "k");

			}
		};
	}
</script>
</head>
<body>
	<form method="post" name="myform1" enctype="multipart/form-data">
		<table width="50%" height="22" border="1">
			<!--存在两个不同表单所以需要不同的名字-->
			<tr>
				<td><input type="file" name="file1" size="20" onchange="func()" />
				</td>
			</tr>

		</table>
	</form>
</body>
</html>
