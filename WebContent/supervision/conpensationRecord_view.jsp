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
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" cellspacing="0" cellpadding="0"
						align="center" width="100%">
						<tr>
							<td><span><b>二、年度支付信息</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="ConpensationRecord!viewConpensationRecord">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<td class="alignright"><b>报告年份</b></td>
							<td colspan="2"><input name="textfield2" type="text"
								id="textfield2" size="6" /></td>
							<td class="alignright">&nbsp;</td>
							<td width="17%" class="alignright">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>						
						<tr>
							<td class="alignright">&nbsp;</td>
							<td colspan="5"><span class="aligncenter"><b>年度支付信息</b></span></td>
						</tr>
						<tr>
							<td class="alignright"><b>本年度应付（水田）</b></td>
							<td>&nbsp;</td>
							<td class="alignright"><b>本年度应付（旱地）</b></td>
							<td>&nbsp;</td>
							<td class="alignright"><b>本年度应付合计</b></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="alignright"><b> <label for="text1">本年度实付（水田）</label></b></td>
							<td><span id="sprytextfield1"> <input name="text1"
									type="text" id="text1" size="10" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMinValueMsg">最小值0。</span></span></td>
							<td class="alignright"><b><label for="text2">本年度实付（旱地）</label></b></td>
							<td><span id="sprytextfield2"> <input name="text2"
									type="text" id="text2" size="10" /> <span
									class="textfieldRequiredMsg">必填。</span><span
									class="textfieldMinValueMsg">最小值0。</span></span></td>
							<td class="alignright"><b>本年度实付合计</b></td>
							<td><input name="textfield" type="text" disabled="disabled"
								id="textfield" /></td>
						</tr>
						<tr>
							<td class="alignright">&nbsp;</td>
							<td>&nbsp;</td>
							<td class="alignright">&nbsp;</td>
							<td>&nbsp;</td>
							<td class="alignright">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="alignright">&nbsp;</td>
							<td>&nbsp;</td>
							<td class="alignright"><input type="submit" value="保存" /></td>
							<td>&nbsp;</td>
							<td class="alignright">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					minValue : 0
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					minValue : 0
				});
	</script>
</body>
</html>
