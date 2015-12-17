<%@ page language="java" contentType="text/XML; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<body>
	地级市：
	<select id="province">
		<option value="-1">--请选择--</option>
		<s:iterator var="province" value="#lstCodeProvince">
			<option value="${province.code}">
				<s:property value="#province.name" />
			</option>
		</s:iterator>
	</select>
</body>
</html>
