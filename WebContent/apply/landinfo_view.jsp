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
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationRadio.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<script src="../common/regioncode.js" type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<s:url action="Apply!viewLandAddress" var="urlViewLandAddress">
				<s:param name="apply.id" value="#Apply.id" />
			</s:url>
			<sx:div id="divLandAddress" href="%{urlViewLandAddress}">
			</sx:div>
			<div id="div1">
				<s:url action="Parcel!newParcel" var="urlNewParcel">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>
				<sx:a href="%{urlNewParcel}" targets="div1" executeScripts="true">
					<label class="btnLabel">添加地块信息</label>
				</sx:a>
				<s:url action="Parcel!listParcel" var="urlListParcels">
					<s:param name="apply.id" value="#Apply.id" />
				</s:url>
				<sx:div id="ParcelInfo" href="%{urlListParcels}">
				</sx:div>
			</div>
		</div>
	</div>
</body>
</html>
