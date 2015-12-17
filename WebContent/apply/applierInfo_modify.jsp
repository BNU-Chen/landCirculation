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
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationCheckbox.css"
	rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationCheckbox.js"
	type="text/javascript"></script>
</head>
<body onload="btnSubmitAppierInfo.click();">
	<div id="webClient">
		<div id="wrap">
			<div id="contact">
				<form id="form1" name="form1" method="post"
					action="Apply!updateApplierInfo">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr class="hide">
							<td><label>申请系统编号</label></td>
							<td><input type="text" name="apply.id" value="${Apply.id}"
								size="11" readonly="readonly" /></td>
						</tr>
						<tr>
							<td width="150">&nbsp;</td>
							<td><span>申请人（承包人）信息</span></td>
						</tr>

						<tr>
							<td><label>申请人姓名</label></td>
							<td><input type="text" size="20" disabled="disabled"
								value="${userPerson.userName}" /></td>
						</tr>
						<tr>
							<td><label>申请人身份证号码</label></td>
							<td><input disabled="disabled"
								value="${userPerson.userIdcode}" size="18" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><span>联系人信息</span></td>
						</tr>
						<tr>
							<td><label for="text1">联系人姓名</label></td>
							<td><span id="sprytextfield1"> <input
									name="apply.picName" type="text" id="text1"
									value="${Apply.picName}" size="20" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMaxCharsMsg">最多20个字。</span></span></td>
						</tr>
						<tr>
							<td><label for="text2">联系人身份证号码</label></td>
							<td><span id="sprytextfield2"> <input
									name="apply.picIdcode" type="text" id="text2"
									value="${Apply.picIdcode}" /> <span
									class="textfieldRequiredMsg">18位身份证号码。</span><span
									class="textfieldMaxCharsMsg">超过18位。</span><span
									class="textfieldMinCharsMsg">不足18位。</span></span></td>
						</tr>
						<tr>
							<td><label for="text3">联系人联系电话</label></td>
							<td><span id="sprytextfield3"> <input
									name="apply.picTel" type="text" id="text3"
									value="${Apply.picTel}" /> <span class="textfieldRequiredMsg">11位电话号码。</span><span
									class="textfieldMinCharsMsg">不足11位。</span><span
									class="textfieldMaxCharsMsg">超过11位。</span></span></td>
						</tr>
						<tr>
							<td><label for="text4">联系人电子邮件</label></td>
							<td><span id="sprytextfield4"> <input
									name="apply.picEmail" type="text" id="text4"
									value="${Apply.picEmail}" /> <span
									class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
						</tr>
						<tr>
							<td><label for="textarea1">联系人通讯地址</label></td>
							<td><span id="sprytextarea1"> <textarea
									name="apply.picAddress" id="textarea1" rows="2"><s:property
											value="#Apply.picAddress" /></textarea> <span id="countsprytextarea1">&nbsp;</span><span
									class="textareaRequiredMsg">必填。</span></span></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td><span id="sprycheckbox1"> <input type="checkbox"
									id="checkbox1" name="confirm" /> <label for="checkbox1">已仔细阅读、核对以上信息，同意提交修改！</label>
									<span class="checkboxRequiredMsg">请确认。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" id="btnSubmitAppierInfo"
								value="保存联系人信息" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "none", {
					validateOn : [ "blur", "change" ],
					maxChars : 20
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "none", {
					validateOn : [ "blur", "change" ],
					maxChars : 18,
					minChars : 18
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "integer", {
					minChars : 11,
					maxChars : 11,
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					isRequired : false
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "email", {
					validateOn : [ "blur", "change" ],
					isRequired : false
				});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					maxChars : 45,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea1"
				});
		var sprycheckbox1 = new Spry.Widget.ValidationCheckbox("sprycheckbox1",
				{
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>
</html>