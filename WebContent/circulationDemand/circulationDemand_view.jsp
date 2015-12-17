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
<script src="../common/regioncode.js" type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
</head>
<body onload="send_provinceRequest();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>登记土地流转转入需求信息</label>
			</div>
			<div id="navi">
				<table class="navitable">
					<tr>
						<td>
							<div id="naviItemBig"></div>
							<div id="naviItemMini">
								<s:a action="CirculationDemand!previewCirculationDemand"
									target="_blank">预览 
						<s:param name="circulationDemand.id" value="#circulationDemand.id" />
								</s:a>
							</div>
							<div id="naviItemMini">
								<s:a action="CirculationDemand!submitCirculationDemand">提交
					<s:param name="circulationDemand.id" value="#circulationDemand.id" />
								</s:a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="client">
				<form action="CirculationDemand!updateCirculationDemand">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>&nbsp;</td>
							<td colspan="5"><span>需求方基本信息</span></td>
						</tr>
						<tr class="hide">
							<td><input type="text" name="circulationDemand.id"
								value="${circulationDemand.id}"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><label><b>需求方名称</b></label></td>
							<td><s:property value="#circulationDemand.demanderName" /></td>
							<td><label><b>证件类型</b></label></td>
							<td><s:property value="#circulationDemand.demanderTypeName" /></td>
							<td><label><b>证件号码</b></label></td>
							<td><s:property value="#circulationDemand.demanderIdcode" /></td>
						</tr>
						<tr>
							<td><label><b>电话</b></label></td>
							<td><s:property value="#circulationDemand.demanderTel" /></td>
							<td><label><b>电子邮件</b></label></td>
							<td colspan="3"><s:property
									value="#circulationDemand.demanderEmail" /></td>
						</tr>
						<tr>
							<td><label><b>地址</b></label></td>
							<td colspan="5"><s:property
									value="#circulationDemand.demanderAddress" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="5"><span>流转转入需求信息</span></td>
						</tr>
						<tr>
							<td><label><b>意向地块位置</b></label></td>
							<td colspan="5"><s:property value="#circulationDemand.landAddress"/></td>
						</tr>
						<tr>
							<td><label><b>所属组社</b></label></td>
							<td><input name="circulationDemand.landTeam" type="text"
								id="textfield" size="4" maxlength="4"
								value="${circulationDemand.landTeam}" disabled="disabled" /></td>
							<td><label><b>流转形式</b></label></td>
							<td><span id="spryselect6"> <select
									name="circulationDemand.CirculationType" id="circulationType" disabled="disabled"> <s:if
											test="#circulationDemand.CirculationType=='01' or #circulationDemand.CirculationType==nulll">
											<option value="01" selected="selected">出租</option>
										</s:if>
										<s:else>
											<option value="01">出租</option>
										</s:else>
										<s:if test="#circulationDemand.CirculationType=='02' ">
											<option value="02" selected="selected">入股</option>
										</s:if>
										<s:else>
											<option value="02">入股</option>
										</s:else>
										<s:if test="#circulationDemand.CirculationType=='03' ">
											<option value="03" selected="selected">转让</option>
										</s:if>
										<s:else>
											<option value="03">转让</option>
										</s:else>
										<s:if test="#circulationDemand.CirculationType=='04'">
											<option value="04" selected="selected">转包</option>
										</s:if>
										<s:else>
											<option value="04">转包</option>
										</s:else>
										<s:if test="#circulationDemand.CirculationType=='05' ">
											<option value="05" selected="selected">互换</option>
										</s:if>
										<s:else>
											<option value="05">互换</option>
										</s:else>
								</select> <span class="selectRequiredMsg">请选择一个项目。</span></span></td>
							<td><label><b>流转期限</b></label></td>
							<td><span id="sprytextfield1"> <input
									name="circulationDemand.landDuration" type="text" id="text1"
									size="2" maxlength="2"
									value="${circulationDemand.landDuration}" disabled="disabled" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMinValueMsg">最少1年。</span><span
									class="textfieldMaxValueMsg">最多30年。</span></span></td>
						</tr>
						<tr>
							<td><label><b>土地类型</b></label></td>
							<td><span id="spryselect7"> <select
									name="circulationDemand.landType" id="select2" disabled="disabled">
										<s:if
											test="#circulationDemand.landType=='03' or circulationDemand.landType==null">
											<option value="03">水田旱地均可</option>
										</s:if>
										<option value="03">水田旱地均可</option>
										<s:else>
										</s:else>
										<s:if test="#circulationDemand.landType=='01' ">
											<option value="01" selected="selected">水田</option>
										</s:if>
										<option value="01">水田</option>
										<s:else>
										</s:else>
										<s:if test="#circulationDemand.landType=='02' ">
											<option value="02" selected="selected">旱地</option>
										</s:if>
										<option value="02">旱地</option>
										<s:else>
										</s:else>
								</select> <span class="selectRequiredMsg">请选择一个项目。</span></span></td>
							<td><label><b>意向面积</b></label></td>
							<td><span id="sprytextfield2"> <input
									name="circulationDemand.landArea" type="text" id="text2"
									size="4" maxlength="4" value="${circulationDemand.landArea}" disabled="disabled" />
									<span class="textfieldRequiredMsg">需要提供一个值。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span><span
									class="textfieldMinValueMsg">输入值小于所需的最小值。</span></span></td>
							<td><label><b>意向价格</b></label></td>
							<td><span id="sprytextfield3"> <input
									name="circulationDemand.landPrice" type="text" id="text3"
									size="6" maxlength="6" value="${circulationDemand.landPrice}" disabled="disabled"/>
									<span class="textfieldRequiredMsg">需要提供一个值。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span><span
									class="textfieldMinValueMsg">输入值小于所需的最小值。</span></span></td>
						</tr>
						<tr>
							<td><label><b>流转后用途</b></label></td>
							<td colspan="5"><span id="sprytextfield4"> <input
									name="circulationDemand.landUseType" type="text" id="text4"
									size="20" maxlength="20"
									value="${circulationDemand.landUseType}" disabled="disabled" /> <span
									class="textfieldRequiredMsg">需要提供一个值。</span><span
									class="textfieldMinCharsMsg">不符合最小字符数要求。</span><span
									class="textfieldMaxCharsMsg">已超过最大字符数。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="5"><span>联系人基本信息</span></td>
						</tr>
						<tr>
							<td><b><label>联系人姓名</label></b></td>
							<td><span id="sprytextfield5"> <input type="text"
									name="circulationDemand.picName" id="text5"
									value="${circulationDemand.picName}" disabled="disabled" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMaxCharsMsg">最多20个字。</span></span></td>
							<td><label><b>身份证号码</b></label></td>
							<td><span id="sprytextfield6"> <input type="text"
									name="circulationDemand.picIdcode" id="text6"
									value="${circulationDemand.picIdcode}" disabled="disabled" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMaxCharsMsg">18位身份证号码。</span><span
									class="textfieldMinCharsMsg">18位身份证号码。</span></span></td>
							<td><label><b>联系电话</b></label></td>
							<td><span id="sprytextfield7"> <input type="text"
									name="circulationDemand.picTel" id="text7"
									value="${circulationDemand.picTel}" disabled="disabled" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMinCharsMsg">111位电话号码。</span><span
									class="textfieldMaxCharsMsg">11位电话号码。</span></span></td>
						</tr>
						<tr>
							<td><label><b>联系地址</b></label></td>
							<td colspan="3"><span id="sprytextfield8"> <input
									name="circulationDemand.picAddress" type="text" id="text8"
									size="80" value="${circulationDemand.picAddress}" disabled="disabled"/> <span
									class="textfieldRequiredMsg">需要提供一个值。</span><span
									class="textfieldMinCharsMsg">不符合最小字符数要求。</span><span
									class="textfieldMaxCharsMsg">已超过最大字符数。</span></span></td>
							<td><label><b>电子邮件</b></label></td>
							<td><span id="sprytextfield9"> <input type="text"
									name="circulationDemand.picEmail" id="text9"
									value="${circulationDemand.picEmail}"disabled="disabled" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMaxCharsMsg">已超过最大字符数。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="5"><span>项目扩展信息</span></td>
						</tr>
						<tr>
							<td><label><b>需求方简介</b></label></td>
							<td colspan="5"><span id="sprytextarea1"> <textarea
									name="circulationDemand.demanderDescript" cols="55" rows="5"
									id="textarea1"><s:property
											value="#circulationDemand.demanderDescript" disabled="disabled" /></textarea> <span
									id="countsprytextarea1">&nbsp;</span><span
									class="textareaRequiredMsg">必镇。</span><span
									class="textareaMinCharsMsg">太简单。</span></span></td>
						</tr>
						<tr>
							<td><label><b>项目简介</b></label></td>
							<td colspan="5"><span id="sprytextarea2"> <textarea
									name="circulationDemand.projectDescript" id="textarea2"
									cols="55" rows="5"><s:property
											value="#circulationDemand.projectDescript" disabled="disabled"/></textarea> <span
									id="countsprytextarea2">&nbsp;</span><span
									class="textareaRequiredMsg">必填。</span><span
									class="textareaMinCharsMsg">太简单。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td colspan="2"><input type="submit" value="保    存" disabled="disabled"><input type="submit" value="修     改" >
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="17%">&nbsp;</td>
							<td width="17%">&nbsp;</td>
							<td width="17%">&nbsp;</td>
							<td width="17%">&nbsp;</td>
							<td width="17%">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var spryselect2 = new Spry.Widget.ValidationSelect("spryselect2", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});

		var spryselect3 = new Spry.Widget.ValidationSelect("spryselect3", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var spryselect4 = new Spry.Widget.ValidationSelect("spryselect4", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var spryselect5 = new Spry.Widget.ValidationSelect("spryselect5", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});

		var spryselect6 = new Spry.Widget.ValidationSelect("spryselect6", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					minValue : 1,
					maxValue : 30
				});
		var spryselect7 = new Spry.Widget.ValidationSelect("spryselect7", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "real", {
					minValue : 0,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "integer", {
					minValue : 0,
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "none", {
					minChars : 2,
					maxChars : 20,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield5 = new Spry.Widget.ValidationTextField(
				"sprytextfield5", "none", {
					maxChars : 20
				});
		var sprytextfield6 = new Spry.Widget.ValidationTextField(
				"sprytextfield6", "none", {
					maxChars : 18,
					minChars : 18
				});
		var sprytextfield7 = new Spry.Widget.ValidationTextField(
				"sprytextfield7", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					minChars : 11,
					maxChars : 11
				});
		var sprytextfield8 = new Spry.Widget.ValidationTextField(
				"sprytextfield8", "none", {
					validateOn : [ "blur", "change" ],
					minChars : 2,
					maxChars : 255
				});
		var sprytextfield9 = new Spry.Widget.ValidationTextField(
				"sprytextfield9", "email", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					maxChars : 255
				});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					counterType : "chars_remaining",
					counterId : "countsprytextarea1",
					validateOn : [ "blur", "change" ],
					minChars : 2,
					maxChars : 255
				});
		var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2",
				{
					counterType : "chars_remaining",
					counterId : "countsprytextarea2",
					validateOn : [ "blur", "change" ],
					minChars : 2,
					maxChars : 255
				});
	</script>
</body>
</html>