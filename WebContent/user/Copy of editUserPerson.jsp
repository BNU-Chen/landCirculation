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
<link href="general.css" rel="stylesheet" type="text/css" />
<link href="general.css" rel="stylesheet" type="text/css" />
<script src="general.js" type="text/javascript"></script>

<script language="javascript">

	function uploadPhoto() {
		document.getElementById("dlgUploadPhoto").style.display = "block";
		showdlg("480", "240", "userPersonUploadPhoto.jsp");
	}
	function photoUploaded() {
		document.getElementById("dlg").style.display = "none";
		document.getElementById("dlgUploadPhoto").style.display = "none";
		var d = window.frames["dlgContent"].document;

		//alert("原地址"+document.getElementById("photo").src);

		document.getElementById("photo").src = d
				.getElementById("userPerson.photoFilename").value;

		document.getElementById("userPerson.photoFilename").value = d
				.getElementById("userPerson.photoFilename").value;
		//alert(document.getElementById("userPerson.photoFilename").value);

		//document.getElementById("userPerson.city").value = "重庆市";
	}
	function uploadIdcard() {
		document.getElementById("dlgUploadIDCard").style.display = "block";
		showdlg("640", "300", "userPersonUploadIDCard.jsp");
	}

	function idcardUploaded() {
		document.getElementById("dlg").style.display = "none";
		document.getElementById("dlgUploadIDCard").style.display = "none";
		var d = window.frames["dlgContent"].document;

		document.getElementById("idcard1").src = d
				.getElementById("userPerson.idcard1").value;
		document.getElementById("userPerson.idcard1").value = d
				.getElementById("userPerson.idcard1").value;

		document.getElementById("idcard2").src = d
				.getElementById("userPerson.idcard2").value;
		document.getElementById("userPerson.idcard2").value = d
				.getElementById("userPerson.idcard2").value;

	}
</script>

<style type="text/css">
#dlgUploadIDCard {
	display: none;
}

#dlgUploadPhoto {
	display: none;
}
</style>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet"
	type="text/css" />
<script src="SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="dlg">
		<div id="dlgClient">
			<iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
		</div>
		<div id="dlgOperation">
			<div id="dlgUploadPhoto">
				<input type="button" value="提   交" onclick="photoUploaded()" />
			</div>
			<div id="dlgUploadIDCard">
				<input type="button" value="提   交" onclick="idcardUploaded()" />
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="title">
			<label>用户信息完善</label>
		</div>
		<div id="client">
			<form action="userPerson!updateUserPerson" method="post"
				enctype="multipart/form-data" name="form1" id="form1">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><span>识别信息</span></td>
					</tr>
					<tr>
						<td><label for="userPerson.Id">系统编号</label></td>
						<td><input type="text" id="userPerson.Id" disabled="disabled"
							value="${userPerson.id}" /><input name="userPerson.Id"
							type="hidden" id="userPerson.Id" value="${userPerson.id}" /></td>
					</tr>
					<tr>
						<td><label for="user.userId">身份证号码</label></td>
						<td><input type="text" id="userPerson.userId" size="18"
							disabled="disabled" value="${userPerson.userId}" /><input
							name="userPerson.userId" type="hidden"
							value="${userPerson.userId}" /></td>
					</tr>
					<tr>
						<td><label for="user.userName">用户姓名</label></td>
						<td><input type="text" id="userPerson.userName" size="20"
							disabled="disabled" value="${userPerson.userName}" /><input
							name="userPerson.userName" type="hidden"
							value="${userPerson.userName}" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><span>联系信息</span></td>
					</tr>
					<tr>
						<td><label for="userPerson.mobilephone">联系手机号码</label></td>
						<td><span id="userPerson_mobilephone"> <input
								name="userPerson.mobilephone" type="text"
								id="userPerson.mobilephone" size="11"
								value="${userPerson.mobilephone}" /> <span
								class="textfieldRequiredMsg">11位手机号码。</span><span
								class="textfieldInvalidFormatMsg">手机号码为数字形式。</span><span
								class="textfieldMinCharsMsg">不足11位。</span><span
								class="textfieldMaxCharsMsg">超过11位。</span></span></td>
					</tr>
					<tr>
						<td><label for="userPerson.email">电子邮件</label></td>
						<td><span id="userPerson_email"> <input type="text"
								name="userPerson.email" id="userPerson.email"
								value="${userPerson.email}" /> <span
								class="textfieldRequiredMsg">电子邮件地址。</span><span
								class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
					</tr>
					<tr>
						<td><label for="userPerson.address">地址</label></td>
						<td><span id="sprytextfield3"> <input type="text"
								name="userPerson.address" id="userPerson.address" size="50"
								value="${userPerson.address}" /> <span
								class="textfieldRequiredMsg">从区（县、旗）以后开始填写。</span><span
								class="textfieldMinCharsMsg">请完整填写地址。</span></span></td>
					</tr>
					<tr>
						<td><label for="userPerson.contactAddress">紧急通讯地址</label></td>
						<td><span id="sprytextarea1"> 
								<textarea
									name="userPerson.contactAddress" id="userPerson.contactAddress"
									cols="40" rows="5"></textarea>
								<span id="countsprytextarea1">&nbsp;</span><span class="textareaMaxCharsMsg">已超过最大字符数。</span><span
								class="textareaMinCharsMsg">请完整填写地址。</span></span></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td><span>身份证所属行政区</span></td>
					</tr>
					<tr>
						<td><label for="userPerson.province">省（自治区、直辖市）</label></td>
						<td><input name="userPerson.province" type="text"
							id="userPerson.province" readonly="readonly" /> <input
							type="button" id="userPerson.province" value="选  择" /></td>
					</tr>
					<tr>
						<td><label for="userPerson.city">地级市（自治州、盟）</label></td>
						<td><input name="userPerson.city" type="text"
							id="userPerson.city" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="userPerson.county">区（县、旗）</label></td>
						<td><input name="userPerson.county" type="text"
							id="userProvince.county" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="userPerson.town">乡镇（街道）</label></td>
						<td><input name="userPerson.town" type="text"
							id="userPerson.town" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="userPerson.village">村委会（居委会）</label></td>
						<td><input name="userPerson.village" type="text"
							id="userPerson.village" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><span>身份证明附件</span></td>
					</tr>
					<tr>
						<td><label>一寸免冠照片</label></td>
						<td><img id="photo" src="${userPerson.photoFilename}"
							width="98" height="138" /> <input type="button" value="上传照片"
							onclick="uploadPhoto()" /><input type="hidden"
							name="userPerson.photoFilename" id="userPerson.photoFilename" value="${userPerson.photoFilename}"/></td>
					</tr>
					<tr>
						<td><label>身份证扫描件</label></td>
						<td><input type="button" name="userPerson.photo"
							id="userPerson.photo" value="上传身份证扫描件" onclick="uploadIdcard()" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><img id="idcard1" src="${userPerson.idcard1}" width="300"
							height="200" /> <input type="hidden" name="userPerson.idcard1"
							id="userPerson.idcard1" value="${userPerson.idcard1}"/><img id="idcard2"
							src="${userPerson.idcard2}" width="300" height="200" /> <input
							type="hidden" name="userPerson.idcard2" id="userPerson.idcard2" / value="${userPerson.idcard2}"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" id="button" value="提交修改" /></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>

		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"userPerson_mobilephone", "integer", {
					minChars : 11,
					maxChars : 11,
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					isRequired : false
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"userPerson_email", "email", {
					isRequired : false,
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});

		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {validateOn:["blur", "change"], maxChars:100, isRequired:false, counterType:"chars_remaining", counterId:"countsprytextarea1"});
	</script>

</body>
</html>

