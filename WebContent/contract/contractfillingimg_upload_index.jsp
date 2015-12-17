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
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<s:url action="ContractfillingimgUpload!addContractfillingimg"
					var="urlAddContractimg">
					<s:param name="contractfilling.id" value="#contractfilling.id" />
				</s:url>
				<s:url action="ContractfillingimgUpload!listContractfillingimg"
					var="urlListContractimg">
					<s:param name="contractfilling.id" value="#contractfilling.id" />
				</s:url>
				<iframe id="frameImgadd" height="62" width="100%"
					src="${urlAddContractimg}" frameborder="0" scrolling="auto"></iframe>
				<iframe id="frameImglist" height="298" width="100%"
					src="${urlListContractimg}" frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
	</div>

</body>
</html>