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
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<form id="form1" name="form1" method="post"
					action="ContractSign!saveReviewContract" target="_parent">
					<table width="100%">
						<tr class="hide">
							<td>contractfillingId</td>
							<td><input type="text" name="contractfilling.id" value="${contractfilling.id}" /></td>
						</tr>
						<tr>
							<td><label>总体结论</label></td>
							<td><input name="contractfilling.reviewResult" type="radio"
								<s:if test="#contractfilling.reviewResult==0"> checked="CHECKED"</s:if>
								id="reviewResult_0"
								onclick="document.getElementById('reviewComment').value='';document.getElementById('reviewComment').disabled='disabled';"
								value="0" />通过<input name="contractfilling.reviewResult"
								type="radio"
								<s:if test="#contractfilling.reviewResult==1"> checked="CHECKED" </s:if>
								id="reviewResult_1"
								onclick="document.getElementById('reviewComment').disabled='';"
								value="1" />不通过</td>
						</tr>
						<tr>
							<td><label>审核意见</label></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><span id="spryAdvice"> <textarea
									name="contractfilling.reviewComment" id="reviewComment" rows="10"
									<s:if test="#contractfilling.reviewResult==0"> disabled="disabled"</s:if>><s:property
											value="#contractfilling.reviewComment" /></textarea> <span
									id="countsprytextarea1">&nbsp;</span><span
									class="textareaMaxCharsMsg">已超过最大字符数。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="150">&nbsp;</td>
							<td><input type="submit" id="submitReview" value="提交审核意见" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
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