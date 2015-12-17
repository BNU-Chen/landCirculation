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
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
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
	function landRightCheckType(checktype) {

		var rows = document.getElementsByClassName("right");
		// 		alert("rows.length:" + rows.length);
		for ( var i = 0; i < rows.length; i++) {
			rows[i].className = "right hide";//隐藏所有行
			// 			alert("test:i+className\n" + i + " " + rows[i].className);

			var items = document.getElementsByClassName("" + i);
			// 			alert("items.length:" + items.length);

			for ( var j = 0; j < items.length; j++) {
				// 				alert("j:" + j);
				// 				alert("disaled:" + items[j].disabled);
				items[j].disabled = "disabled";//失效所有输入项
				// 			alert("disaled?" + items[j].disabled); 

			}
			document.getElementById("div" + i).style.display = "none";
		}

		//rows[checktype].style.display="";//显示选中项对应的行
		rows[checktype].className = "right";
		var items = document.getElementsByClassName("" + checktype);
		for ( var i = 0; i < items.length; i++) {
			items[i].disabled = "";//使能所选项对应输入项
		}
		document.getElementById("div" + checktype).style.display = "";
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
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationRadio.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>土地权属证明材料</label>
			</div>
			<div id="client">
				<div id="rightCheck">
					<div id="rightCheckType">
						<form id="form2" name="form2" method="post" action="">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								id="landRightCheck">
								<tr>
									<td width="150"><label>权属证明类型</label></td>
									<td><span id="spryradio1"> <label> <input
												name="RadioGroup1" type="radio" id="RadioGroup1_0" value="1"
												checked="checked" onclick="landRightCheckType(0)" /> 承包经营权证
										</label> <label> <input type="radio" name="RadioGroup1"
												value="2" id="RadioGroup1_1" onclick="landRightCheckType(1)" />
												承包经营合同
										</label>
									</span></td>
								</tr>
								<tr class="right">
									<td><label>承包经营权证书编号</label></td>
									<td><span id="sprytextfield1"> <input name="text1"
											class="0" type="text" id="rightWarrant" size="20"
											maxlength="20" /> <span class="textfieldRequiredMsg">必填，20位（年份4位+县级代码6位+乡镇代码2位+村代码2位+组社代码2位+顺序码4位）。</span><span
											class="textfieldMinCharsMsg">不足20位。</span><span
											class="textfieldMaxCharsMsg">超过20位。</span></span></td>
								</tr>
								<tr class="right hide">
									<td><label>承包经营权合同编号</label></td>
									<td><span id="sprytextfield2"> <input name="text2"
											class="1" type="text" id="rightContract" size="20"
											maxlength="20" disabled="disabled" /> <span
											class="textfieldRequiredMsg">必填，20位（年份4位+县级代码6位+乡镇代码2位+村代码2位+组社代码2位+顺序码4位）。</span><span
											class="textfieldMinCharsMsg">不足20位。</span><span
											class="textfieldMaxCharsMsg">超过20位。</span></span></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" name="button3" id="btnSubmit3"
										value="保存" /></td>
								</tr>
							</table>
						</form>
					</div>
					<div id="div0">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="rightWarrent">
							<tr>
								<td width="25%">&nbsp;</td>
								<td colspan="3">承包经营权证扫描件</td>
							</tr>
							<tr>
								<td><div id="img12">
										<img src="../Winter.jpg" width="320" height="240" />
									</div></td>
								<td width="25%"><div id="img34">
										<img src="../Winter.jpg" width="320" height="240" />
									</div></td>
								<td width="25%"><div id="img56">
										<img src="../Winter.jpg" width="320" height="240" />
									</div></td>
							</tr>
							<tr>
								<td><form id="form1" name="form1"
										enctype="multipart/form-data" method="post" action="">
										<span>承包经营权证1-2页</br></span> <input name="fileField" type="file"
											id="fileField" size="8" /><input type="submit" value="上传" />
										<input type="hidden" name="page" value="1" />
									</form></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><img src="../Winter.jpg" width="320" height="240" /></td>
								<td><img src="../Winter.jpg" width="320" height="240" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
					<div id="div1">
						<form id="form3" name="form3" enctype="multipart/form-data"
							method="post" action="">
							<table class="rightContract" width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<th colspan="4">承包经营合同扫描件信息</th>
								</tr>
								<tr>
									<td><label for="textarea1">说明</label></td>
									<td ><span id="sprytextarea1"> <textarea
											name="textarea1" id="textarea1" rows="1"></textarea> <span
											id="countsprytextarea1">&nbsp;</span></span></td>

									<td><label>版式</label></td>
									<td ><span id="spryradio2"> <label>
												<input type="radio" name="RadioGroup1" value="1"
												id="RadioGroup1_2" checked="checked" /> 横版
										</label> <label> <input type="radio" name="RadioGroup1"
												value="2" id="RadioGroup1_3" /> 竖版
										</label> <br /> </span></td>

								</tr>
								<tr>
									<td>&nbsp;</td>
									<td ><input type="file" name="fileField2"
										id="fileField2" /><input type="submit" name="button" id="button"
										value="上传" /></td>

									<td></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th colspan="4"><span>已上传文件列表</span></th>
								</tr>
								<tr>
									<th>序号</th>
									<th >说明</th>
									<th  colspan="2">操作</th>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td colspan="2">&nbsp;</td>
									
								</tr>
							</table>
						</form>
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
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					maxChars : 20,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea1"
				});
		var spryradio2 = new Spry.Widget.ValidationRadio("spryradio2");
	</script>
</body>
</html>

