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
							<td><span><b>十二、争议解决方式</b></span></td>
						</tr>
					</table>
				</div>
				<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
					width="100%">
					<tr>
						<td width="160"></td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;双方发生合同纠纷可协商解决，也可以请求村民委员会、乡（镇）人民政府等调解。不愿协商、调解或协商、调解不成的，可以向该土地所在地的农村土地承包经营纠纷仲裁委员会申请仲裁，也可以直接向人民法院起诉。
						</td>

					</tr>
				</table>
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