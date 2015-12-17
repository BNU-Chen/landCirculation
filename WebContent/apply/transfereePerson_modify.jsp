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
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<form id="form3" name="form3" method="post"
					action="TransfereePerson!saveTransferee">
					<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
						width="100%">
						<tr class="hide">
							<td></td>
							<td><input id="ApplyID" name="apply.id" type="text"
								value="${Apply.id}" /></td>
						</tr>
						<tr>
							<td width="150"></td>
							<td><span>受让方信息</span></td>
						</tr>
						<tr>
							<td><label>受让方姓名</label></td>
							<td><span id="sprytextfield1"> <input type="text"
									name="transfereePerson.transfereeName" id="text1"
									value="${transfereePerson.transfereeName}" /> <span
									class="textfieldRequiredMsg">受让方姓名，不少于两个字。</span><span
									class="textfieldMinCharsMsg">不少于两个字。</span></span></td>
						</tr>
						<tr>
							<td><label>受让方身份证号码</label></td>
							<td><span id="sprytextfield2"> <input type="text"
									name="transfereePerson.transfereeIdcode"
									id="text2"
									value="${transfereePerson.transfereeIdcode}" /> <span
									class="textfieldRequiredMsg">18位身份证号码。</span><span
									class="textfieldMinCharsMsg">不足18位。</span><span
									class="textfieldMaxCharsMsg">超过18位。</span></span></td>
						</tr>
						<tr>
							<td><label>受让方住所</label></td>
							<td><span id="sprytextarea1"> <textarea
									name="transfereePerson.transfereeAddress"
									id="adress" cols="45" rows="3"><s:property
											value="#transfereePerson.transfereeAddress" /></textarea>
									<span id="countsprytextarea1">&nbsp;</span></span></td>
						</tr>
						<tr>
							<td><label>受让方联系电话</label></td>
							<td><span id="sprytextfield3"> <input type="text"
									name="transfereePerson.transfereeTel" id="text3"
									value="${transfereePerson.transfereeTel}" /> <span
									class="textfieldRequiredMsg">11位电话号码。</span><span
									class="textfieldMinCharsMsg">电话话码不足11位。</span><span
									class="textfieldMaxCharsMsg">电话号码超过11位。</span></span></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="保存承租方信息"></td>
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
					minChars : 2
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "none", {
					minChars : 18,
					maxChars : 18,
					validateOn : [ "blur", "change" ]
				});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea1",
					maxChars : 45,
					minChars : 5
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "integer", {
					minChars : 11,
					maxChars : 11,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>
</html>