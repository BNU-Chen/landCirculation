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
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<table class="rightContract" width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td >说明：<s:property
								value="#landcontractimg.description" />\n路径：<s:property value="landcontractimg.landcontractimgPathFilename"/></td>
					</tr>
					<tr>
						<td ><img src="${landcontractimg.landcontractimgPathFilename}"
							></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>