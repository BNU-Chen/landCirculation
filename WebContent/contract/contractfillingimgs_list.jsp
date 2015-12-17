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
	function openwin() {
		window
				.open(
						this.src,
						"newwindow",
						"height=600, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
	}
	function imginit() {
		var imgs = document.getElementsByClassName('contractimg');
		for ( var i = 0; i < imgs.length; i++) {
			imgs[i].onclick = openwin;
// 			alert(imgs[i].onclick);
		}
	}
</script>

</head>
<body onload="imginit();">
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="2"><span>已上传合同电子扫描件列表</span></td>
						<td></td>

					</tr>

					<tr>
						<th width="60">序号</th>
						<th width="150">合同号</th>
						<th width="60">页次</th>
						<th width="90">预览</th>
						<th>操作</th>
					</tr>
					<s:iterator var="contractfillingimg" value="contractfillingimgs"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgray;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:property value="#contractfillingimg.contractNo" /></td>
						<td><s:property
								value="#contractfillingimg.contractfillingimgSn" /></td>
						<td><img class="contractimg" width="80" height="120"
							src="${contractfillingimg.contractfillingimgPathFilename}"></td>
						<td><s:url
								action="ContractfillingimgUpload!deleteContractfillingimg"
								var="urlDel">
								<s:param name="contractfillingimg.id"
									value="#contractfillingimg.id" />
							</s:url> <s:a href="%{urlDel}">删除
		
					</s:a> <s:url action="LandcontractImgUpload!previewContractImg"
								var="urlPreview">
								<s:param name="contractfillingimg.id"
									value="#contractfillingimg.id" />
							</s:url> <a href="${contractfillingimg.contractfillingimgPathFilename}"
							target="_blank">查看 </a></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
</body>
</html>