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
<script src="../common/calendarDatetime.js" type="text/javascript"></script>
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
							<td><span><b>四、支付时间</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ContractRent!saveContract_rent4">
					<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
						width="100%">
						<tr class="hide">
							<td></td>
							<td><input id="contractBase.id" name="contractBase.id"
								type="hidden" value="${contractBase.id}" /><input
								id="contractRent.id" name="contractRent.id" type="hidden"
								value="${contractRent.id}" /></td>
						</tr>
							<tr>
							<td width="160"><label>支付时间</label></td>
							<td><span id="spryradio4"> <label><s:if
											test="#contractRent.paytimeType==1||#contractRent.paytimeType==null">
											<input name="contractRent.paytimeType" type="radio"
												id="RadioGroup4_0" value="01" checked="checked"
												onclick="paytime(0)" />
										</s:if> <s:else>
											<input name="contractRent.paytimeType" type="radio"
												id="RadioGroup4_0" value="1" onclick="paytime(0)" />
										</s:else> 提前一年支付 </label> <label><s:if
											test="#contractRent.paytimeType==2">
											<input type="radio" name="contractRent.paytimeType"
												value="2" id="RadioGroup4_1" onclick="paytime(1)"
												checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contractRent.paytimeType"
												value="2" id="RadioGroup4_1" onclick="paytime(1)" />
										</s:else> 逐年支付 </label> <label><s:if
											test="#contractRent.paytimeType==3">
											<input type="radio" name="contractRent.paytimeType"
												value="3" id="RadioGroup4_2" onclick="paytime(2)"
												checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contractRent.paytimeType"
												value="3" id="RadioGroup4_2" onclick="paytime(2)" />
										</s:else> 一次性支付 </label> <label><s:if
											test="#contractRent.paytimeType==4">
											<input type="radio" name="contractRent.paytimeType"
												value="4" id="RadioGroup4_3" onclick="paytime(3)"
												checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contractRent.paytimeType"
												value="4" id="RadioGroup4_3" onclick="paytime(3)" />
										</s:else> 其它 </label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>
						<s:if
							test="#contractRent.paytimeType==1||#contractRent.paytimeType==null">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield14"> <input
										class="0" name="contractRent.paytimeType11" type="text"
										id="text13" size="2" value="${contractRent.paytimeType11}" />
										<span class="textfieldRequiredMsg">输入天数。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span
									id="sprytextfield15"> <input class="0"
										name="contractRent.paytimeType12" type="text" id="text14"
										size="2" value="${contractRent.paytimeType12}" /> <span
										class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>月<span
									id="sprytextfield16"> <input class="0"
										name="contractRent.paytimeType13" type="text" id="text15"
										size="2" value="${contractRent.paytimeType13}" /> <span
										class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付下一年度的出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield14"> <input
										class="0" name="contractRent.paytimeType11" type="text"
										id="text13" size="2" value="${contractRent.paytimeType11}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入天数。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span
									id="sprytextfield15"> <input class="0"
										name="contractRent.paytimeType12" type="text" id="text14"
										size="2" value="${contractRent.paytimeType12}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>月<span
									id="sprytextfield16"> <input class="0"
										name="contractRent.paytimeType13" type="text" id="text15"
										size="2" value="${contractRent.paytimeType13}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付下一年度的出租价款。
								</td>
							</tr>
						</s:else>
						<s:if test="#contractRent.paytimeType==2">

							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield13"> <input
										class="1" name="contractRent.paytimeType21" type="text"
										id="text12" size="2" value="${contractRent.paytimeType21}" /><span
										class="textfieldRequiredMsg">输入天数。</span>
								</span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span id="sprytextfield17"> <input
										class="1" name="contractRent.paytimeType22" type="text"
										id="text16" size="2" value="${contractRent.paytimeType22}" />
										<span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于12。</span></span>月<span
									id="sprytextfield18"> <input class="1"
										name="contractRent.paytimeType23" type="text" id="text17"
										size="2" value="${contractRent.paytimeType23}" /> <span
										class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付当年度的出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield13"> <input
										class="1" name="contractRent.paytimeType21" type="text"
										id="text12" size="2" value="${contractRent.paytimeType21}"
										disabled="disabled" /><span class="textfieldRequiredMsg">输入天数。</span>
								</span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span id="sprytextfield17"> <input
										class="1" name="contractRent.paytimeType22" type="text"
										id="text16" size="2" value="${contractRent.paytimeType22}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于12。</span></span>月<span
									id="sprytextfield18"> <input class="1"
										name="contractRent.paytimeType23" type="text" id="text17"
										size="2" value="${contractRent.paytimeType23}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付当年度的出租价款。
								</td>
							</tr>
						</s:else>

						<s:if test="#contractRent.paytimeType==3">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>一次性支付：<span id="sprytextfield19"> <input
										class="2" name="contractRent.paytimeType31" type="text"
										id="text18" size="10" onclick="setDay(this)"
										value=<s:date name="#contractRent.paytimeType31" format="yyyy-MM-dd" /> />
										<span class="textfieldRequiredMsg">点击输入支付日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>前，乙方向甲方一次性支付全部出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>一次性支付：<span id="sprytextfield19"> <input
										class="2" name="contractRent.paytimeType31" type="text"
										id="text18" size="10" onclick="setDay(this)"
										disabled="disabled"
										<s:if test="##contractRent.paytimeType31!=null">
										value=<s:date name="#contractRent.paytimeType31" format="yyyy-MM-dd" /></s:if> />
										<span class="textfieldRequiredMsg">点击输入支付日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>前，乙方向甲方一次性支付全部出租价款。
								</td>
							</tr>
						</s:else>

						<s:if test="#contractRent.paytimeType==4">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>其它：<span id="sprytextarea51"> <textarea
										class="3" name="contractRent.paytimeType41" id="textarea12"
										rows="8"><s:property
												value="#contractRent.paytimeType41" /></textarea> <span
										id="countsprytextarea51">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的支付时间。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>其它：<span id="sprytextarea51"> <textarea
										class="3" name="contractRent.paytimeType41" id="textarea12"
										rows="8" disabled="disabled"><s:property
												value="#contractRent.paytimeType41" /></textarea> <span
										id="countsprytextarea51">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的支付时间。</span></span></td>
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
		var spryradio4 = new Spry.Widget.ValidationRadio("spryradio4");
		var sprytextfield14 = new Spry.Widget.ValidationTextField(
				"sprytextfield14", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield15 = new Spry.Widget.ValidationTextField(
				"sprytextfield15", "integer", {
					minValue : 1,
					maxValue : 12,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield16 = new Spry.Widget.ValidationTextField(
				"sprytextfield16", "integer", {
					minValue : 1,
					maxValue : 31,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield13 = new Spry.Widget.ValidationTextField(
				"sprytextfield13", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield17 = new Spry.Widget.ValidationTextField(
				"sprytextfield17", "integer", {
					useCharacterMasking : true,
					minValue : 1,
					maxValue : 12,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield18 = new Spry.Widget.ValidationTextField(
				"sprytextfield18", "integer", {
					minValue : 1,
					maxValue : 31,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield19 = new Spry.Widget.ValidationTextField(
				"sprytextfield19", "date", {
					format : "yyyy-mm-dd",
					validateOn : [ "blur", "change" ]
				});
		var sprytextarea51 = new Spry.Widget.ValidationTextarea(
				"sprytextarea51", {
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea51",
					maxChars : 200,
					minChars : 5
				});
	</script>
</body>
</html>