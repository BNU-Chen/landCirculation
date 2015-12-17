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
							<td><span><b>十一、违约责任</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ContractRent!saveContract_rent11">
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
							<td width="160"><label>违约责任</label></td>
							<td>1.乙方不按期支付出租价款的，每延迟壹天，按应付费用的<span id="sprytextfield21">
									<input name="contractRent.contractBreach11" type="text"
									id="text20" size="2" value="${contractRent.contractBreach11}" />
									<span class="textfieldRequiredMsg">输入违约金比例。</span>
							</span>%承担违约金；超过<span id="sprytextfield24"> <input
									name="contractRent.contractBreach12" type="text" id="text23"
									size="2" value="${contractRent.contractBreach12}" /> <span
									class="textfieldRequiredMsg">输入宽容期限</span></span>天仍未付款的，甲方有权解除合同，收回土地承包经营权。 <br />
								2.甲方不按期交付土地的，每延迟壹天，按出租费用的<span id="sprytextfield23"> <input
									name="contractRent.contractBreach21" type="text" id="text22"
									size="2" value="${contractRent.contractBreach21}" /> <span
									class="textfieldRequiredMsg">输入违约金比例。</span></span> %承担违约金；超过<span
								id="sprytextfield25"> <input
									name="contractRent.contractBreach22" type="text" id="text24"
									size="2" value="${contractRent.contractBreach22}" /> <span
									class="textfieldRequiredMsg">输入宽容期限。</span></span> 天仍未交付的，乙方有权解除合同。 <br />
								<s:if test="contractBase.transferType=='1'.toString()">
								3.一方无故擅自解除合同的，违约方应向对方支付<span id="sprytextfield26"> <input
										name="contractRent.contractBreach31" type="text" id="text25"
										size="10" value="${contractRent.contractBreach31}" disabled="disabled"/> <span
										class="textfieldRequiredMsg">输入违约金金额。</span></span>元违约金。<br />
								4.一方违反合同其他约定的，违约方应向对方支付<span id="sprytextfield27"> <input
										name="contractRent.contractBreach41" type="text" id="text26"
										size="10" value="${contractRent.contractBreach41}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入违约金金额。</span></span> 元违约金。<br />
								</s:if> <s:else>
								3.一方无故擅自解除合同的，违约方应向对方支付<span id="sprytextfield26"> <input
										name="contractRent.contractBreach31" type="text" id="text25"
										size="10" value="${contractRent.contractBreach31}" /> <span
										class="textfieldRequiredMsg">输入违约金金额。</span></span>元违约金。<br />
								4.一方违反合同其他约定的，违约方应向对方支付<span id="sprytextfield27"> <input
										name="contractRent.contractBreach41" type="text" id="text26"
										size="10" value="${contractRent.contractBreach41}" /> <span
										class="textfieldRequiredMsg">输入违约金金额。</span></span> 元违约金。<br />
								</s:else> 5.一方违约给对方造成了损失的，应赔偿损失。 <br />
								6.违约金不足以弥补对方损失的，违约方应在违约金外增加支付赔偿金，以补足对方损失。 <br />
								7.因不可抗力不能履行合同时，一方当事人应及时通知对方，并在<span id="sprytextfield4"><input
									name="contractRent.contractBreach71" type="text" id="text31"
									size="2" value="${contractRent.contractBreach71}" /><span
									class="textfieldRequiredMsg">输入期限。</span></span>日内提供证明，可根据不可抗力的影响，部分或者全部免除责任，但法律另有规定的除外。  <br />8.其它：<span
								id="sprytextarea7"> <textarea
									name="contractRent.contractBreach81" id="textarea7" cols="45"
									rows="8"><s:property
											value="#contractRent.contractBreach81" /></textarea> <span
									id="countsprytextarea7">&nbsp;</span></span></td>
						</tr>

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
		var sprytextfield21 = new Spry.Widget.ValidationTextField(
				"sprytextfield21", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield24 = new Spry.Widget.ValidationTextField(
				"sprytextfield24", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield23 = new Spry.Widget.ValidationTextField(
				"sprytextfield23", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});

		var sprytextfield25 = new Spry.Widget.ValidationTextField(
				"sprytextfield25", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur" ]
				});
		var sprytextfield26 = new Spry.Widget.ValidationTextField(
				"sprytextfield26", "real", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield27 = new Spry.Widget.ValidationTextField(
				"sprytextfield27", "real", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextarea7 = new Spry.Widget.ValidationTextarea("sprytextarea7",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var sprytextarea8 = new Spry.Widget.ValidationTextarea("sprytextarea8",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var sprytextarea9 = new Spry.Widget.ValidationTextarea("sprytextarea9",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var spryradio5 = new Spry.Widget.ValidationRadio("spryradio5");
		var sprytextarea10 = new Spry.Widget.ValidationTextarea(
				"sprytextarea10", {
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea10",
					isRequired : false
				});
	</script>
</body>
</html>