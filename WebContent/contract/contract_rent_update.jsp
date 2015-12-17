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
	function init() {
		alert("init脚本启动");
		var clientWidth = document.documentElement.clientWidth
				|| document.body.clientwidth;
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientheight;
		alert("clientHeight:" + clientHeight);
		//document.getElementById("title").style.height=40+"px";
		var titleDiv = document.getElementById("title");
		var naviDiv = document.getElementById("navi");
		alert("titleHeight:" + titleHeight + " naviHeight" + naviHeight);
		var titleHeight = titleDiv.clientHeight || titleDiv.offsetHeight;
		var naviHeight = naviDiv.clientHeight || naviDiv.offsetHeight;
		//var titleHeight = document.getElementById("title").style.height;
		//var naviHeight = document.getElementById("navi").style.height;
		alert("titleHeight:" + titleHeight + " naviHeight" + naviHeight);
		document.getElementById("ViewTarget").style.height = clientHeight
				- titleHeight - naviHeight+ "px";
		alert("viewTarget:"
				+ document.getElementById("ViewTarget").style.height);
	}
	function paystyle(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paystyle");
		for (var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paystyle";
			var item = rows[i].getElementsByClassName("" + i);
			for (var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}

		rows[style].style.display = "";

		var item = rows[style].getElementsByClassName("" + style);
		for (var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}

	function paytime(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paytime");
		for (var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paytime";
			var item = rows[i].getElementsByClassName("" + i);
			for (var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}
		rows[style].style.display = "";
		var item = rows[style].getElementsByClassName("" + style);
		for (var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}
</script>
</head>
<body onload="init();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>合同网签-出租</label>
			</div>
			<div id="navi">
				<table width="100%" border="0" class="navitable" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent0"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />封面：合同当事方
					</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent1"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />一、标的基本情况及用途</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent2"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />二、出租期限</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent3"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />三、出租价款及支付方式</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent4"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />四、支付时间</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent5"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />五、补偿标准方式及时间</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent6"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />六、土地交付方式及时间</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent7"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />七、甲方的权利和义务</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent8"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />八、乙方的权利和义务</s:a>
							</div>
							<div id="naviItemBig">
								<s:a action="ContractRent!viewContract_rent9"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />九、合同到期后地上构(附)着物及相关设施的处理</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent10"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />十、合同的变更、解除</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent11"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />十一、违约责任</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent12"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />十二、争议解决方式</s:a>
							</div>
							<div id="naviItem">
								<s:a action="ContractRent!viewContract_rent13"
									target="ViewTarget">
									<s:param name="contractBase.id" value="#contractBase.id" />十三、其他约定</s:a>
							</div>
							<div id="naviItem"></div>
							<div id="naviItemMini">
								<s:a action="ContractRent!printContract_rent" target="_new">
									<s:param name="contractBase.id" value="#contractBase.id" />预览</s:a>
							</div>
							<div id="naviItemMini">
								<s:a action="ContractSign!submitContract">
									<s:param name="contractBase.id" value="#contractBase.id" />提交审核</s:a>
							</div> <s:url action="ContractRent!printContract_rent" var="urlToPdf">
								<s:param name="contractBase.id" value="#contractBase.id" />
							</s:url>
							<div id="naviItemMini">
								<%-- 					<s:a action="ContractRent!toPdf">生成PDF<s:param --%>
								<%-- 							name="htmlURL" value="%{urlToPdf}" /> --%>
								<%-- 					</s:a> --%>
								<s:a action="ContractRent!toPdf">生成PDF<s:param
										name="htmlURL">http://www.baidu.com</s:param>
								</s:a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="client">
				<iframe id="ViewTarget" name="ViewTarget" height="235"
					frameborder="0" scrolling="auto" width="100%"></iframe>
			</div>
		</div>
	</div>
</body>
</html>