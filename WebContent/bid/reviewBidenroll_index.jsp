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
<script type="text/javascript">
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
	function showTabpane(cursel) {
		/* 		var panels = document.getElementById("client").getElementsByClassName(
		 "panel"); */
		var panels = document.getElementsByClassName("panel");
		var tabs = document.getElementById("toc").getElementsByTagName("label");
		// 		alert(cursel + "\n" + tabs.length);
		for ( var i = 0; i < tabs.length; i++) {
			panels[i].style.display = "block";
			if (i == cursel) {
				tabs.item(i).className = "selected";
				/* panels.item(i).style.display = "block"; */
				panels[i].style.display = "block";
				var str = "btnSubmit" + String(i + 1);
				//alert(str);
				//document.getElementById(str).click();
			} else {
				tabs.item(i).className = "";
				/* 				panels.item(i).style.display = "none"; */
				panels[i].style.display = "none";
			}

		}
	}
</script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>电子交易--竟标报名审核</label>
			</div>
			<div id="toc">
				<table border="0" align="left" cellpadding="0" cellspacing="0">
					<tr>
						<td><label id="default" onclick="showTabpane(0)">查看招标公告</label></td>
						<td><label class="selected" onclick="showTabpane(1)">查看竞标报名材料</label></td>
						<td><label onclick="showTabpane(2)">竞标报名审核</label></td>
					</tr>
				</table>
			</div>
			<div id="client">
				<div id="bidpostInfo" class="panel hide">
					<s:url action="../bid/BidPost!previewBidpost" var="urlViewBidpost">
						<s:param name="bidpost.id" value="#bidenroll.bidpost.id" />
					</s:url>
					<iframe src="${urlViewBidpost}" class="iframepanel" frameborder="0"
						width="100%" height="2000" scrolling="no"></iframe>
				</div>
				<div id="bidenrollInfo" class="panel">
					<s:url action="BidEnroll!viewBidenroll" var="urlviewBidenrollInfo">
						<s:param name="bidenroll.id" value="#bidenroll.id" />
					</s:url>

					<iframe src="${urlviewBidenrollInfo}" class="iframepanel"
						frameborder="0" width="100%" height="1000" scrolling="no"></iframe>
				</div>
				<div id="bidenrollReview" class="panel hide">
					<s:url action="BidEnroll!updateReviewBidenroll"
						var="urlupdateReviewBidenroll">
						<s:param name="bidenroll.id" value="#bidenroll.id" />
					</s:url>

					<iframe src="${urlupdateReviewBidenroll}" class="iframepanel"
						frameborder="0" width="100%" height="1000" scrolling="no"></iframe>
				</div>
			</div>
		</div>

	</div>
</body>
</html>