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
	function landtransfer(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("landtransfer");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "landtransfer";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}
		rows[style - 1].style.display = "";
		if (style > 0) {
			var item = rows[style - 1].getElementsByClassName("" + style);
			for ( var i = 0; i < item.length; i++) {
				item[i].disabled = "";
			}
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
							<td><span><b>六、土地交付方式及时间</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ContractRent!saveContract_rent6">
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
							<td width="160"><label>土地交付时间及方式</label></td>
							<td>1.甲方按下列方式将出租土地交付给乙方：<span id="spryradio6"> <label>
										<input name="contractRent.landtransferType" type="radio"
										id="RadioGroup6_0" value="1"
										<s:if test="#contractRent.landtransferType==1||#contractRent.landtransferType==null" >checked="checked"</s:if>
										onclick="landtransfer(0)" /> 一次性全部交付
								</label> <label> <input type="radio"
										name="contractRent.landtransferType" value="2"
										id="RadioGroup6_1"
										<s:if test="#contractRent.landtransferType==2">checked="checked"</s:if>
										onclick="landtransfer(1)" /> 其它约定
								</label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>

						<s:if test="#contractRent.landtransferType==2">
							<tr class="landtransfer">
								<td></td>
								<td>交付约定：<span id="sprytextarea13"> <textarea
										class="1" name="contractRent.landtransferType21"
										id="textarea13" rows="8"><s:property
												value="#contractRent.landtransferType21" /></textarea> <span
										id="countsprytextarea13">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的土地交付方式。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="landtransfer hide">
								<td></td>
								<td>交付约定：<span id="sprytextarea13"> <textarea
										class="1" name="contractRent.landtransferType21" rows="8"
										disabled="disabled"><s:property
												value="#contractRent.landtransferType21" /></textarea> <span
										id="countsprytextarea13">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的土地交付方式。</span></span></td>
							</tr>
						</s:else>

						<tr>
							<td>&nbsp;</td>
							<td>2.交付资料：  <br /> ①土地承包经营权证或承包合同复印件（含红线图）； <br />
								②土地交付时的地形、地貌、土质、青苗、构（附）着物等情况的书面描述、图片等（经双方确认）； <br /> ③ 其它：<span
								id="sprytextarea14"> <textarea
									name="contractRent.landtransferOtherDatum" id="textarea14"
									rows="8"><s:property
											value="#contractRent.landtransferOtherDatum" /></textarea><span
									id="countsprytextarea14">&nbsp;</span><span
									class="textareaRequiredMsg">输入其它补充约定。</span></span><br /> 3.交付时间为：<span
								id="sprytextfield20"> <input type="text"
									name="contractRent.landtransferDate" id="text19"
									onclick="setDay(this)"
									<s:if test="#contractRent.landtransferDate!=null">
										value=<s:date name="#contractRent.landtransferDate" format="yyyy-MM-dd" /></s:if> />
									<span class="textfieldRequiredMsg">输入土地交付日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
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
		var spryradio6 = new Spry.Widget.ValidationRadio("spryradio6");
		var sprytextarea13 = new Spry.Widget.ValidationTextarea(
				"sprytextarea13", {
					maxChars : 200,
					validateOn : [ "blur", "change" ],

					counterType : "chars_remaining",
					counterId : "countsprytextarea13"
				});
		var sprytextarea14 = new Spry.Widget.ValidationTextarea(
				"sprytextarea14", {
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea14"
				});
		var sprytextfield20 = new Spry.Widget.ValidationTextField(
				"sprytextfield20", "date", {
					format : "yyyy-mm-dd",
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
	</script>
</body>
</html>