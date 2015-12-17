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
<link href="general.css" rel="stylesheet" type="text/css" />
<script src="general.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet"
	type="text/css" />
<script language="javascript">
	function enableAdvice() {
		alert("test");
		document.getElementById("reviewAdvice").disabled = "disabled";
		document.getElementById("reviewAdvice").value = "";
		alert("test");
	}
</script>
</head>

<body>
	<div id="wrap">
		<div id="title">
			<label>填写用户注册信息审核意见</label>
		</div>
		<div id="client">
			<form id="form1" name="form1" method="post"
				action="userPerson!addReviewUserperson">
				<table>
					<tr>
						<td><label>总体结论</label></td>
						<td><input name="reviewUserperson.result" type="radio"
							id="reviewResult_0"
							onclick="document.getElementById('reviewAdvice').disabled='disabled';"
							value="0" />通过<input name="reviewUserperson.result" type="radio"
							id="reviewResult_1"
							onclick="document.getElementById('reviewAdvice').disabled='';"
							value="1" checked="CHECKED" />不通过</td>
					</tr>
					<tr>
						<td><label>审核意见</label></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><span id="spryAdvice"> <textarea
									name="reviewUserperson.advice" id="reviewAdvice" rows="10">  </textarea>
								<span id="countsprytextarea1">&nbsp;</span><span
								class="textareaMaxCharsMsg">已超过最大字符数。</span></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td width="200">&nbsp;</td>
						<td width="600">
							<%
								String reviewedUserpersonId = new String(
										request.getParameter("userPersonid"));
								request.setAttribute("reviewedId", reviewedUserpersonId);
							%><input type="hidden" name="userPerson.id" value="${reviewedId}"><input
							type="submit" id="submitReview" value="提交审核意见" />
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

				</table>
			</form>

		</div>
	</div>
	<script type="text/javascript">
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("spryAdvice", {
			maxChars : 300,
			counterType : "chars_remaining",
			counterId : "countsprytextarea1",
			isRequired : false
		});
	</script>
</body>
</html>
