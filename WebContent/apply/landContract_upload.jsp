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
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<form action="LandcontractImgUpload" enctype="multipart/form-data"
					method="post">
					<table class="rightContract" width="100%" border="0"
						cellspacing="0" cellpadding="0">
						<tr>
							<th colspan="3">承包经营合同扫描件信息</th>
						</tr>
						<tr class="hide">
							<td>申请ID</td>
							<td><input type="text" name="apply.id" value="${Apply.id}"></td>
							<td></td>
						<tr>
							<td width="60"><label for="lancontractimg.pgno">页次</label></td>
							<td width="100"><span id="sprytextfield11"> <input
										name="landcontractimg.pgno" type="text"
										id="landcontractimg.pgno" size="2" maxlength="2" /> <span
										class="textfieldRequiredMsg">*</span></span></td>
							<td><input type="file" id="fileField2"
								name="landcontractImg" /><input type="submit" value="上传" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield11 = new Spry.Widget.ValidationTextField(
				"sprytextfield11", "integer", {
					minChars : 1,
					maxChars : 2,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>
</html>