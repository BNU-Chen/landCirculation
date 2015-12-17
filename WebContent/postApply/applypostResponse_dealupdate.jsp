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
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<form id="form1" name="form1" method="post"
					action="ApplypostResponse!dealsaveApplypostResponse">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr class="hide">
							<td>流转申请公示明细ID</td>
							<td><input type="text" name="applypostResponse.id"
								value="${applypostResponse.id}"></td>
						</tr>
						<tr>
							<td width="16%"><label for="textarea2">问题详情</label></td>
							<td><textarea cols="45" rows="5" disabled="disabled"><s:property
										value="#applypostResponse.question" /></textarea></td>
						</tr>
						<tr>
							<td><label for="textarea3">处理意见</label></td>
							<td><span><label><input
										name="applypostResponse.dealType" type="radio"
										id="RadioGroup1_0" value="0" checked="checked" />
										公示终止,返回申请人。</label><label> <input type="radio"
										name="applypostResponse.dealType" value="1" id="RadioGroup1_1" />
										已妥善处理,继续公示。
								</label></span></td>
						</tr>
						<tr>
							<td><label for="textarea2">处理说明</label></td>
							<td><span id="sprytextarea2"> <textarea
									name="applypostResponse.dealComment" id="textarea2" cols="45"
									rows="5"><s:property
											value="#applypostResponse.dealComment" /></textarea> <span
									id="countsprytextarea2">&nbsp;</span><span
									class="textareaRequiredMsg">必填。</span><span
									class="textareaMinCharsMsg">请详细填写。</span></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" id="button" value="提交公示反馈处理意见" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2",
				{
					validateOn : [ "blur", "change" ],
					minChars : 5,
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea2"
				});
	</script>
</body>
</html>