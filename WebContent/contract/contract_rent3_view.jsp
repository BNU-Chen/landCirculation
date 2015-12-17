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
<script src="../common/calendar.js" type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationRadio.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function paystyle(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paystyle");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paystyle";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}

		rows[style].style.display = "";

		var item = rows[style].getElementsByClassName("" + style);
		for ( var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}

	function paytime(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paytime");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paytime";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}
		rows[style].style.display = "";
		var item = rows[style].getElementsByClassName("" + style);
		for ( var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}
</script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td><span><b>三、出租价款及支付方式<s:property
											value="#contractRent.payType" /></b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ContractRent!saveContract_rent3">
					<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
						width="100%">
						<tr class="hide">
							<td></td>
							<td><input id="contractBase.id" name="contractBase.id"
								type="hidden" value="${contractBase.id}" /><input
								id="contractRent.id" name="contract_rent.id" type="hidden"
								value="${contact_rent.id}" /></td>
						</tr>
						<tr>
							<td width="160"><label>面积计算办法</label></td>
							<td><span id="spryradio3"> <s:if
										test="#contractRent.areaType==1">
										<label><input name="contractRent.areaType"
											type="radio" id="RadioGroup3_0" value="1" checked="checked" />
											登记面积 </label>
										<label> <input name="contractRent.areaType"
											type="radio" id="RadioGroup3_1" value="2" /> 实际面积
										</label>
									</s:if> <s:else>
										<label><input name="contractRent.areaType"
											type="radio" id="RadioGroup3_0" value="1" /> 登记面积 </label>
										<label> <input name="contractRent.areaType"
											type="radio" id="RadioGroup3_1" value="2" checked="checked" />
											实际面积
										</label>
									</s:else> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>
						<tr>
							<td width="200"><label>流转价款及支付方式<s:property
										value="#contractRent.payType" /></label></td>
							<td><span id="spryradio2"> <label> <s:if
											test="#contractRent.payType==1||#contractRent.payType==null">
											<input name="contractRent.payType" type="radio"
												id="RadioGroup2_0" value="1" checked="checked"
												onclick="paystyle(0)" />
										</s:if> <s:else>
											<input name="contractRent.payType" type="radio"
												id="RadioGroup2_0" value="1" onclick="paystyle(0)" />
										</s:else> 货币支付
								</label> <label><s:if test="#contractRent.payType==2">
											<input type="radio" name="contractRent.payType" value="2"
												id="RadioGroup2_1" onclick="paystyle(1)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contractRent.payType" value="2"
												id="RadioGroup2_1" onclick="paystyle(1)" />
										</s:else>实物支付 </label> <label><s:if test="#contractRent.payType==3">
											<input type="radio" name="contractRent.payType" value="3"
												id="RadioGroup2_2" onclick="paystyle(2)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contractRent.payType" value="3"
												id="RadioGroup2_2" onclick="paystyle(2)" />
										</s:else> 其它 </label>
							</span></td>
						</tr>
						<s:if test="#contractRent.payType==1||#contractRent.payType==null">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td>第一年流转价款为：水田每亩人民币<span id="sprytextfield9"> <input
										class="0" name="contractRent.payType11" type="text" id="text8"
										size="4" value="${contractRent.payType11}" /> <span
										class="textfieldRequiredMsg">输入流转单价。</span></span>元，旱地每亩人民币<span
									id="sprytextfield92"> <input class="0"
										name="contractRent.payType12" type="text" id="text8" size="4"
										value="${contractRent.payType12}" /> <span
										class="textfieldRequiredMsg">输入流转单价。</span></span>元，合计人民币<span
									id="sprytextfield93"> <input class="0"
										name="contractRent.payType13" type="text" id="text8" size="4"
										value="${contractRent.payType13}" disabled="disabled" readonly="readonly"/> <span
										class="textfieldRequiredMsg">输入流转总价。</span></span>元，以后每年累积递增比例为<span
									id="sprytextfield10"> <input class="0"
										name="contractRent.payType14" type="text" id="text9" size="2"
										value="${contractRent.payType14}"> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td>第一年流转价款为：水田每亩人民币<span id="sprytextfield9"> <input
										class="0" name="contractRent.payType11" type="text" id="text8"
										size="4" value="${contractRent.payType11}" disabled="disabled" />
										<span class="textfieldRequiredMsg">输入流转单价。</span></span>元，旱地每亩人民币<span
									id="sprytextfield92"> <input class="0"
										name="contractRent.payType12" type="text" id="text8" size="4"
										value="${contractRent.payType12}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入流转单价。</span></span>元，合计人民币<span
									id="sprytextfield93"> <input class="0"
										name="contractRent.payType13" type="text" id="text8" size="4"
										value="${contractRent.payType13}" disabled="disabled" readonly="readonly"/> <span
										class="textfieldRequiredMsg">输入流转总价。</span></span>元，以后每年累积递增比例为<span
									id="sprytextfield10"> <input class="0"
										name="contractRent.payType14" type="text" id="text9" size="2"
										value="${contractRent.payType14}" disabled="disabled">
										<span class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:else>
						<s:if test="#contractRent.payType==2">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td>第一年流转价款为水田每亩<span id="sprytextfield11"> <input
										class="1" name="contractRent.payType21" type="text"
										id="text10" size="4" value="${contractRent.payType21}" /> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤,合计<span
									id="sprytextfield113"> <input class="1"
										name="contractRent.payType23" type="text" id="text10" size="4"
										value="${contractRent.payType23}" disabled="disabled" readonly="readonly"/> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤<span
									id="spryselect1"> <select class="1"
										name="contractRent.payType22" id="select1">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，旱地每亩<span
									id="sprytextfield114"> <input class="1"
										name="contractRent.payType24" type="text" id="text10" size="4"
										value="${contractRent.payType24}" /> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤,合计<span
									id="sprytextfield116"> <input class="1"
										name="contractRent.payType26" type="text" id="text10" size="4"
										value="${contractRent.payType26}" disabled="disabled" readonly="readonly"/> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤<span
									id="spryselect15"> <select class="1"
										name="contractRent.payType25" id="select15">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，以后每年累积递增比例为<span
									id="sprytextfield12"> <input class="1"
										name="contractRent.payType27" type="text" id="text11" size="2"
										value="${contractRent.payType27}" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td>第一年流转价款为水田每亩 <span id="sprytextfield11"> <input
										class="1" name="contractRent.payType21" type="text"
										id="text10" size="4" value="${contractRent.payType21}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤,合计 <span
									id="sprytextfield113"> <input class="1"
										name="contractRent.payType23" type="text" id="text10" size="4"
										value="${contractRent.payType23}" disabled="disabled" readonly="readonly"/> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤 <span
									id="spryselect1"> <select class="1"
										name="contractRent.payType22" id="select1" disabled="disabled">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，旱地每亩 <span
									id="sprytextfield114"> <input class="1"
										name="contractRent.payType24" type="text" id="text10" size="4"
										value="${contractRent.payType24}" disabled="disabled"/> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤,合计 <span
									id="sprytextfield116"> <input class="1"
										name="contractRent.payType26" type="text" id="text10" size="4"
										value="${contractRent.payType26}" disabled="disabled" readonly="readonly"/> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤 <span
									id="spryselect15"> <select class="1"
										name="contractRent.payType25" id="select15" disabled="disabled">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，以后每年累积递增比例为 <span
									id="sprytextfield12"> <input class="1"
										name="contractRent.payType27" type="text" id="text11" size="2"
										value="${contractRent.payType27}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:else>
						<s:if test="#contractRent.payType==3">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td><span id="sprytextarea11"> <textarea class="2"
										name="contractRent.payType31" id="textarea11" rows="5"><s:property
												value="#contractRent.payType31" /></textarea> <span
										id="countsprytextarea11">&nbsp;</span><span
										class="textareaRequiredMsg">请填写约定的支付方式。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td><span id="sprytextarea11"> <textarea class="2"
										name="contractRent.payType31" id="textarea11" rows="5"
										disabled="disabled"><s:property
												value="#contractRent.payType31" /></textarea> <span
										id="countsprytextarea11">&nbsp;</span><span
										class="textareaRequiredMsg">请填写约定的支付方式。</span></span></td>
							</tr>
						</s:else>


						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" value="保存" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var spryradio3 = new Spry.Widget.ValidationRadio("spryradio3");
		var spryradio2 = new Spry.Widget.ValidationRadio("spryradio2");
		var sprytextfield9 = new Spry.Widget.ValidationTextField(
				"sprytextfield9", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield92 = new Spry.Widget.ValidationTextField(
				"sprytextfield92", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield92 = new Spry.Widget.ValidationTextField(
				"sprytextfield92", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield10 = new Spry.Widget.ValidationTextField(
				"sprytextfield10", "integer", {
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield11 = new Spry.Widget.ValidationTextField(
				"sprytextfield11", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield113 = new Spry.Widget.ValidationTextField(
				"sprytextfield113", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield114 = new Spry.Widget.ValidationTextField(
				"sprytextfield114", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield116 = new Spry.Widget.ValidationTextField(
				"sprytextfield116", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
		var spryselect15 = new Spry.Widget.ValidationSelect("spryselect15");

		var sprytextfield12 = new Spry.Widget.ValidationTextField(
				"sprytextfield12", "integer", {
					validateOn : [ "blur", "change" ]
				});

		var sprytextarea11 = new Spry.Widget.ValidationTextarea(
				"sprytextarea11", {
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea11",
					maxChars : 200,
					minChars : 5
				});
	</script>
</body>
</html>