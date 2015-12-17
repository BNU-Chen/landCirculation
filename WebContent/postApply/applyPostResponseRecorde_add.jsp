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
<script src="../common/general.js" type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>公示反馈登记</label>
			</div>
			<div id="client">
				<form id="form1" name="form1" method="post"
					action="ApplypostResponse!saveApplypostResponseRecorde">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr class="hide">
							<td>流转申请公示明细ID</td>
							<td><input type="text" name="postdetailApply.id" value="${postdetailApply.id}"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td width="16%"><label for="text1">反馈人姓名 </label></td>
							<td width="33%"><span id="sprytextfield1"> <input
									name="applypostResponse.responserName" type="text" id="text1"
									size="10" maxlength="10"
									value="${applypostResponse.responserName}" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMinCharsMsg">最少两个字。</span><span
									class="textfieldMaxCharsMsg">最多10个字。</span></span></td>
							<td width="17%"><label for="text2">反馈人身份证号码</label></td>
							<td width="34%"><span id="sprytextfield2"> <input
									name="applypostResponse.responserIdcode" type="text" id="text2"
									size="18" maxlength="18"
									value="${applypostResponse.responserIdcode}" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMinCharsMsg">18位身份证号码。</span><span
									class="textfieldMaxCharsMsg">18位身份证号码。</span></span></td>
						</tr>
						<tr>
							<td><label for="text3">反馈人联系电话</label></td>
							<td><span id="sprytextfield3"> <input
									name="applypostResponse.responserTel" type="text" id="text3"
									size="11" maxlength="11"
									value="${applypostResponse.responserTel}" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span><span
									class="textfieldMinCharsMsg">不符合最小字符数要求。</span><span
									class="textfieldMaxCharsMsg">已超过最大字符数。</span></span></td>
							<td><label for="text4">反馈人电子邮件</label></td>
							<td><span id="sprytextfield4"> <input type="text"
									name="applypostResponse.responserEmail" id="text4"
									value="${applypostResponse.responserEmail}" /> <span
									class="textfieldInvalidFormatMsg">请正确填写邮件地址。</span></span></td>
						</tr>
						<tr>
							<td><label for="textarea1">反馈人联系地址</label></td>
							<td colspan="3"><span id="sprytextarea1"> <textarea
									name="applypostResponse.responserAddress" id="textarea1"
									cols="45" rows="2"><s:property
											value="#applypostResponse.responserAddress" /></textarea> <span
									id="countsprytextarea1">&nbsp;</span><span
									class="textareaRequiredMsg">必填。</span><span
									class="textareaMinCharsMsg">不符合最小字符数要求。</span><span
									class="textareaMaxCharsMsg">已超过最大字符数。</span></span></td>
						</tr>
						<tr>
							<td><label for="textarea2">情况说明</label></td>
							<td colspan="3"><span id="sprytextarea2"> <textarea
									name="applypostResponse.question" id="textarea2" cols="45"
									rows="5"><s:property
											value="#applypostResponse.question" /></textarea> <span
									id="countsprytextarea2">&nbsp;</span><span
									class="textareaRequiredMsg">必填。</span><span
									class="textareaMinCharsMsg">请详细填写。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="3"><input type="submit" name="button"
								id="button" value="提交公示反馈登记" /></td>
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
					minChars : 2,
					maxChars : 10
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "none", {
					validateOn : [ "blur", "change" ],
					minChars : 18,
					maxChars : 18
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "integer", {
					validateOn : [ "blur", "change" ],
					minChars : 11,
					maxChars : 11,
					useCharacterMasking : true
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "email", {
					validateOn : [ "blur", "change" ],
					isRequired : false
				});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					validateOn : [ "blur", "change" ],
					minChars : 5,
					maxChars : 45,
					counterType : "chars_remaining",
					counterId : "countsprytextarea1"
				});
		var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2",
				{
					validateOn : [ "blur", "change" ],
					minChars : 5,
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea2"
				});
	</script>
</body>
</html>