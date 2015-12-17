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
<!-- 			<div id="title"> </div> -->
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td><span><b>上传合同电子扫描件</b></span></td>
						</tr>
					</table>
				</div>
				<div>
					<form id="formContractImg"
						action="ContractfillingimgUpload!uploadContractfillingimg"
						enctype="multipart/form-data" method="post" target="frameImglist">
						<table border="0" align="center" width="100%" cellspacing="0"
							cellpadding="0">
							<tr class="hide">
								<td>合同备案ID号</td>
								<td><input type="text" name="contractfilling.id"
									value="${contractfilling.id}"></td>
								<td></td>
							<tr>
							<tr>
								<td width="100"><label for="textarea1"><b>合同编号:</b></label></td>
								<td width="100"><s:property
										value="#contractfilling.contractNo" /></td>
								<td width="60"><label for="contractfillingimgSn"><b>页次
											:</b></label></td>
								<td width="100"><span id="sprytextfield1"> <input
										name="contractfillingimg.contractfillingimgSn" type="text"
										id="contractfillingimgSn" size="2" maxlength="2" /> <span
										class="textfieldRequiredMsg">*</span>
								</span></td>
								<td><input type="file" id="fileField2" name="contractImg"
									size="30" /><input type="submit" value="上传"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "integer", {
					minChars : 1,
					maxChars : 2,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
	</script>
	</ body>
</html>