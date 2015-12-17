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
<style type="text/css">
.nohover tr:hover {
	background: #eee;
}
</style>
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<script language="javascript">
	/* 	alert("test:" + !document.getElementsByClassName); */
	if (!document.getElementsByClassName) {
		/* alert("test4:"); */
		document.getElementsByClassName = function(strClassName, oElm,
				strTagName) {
			var arrElements = document.getElementsByTagName("*");

			var arrReturnElements = new Array();
			strClassName = strClassName.replace(/\-/g, "\\-");
			var oRegExp = new RegExp("(^|\\s)" + strClassName + "(\\s|$)");
			var oElement;
			for ( var i = 0; i < arrElements.length; i++) {
				oElement = arrElements[i];
				if (oRegExp.test(oElement.className)) {
					arrReturnElements.push(oElement);
				}
			}
			/* alert("test3:" + arrReturnElements.length); */
			return (arrReturnElements);
		};
	}

	function init() {
		//alert("init脚本启动");
		var clientWidth = document.documentElement.clientWidth
				|| document.body.clientwidth;
		var iframepanels = document.getElementsByClassName("iframepanel");
		//alert("clientWidth:"+clientWidth+"iframepanels:"+iframepanels.length);
		for ( var i = 0; i < iframepanels.length; i++) {
			iframepanels[i].style.width = clientWidth - 20 + "px";
		}

	}
	function reinitiframe(iframeId) {
		//alert(iframeId);
		var iframe = document.getElementById(iframeId);
		var idoc = iframe.contentwindow && iframe.contentwindow.document
				|| iframe.contentDocument;
		//alert("iframe:" + iframe + "\nidoc:" + idoc);
		try {
			/* var bheight = iframe.contentwindow.document.body.scrollheight;
			var dheight = iframe.contentwindow.document.documentelement.scrollheight;
			var height = math.max(bheight, dheight); */
			var iframeHeight = idoc.documentElement.scrollheight
					|| idoc.body.offsetHeight;
			//alert(iframeHeight);
			iframe.height = iframeHeight+50;
			//alert(iframe.height);
		} catch (ex) {
		}
	}
	function showTabpane(cursel) {
		/* 		var panels = document.getElementById("client").getElementsByClassName(
		 "panel"); */
		var panels = document.getElementsByClassName("panel");
		var tabs = document.getElementById("toc").getElementsByTagName("label");
		//alert(cursel + "\n" + tabs.length);
		for ( var i = 0; i < tabs.length; i++) {
			panels[i].style.display = "block";
			if (i == cursel) {
				tabs.item(i).className = "selected";
				/* panels.item(i).style.display = "block"; */
				var str = "iframe" + i;
				//alert(str);
				reinitiframe(str);
				//alert(str);
				panels[i].style.display = "block";
				var str = "btnSubmit" + String(i + 1);
				//alert(str);
				//document.getElementById(str).click();
			} else {
				tabs.item(i).className = "";
				/* 				panels.item(i).style.display = "none"; */
				panels[i].style.display = "none";
				//alert(i); 
			}

		}
	}
</script>
</head>
<body>
<body onload="resizeWin();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>流转申请公示--公示反馈处理</label>
			</div>
			<div id="toc">
				<table border="0" align="left" cellpadding="0" cellspacing="0">
					<tr>
						<td><label class="selected" id="default"
							onclick="showTabpane(0)">填报公示反馈处理结果</label></td>
						<td><label onclick="showTabpane(1)">浏览本流转申请情况</label></td>
						<td><label onclick="showTabpane(2)">本流转申请对应公示情况</label></td>
						<td><label onclick="showTabpane(3)">本流转申请更多公示反馈</label></td>
					</tr>
				</table>
			</div>
			<div id="client">
				<div id="responsedeal" class="panel">
					<s:url action="ApplypostResponse!dealupdateApplypostResponse"
						var="urlDealUpdate">
						<s:param name="applypostResponse.id" value="#applypostResponse.id" />
					</s:url>

					<iframe src="${urlDealUpdate}" class="iframepanel" id="iframe0"
						frameborder="0" width="100%" height="400" scrolling="no"></iframe>
				</div>
				<div id="applyinfo" class="panel hide">
					<s:url action="../apply/Apply!previewApply" var="urlPreviewApply">
						<s:param name="apply.id" value="#apply.id" />
					</s:url>

					<iframe src="${urlPreviewApply}" class="iframepanel" id="iframe1"
						frameborder="0" width="100%" height="100" scrolling="no"></iframe>
				</div>
				<div id="applypostinfo" class="panel hide">
					<s:url action="PostApply!previewPostApply" var="urlPreviewPost">
						<s:param name="postApply.id" value="#postApply.id" />
					</s:url>

					<iframe src="${urlPreviewPost}" class="iframepanel" id="iframe2"
						frameborder="0" width="100%" height="400" scrolling="no"></iframe>
				</div>
				<div id="morePostresponse" class="panel hide">
					<s:url action="" var="urlMorePostresponse">
						<s:param name="apply.id" value="#apply.id" />
					</s:url>

					<iframe src="${urlMorePostresponse}" class="iframepanel"
						id="iframe3" frameborder="0" width="100%" height="400"
						scrolling="no"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>