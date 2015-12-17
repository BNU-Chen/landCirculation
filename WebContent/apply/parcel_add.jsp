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
	<div id="webClient">
		<div id="wrap">
			<div id="dlgtitle">
				<label>添加/修改流转地块基本信息</label>
			</div>
			<form action="Parcel!saveParcel" method="post"
				enctype="multipart/form-data">
				<table border="0" cellpadding="0" cellspacing="0" width="99%">
					<tr class="hide">
						<td><input type="text" name="parcel.id" value="${parcel.id}" /></td>
						<td><input type="text" name="parcel.apply.id"
							value="${parcel.apply.id}" /></td>
					</tr>
					<tr>
						<td width="200"><label>地块名称（地块编号）</label></td>
						<td colspan="3"><span id="sprytextfield1"> <input
								type="text" name="parcel.parcelCode" id="text1"
								value="${parcel.parcelCode}" /> <span
								class="textfieldRequiredMsg">18位编码（县6+乡镇2+村2+社组2+位置6）</span><span
								class="textfieldMinCharsMsg">不足18位。</span><span
								class="textfieldMaxCharsMsg">超过18位。</span></span></td>
					</tr>
					<tr>
						<td><label>土地类型</label></td>
						<td colspan="3"><span id="spryradio1"> <label>
									<input name="parcel.type" type="radio" id="landType_0"
									value="1"
									<s:if test="#parcel.type==1||#parcel.type==null">checked="checked" </s:if> />
									田
							</label> <label> <input type="radio" name="parcel.type" value="2"
									id="landType_1"
									<s:if test="#parcel.type==2">checked="checked" </s:if> />地
							</label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
					</tr>
					<tr>
						<td><label>登记面积</label></td>
						<td><span id="sprytextfield2"> <input type="text"
								name="parcel.rgArea" id="text2" size="6"
								value="${parcel.rgArea}" />
						</span>亩</td>
						<td width="150"><label>实际面积</label></td>
						<td><span id="sprytextfield3"> <input type="text"
								name="parcel.realArea" id="text3" size="6"
								value="${parcel.realArea}" />
						</span>亩</td>
					</tr>
					<tr>
						<td><label>是否基本农田</label></td>
						<td colspan="3" width="400"><span id="spryradio2"> <label>
									<input type="radio" name="parcel.basicFarmland" value="1"
									id="RadioGroup1_0"
									<s:if test="#parcel.basicFarmland==1">checked="checked" </s:if> />
									高标准基本农田
							</label> <label> <input type="radio" name="parcel.basicFarmland"
									value="2" id="RadioGroup1_1"
									<s:if test="#parcel.basicFarmland==2">checked="checked" </s:if> />
									基本农田
							</label> <label> <input name="parcel.basicFarmland" type="radio"
									id="RadioGroup1_2" value="3"
									<s:if test="#parcel.basicFarmland==3||#parcel.basicFarmland==null">checked="checked" </s:if> />
									不是基本农田
							</label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
					</tr>

					<tr>
						<td><label>四至边界:东</label></td>
						<td colspan="3"><span id="sprytextarea1"> <textarea
								name="parcel.east" id="textarea1" cols="45" rows="2"><s:property
										value="#parcel.east" /></textarea> <span id="countsprytextarea1">&nbsp;</span></span></td>
					</tr>
					<tr>
						<td><label>四至边界:南</label></td>
						<td colspan="3"><span id="sprytextarea2"> <textarea
								name="parcel.south" id="textarea2" cols="45" rows="2"><s:property
										value="#parcel.south" /></textarea> <span id="countsprytextarea2">&nbsp;</span></span></td>
					</tr>
					<tr>
						<td><label>四至边界:西</label></td>
						<td colspan="3"><span id="sprytextarea3"> <textarea
								name="parcel.west" id="textarea3" cols="45" rows="2"><s:property
										value="#parcel.west" /></textarea> <span id="countsprytextarea3">&nbsp;</span></span></td>
					</tr>
					<tr>
						<td><label>四至边界:北</label></td>

						<td colspan="3"><span id="sprytextarea4"> <textarea
								name="parcel.north" id="textarea4" cols="45" rows="2"><s:property
										value="#parcel.north" /></textarea> <span id="countsprytextarea4">&nbsp;</span></span></td>

					</tr>
					<tr>
						<td width="150">&nbsp;</td>
						<td colspan="3">
							  <input type="submit" id="btnSubmit"
							value="提交地块信息" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">		
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "integer", {
					validateOn : [ "blur", "change" ],
					minChars : 18,
					maxChars : 18,
					useCharacterMasking : true
				});
		var spryradio1 = new Spry.Widget.ValidationRadio("spryradio1", {
			validateOn : [ "blur", "change" ]
		});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "real", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "real", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var spryradio2 = new Spry.Widget.ValidationRadio("spryradio2", {
			validateOn : [ "blur", "change" ]
		});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea1",
					maxChars : 45,
					isRequired : false
				});
		var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 45,
					counterType : "chars_remaining",
					counterId : "countsprytextarea2",
					isRequired : false
				});
		var sprytextarea3 = new Spry.Widget.ValidationTextarea("sprytextarea3",
				{
					maxChars : 45,
					isRequired : false,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea3"
				});
		var sprytextarea4 = new Spry.Widget.ValidationTextarea("sprytextarea4",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 45,
					isRequired : false,
					counterType : "chars_remaining",
					counterId : "countsprytextarea4"
				});
	</script>
</body>
</html>
