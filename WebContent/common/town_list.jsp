<%@ page language="java" contentType="text/XML; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
</head>
<body>
	地级市：
	<select id="town">
		<option value="-1">--请选择--</option>
		<s:iterator var="town" value="#lstCodeTown">
			<option value="${town.code}">
				<s:property value="#town.name" />
			</option>
		</s:iterator>
	</select>
</body>
</html>