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
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
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

</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<div id="rightCheck">
					<div id="rightCheckType">
						<form id="form2" name="form2" method="post"
							action="Apply!saveLandRightCheckType">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								id="landRightCheck">
								<tr>
									<td>流转申请ID</td>
									<td><input type="text" name="apply.id" value="${Apply.id}"></td>
								</tr>
								<tr>
									<td width="150"><label>权属证明类型</label></td>
									<td><input name="apply.rightAuthType" type="radio"
										id="RadioGroup1_0" value="1"
										<s:if test="#Apply.rightAuthType==1||#Apply.rightAuthType==null"> checked="checked"</s:if>
										onclick="landRightCheckType(0)" /> 承包经营权证 <input type="radio"
										name="apply.rightAuthType" value="2" id="RadioGroup1_1"
										<s:if test="#Apply.rightAuthType==2"> checked="checked"</s:if>
										onclick="landRightCheckType(1)" /> 承包经营合同</td>
								</tr>
								<s:if test="#Apply.rightAuthType==1||#Apply.rightAuthType==null">
									<tr class="right">
										<td><label>承包经营权证书编号</label></td>
										<td><span id="sprytextfield1"> <input
												name="apply.landWarrantCode" class="0" type="text"
												id="rightWarrant" size="20" maxlength="20"
												value="${Apply.landWarrantCode}" /> <span
												class="textfieldRequiredMsg">必填，20位（年份4位+县级代码6位+乡镇代码2位+村代码2位+组社代码2位+顺序码4位）。</span><span
												class="textfieldMinCharsMsg">不足20位。</span><span
												class="textfieldMaxCharsMsg">超过20位。</span></span></td>
									</tr>
									<tr class="right hide">
										<td><label>承包经营权合同编号</label></td>
										<td><span id="sprytextfield2"> <input
												name="apply.landContractCode" class="1" type="text"
												id="rightContract" size="20" maxlength="20"
												disabled="disabled" value="${Apply.landContractCode}" /> <span
												class="textfieldRequiredMsg">必填，20位（年份4位+县级代码6位+乡镇代码2位+村代码2位+组社代码2位+顺序码4位）。</span><span
												class="textfieldMinCharsMsg">不足20位。</span><span
												class="textfieldMaxCharsMsg">超过20位。</span></span></td>
									</tr>
								</s:if>
								<s:else>
									<tr class="right hide">
										<td><label>承包经营权证书编号</label></td>
										<td><span id="sprytextfield1"> <input
												name="apply.landWarrantCode" class="0" type="text"
												id="rightWarrant" size="20" maxlength="20"
												disabled="disabled" value="${Apply.landWarrantCode}" /> <span
												class="textfieldRequiredMsg">必填，20位（年份4位+县级代码6位+乡镇代码2位+村代码2位+组社代码2位+顺序码4位）。</span><span
												class="textfieldMinCharsMsg">不足20位。</span><span
												class="textfieldMaxCharsMsg">超过20位。</span></span></td>
									</tr>
									<tr class="right">
										<td><label>承包经营权合同编号</label></td>
										<td><span id="sprytextfield2"> <input
												name="apply.landContractCode" class="1" type="text"
												id="rightContract" size="20" maxlength="20"
												value="${Apply.landContractCode}" /> <span
												class="textfieldRequiredMsg">必填，20位（年份4位+县级代码6位+乡镇代码2位+村代码2位+组社代码2位+顺序码4位）。</span><span
												class="textfieldMinCharsMsg">不足20位。</span><span
												class="textfieldMaxCharsMsg">超过20位。</span></span></td>
									</tr>
								</s:else>
								<tr>
									<td></td>
									<td><input type="submit" id="btnSubmit3" value="保存" />请先保存权属证明类型后再上传相应扫描件！</td>
								</tr>
							</table>
						</form>

						<s:if test="#Apply.rightAuthType==1||#Apply.rightAuthType==null">
							<div id="div0">
								<s:if test="#Apply.landWarrantCode!=null">
									<s:url action="Apply!viewLandWarrant" var="urlViewLandWarrant">
										<s:param name="apply.id" value="#Apply.id" />
									</s:url>
									<sx:div href="%{urlViewLandWarrant}" executeScripts="true" />
								</s:if>
							</div>
						</s:if>
						<s:else>
							<div id="div0" class="hide">
								<s:if test="#Apply.landWarrantCode!=null">
									<s:url action="Apply!viewLandWarrant" var="urlViewLandWarrant">
										<s:param name="apply.id" value="#Apply.id" />
									</s:url>
									<sx:div href="%{urlViewLandWarrant}" executeScripts="true" />
								</s:if>
							</div>
						</s:else>

						<s:if test="#Apply.rightAuthType==2">
							<div id="div1">
								<s:if test="#Apply.landContractCode!=null">
									<s:url action="Apply!uploadLandContract"
										var="urlUploadLandContract">
										<s:param name="apply.id" value="#Apply.id"></s:param>
									</s:url>
									<sx:a href="%{urlUploadLandContract}" targets="div1"
										executeScripts="true">
										<label class="btnLabel">上传承包合同扫描件</label>
									</sx:a>
									<s:url action="Apply!viewLandContract"
										var="urlViewLandContract">
										<s:param name="apply.id" value="#Apply.id" />
									</s:url>
									<sx:div id="landConractImglist" href="%{urlViewLandContract}"
										executeScripts="true" />
								</s:if>
							</div>
						</s:if>
						<s:else>
							<div id="div1" class="hide">
								<s:if test="#Apply.landContractCode!=null">
									<s:url action="Apply!uploadLandContract"
										var="urlUploadLandContract">
										<s:param name="apply.id" value="#Apply.id"></s:param>
									</s:url>
									<sx:a href="%{urlUploadLandContract}" targets="div1"
										executeScripts="true">
										<label class="btnLabel">上传承包合同扫描件</label>
									</sx:a>
									<s:url action="Apply!viewLandContract"
										var="urlViewLandContract">
										<s:param name="apply.id" value="#Apply.id" />
									</s:url>
									<sx:div id="landConractImglist" href="%{urlViewLandContract}"
										executeScripts="true" />
								</s:if>
							</div>
						</s:else>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "integer", {
					validateOn : [ "blur", "change" ],
					minChars : 20,
					maxChars : 20,
					useCharacterMasking : true
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "integer", {
					validateOn : [ "blur", "change" ],
					minChars : 20,
					maxChars : 20,
					useCharacterMasking : true
				});
		var spryradio2 = new Spry.Widget.ValidationRadio("spryradio2");
	</script>
</body>
</html>

