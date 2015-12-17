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
							<td><span><b>十三、其它约定</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ContractRent!saveContract_rent13">
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
							<td width="160"><label>其它约定</label></td>
							<td>1.合同期内，该土地涉及的国家有关政策性补贴、补助及其他费用等权利按如下方式处理：<br /> <span
								id="sprytextarea8"> <textarea
									name="contractRent.other11" id="textarea8" rows="8"><s:property
											value="#contractRent.other11" /></textarea> <span
									id="countsprytextarea8">&nbsp;</span><span
									class="textareaRequiredMsg">需要提供一个值。</span><span
									class="textareaMaxCharsMsg">已超过最大字符数。</span></span>                 <br />
								2.合同期内，如果该土地被依法征收、征用、占用，相关补偿款按如下方式处理：<br /> <span
								id="sprytextarea9"> <textarea
									name="contractRent.other21" id="textarea9" rows="8"><s:property
											value="#contractRent.other21" /></textarea> <span
									id="countsprytextarea9">&nbsp;</span>
							</span>                                    <br />
								3.本合同自双方签字(盖章)后生效。未尽事宜，经双方协商一致后订立补充协议，补充协议与本合同具有同等法律效力。  <br />
								4.双方向乡（镇）人民政府农村土地承包管理部门：<span id="spryradio5"> <label>
										<input name="contractRent.authentication" type="radio"
										id="RadioGroup5_0" value="1"
										<s:if test="#contractRent.authentication==1||#contractRent.authentication==null"> checked="checked" </s:if> />
										申请合同鉴证
								</label> <label> <input type="radio"
										name="contractRent.authentication" value="2"
										id="RadioGroup5_1"
										<s:if test="#contractRent.authentication==2"> checked="checked" </s:if> />
										不申请合同鉴证
								</label> <span class="radioRequiredMsg">请进行选择。</span></span><br /> 5.其他：<span
								id="sprytextarea10"> <textarea
									name="contractRent.other51" id="textarea10" cols="45" rows="8"><s:property
											value="#contractRent.other51" /></textarea> <span
									id="countsprytextarea10">&nbsp;</span></span> <br />
								6.本合同一式四份，双方各执一份，发包方和镇（乡）人民政府农村土地承包管理部门各备案一份，鉴证备用一份。
							</td>
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