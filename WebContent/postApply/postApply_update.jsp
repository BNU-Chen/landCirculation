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
<script src="../common/calendar.js" type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
</head>
<body>
<body onload="resizeWin();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>公示信息发布--待发布公示</label>
			</div>
			<div id="navi">
				<table border="0" cellpadding="0" cellspacing="0" align="right"
					height="100%">
					<tr>
						<td><a href="PostApply!listTobepostApplys">添加拟公示流转申请</a></td>
						<td><label><s:url var="urlPreviewPostApply"
									value="PostApply!previewPostApply">
									<s:param name="postApply.id" value="#postApply.id" />
								</s:url><a href="${urlPreviewPostApply}">打印预览</a></label></td>
						<td><label> <s:url var="urlPublishPostApply"
									value="PostApply!publishPostApply">
									<s:param name="postApply.id" value="#postApply.id" />
								</s:url> <a href="${urlPublishPostApply}">发布公示</a></label></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="client">
			<form id="form1" name="form1" method="post"
				action="PostApply!savePostApply">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr class="hide">
						<td>公示id</td>
						<td><input type="text" name="postApply.id"
							value="${postApply.id}"></td>
					</tr>
					<tr>
						<td width="12%"><label for="text3">公示机构</label></td>
						<td width="20%"><span id="sprytextfield3"> <input
								name="postApply.poster" type="text" id="text3" size="10"
								maxlength="10" value="${postApply.poster}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldMinCharsMsg">最少2字。</span><span
								class="textfieldMaxCharsMsg">最多10字。</span></span></td>
						<td width="12%"><label for="text1">公示起始时间</label></td>
						<td width="20%"><span id="sprytextfield1"> <input
								name="postApply.startDate" type="text" id="text1" size="10"
								maxlength="10"
								<s:if test="#postApply.startDate!=null">value=<s:date name="#postApply.startDate" format="yyyy-MM-dd" /> </s:if>
								onclick="HS_setDate(this)" /><span class="textfieldRequiredMsg">必填。</span>
						</span></td>
						<td width="12%"><label for="text2">公示结束时间</label></td>
						<td><span id="sprytextfield2"> <input
								name="postApply.endDate" type="text" id="text2" size="10"
								maxlength="10"
								<s:if test="#postApply.endDate!=null">value=<s:date name="#postApply.endDate" format="yyyy-MM-dd" /> </s:if>
								onclick="HS_setDate(this)" /><span class="textfieldRequiredMsg">必填。</span>
						</span></td>

					</tr>
					<tr>
						<td><label for="text4">联系人</label></td>
						<td><span id="sprytextfield4"> <input
								name="postApply.responsePicname" type="text" id="text4"
								size="10" maxlength="10" value="${postApply.responsePicname}" />
								<span class="textfieldRequiredMsg">必填。</span><span
								class="textfieldMinCharsMsg">最少2字。</span><span
								class="textfieldMaxCharsMsg">最多10字。</span></span></td>
						<td><label for="text5">联系电话</label></td>
						<td><span id="sprytextfield5"> <input
								name="postApply.responseTel" type="text" id="text5" size="11"
								maxlength="11" value="${postApply.responseTel}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldMinCharsMsg">11位。</span><span
								class="textfieldMaxCharsMsg">11位。</span></span></td>
						<td><label for="text6">电子邮件</label></td>
						<td><span id="sprytextfield6"> <input
								name="postApply.responseEmail" type="text" id="text6" size="20"
								value="${postApply.responseEmail}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldInvalidFormatMsg">格式无效。</span><span
								class="textfieldMinCharsMsg">填写完整地址。</span><span
								class="textfieldMaxCharsMsg">最多45字符。</span></span></td>
					</tr>
					<tr>
						<td><label for="textarea1">联系电址</label></td>
						<td colspan="3"><span id="sprytextarea1"> <textarea
								name="postApply.responseAddress" id="textarea1" cols="20"
								rows="2"><s:property
										value="#postApply.responseAddress" /></textarea> <span
								id="countsprytextarea1">&nbsp;</span><span
								class="textareaRequiredMsg">必填。</span><span
								class="textareaMinCharsMsg">填写完整地址。</span></span></td>
						<td colspan="2"><input type="submit" value="保存"></td>
					</tr>
				</table>
			</form>
			<div id="tabletitle">
				<label>拟公示流转申请列表</label>
			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<th width="40">序号</th>
					<th width="93">申请人姓名</th>
					<th width="138">申请人身份证号码</th>
					<th width="80">总面积</th>
					<th width="80">田面积</th>
					<th width="80">地面积</th>
					<th width="201">权属证明</th>
					<th width="225">土地地址</th>
					<th width="72">操作</th>
				</tr>
				<s:iterator var="postdetailApply" value="#postdetailApplys"
					status="st">
					<s:if test="#st.odd">
						<tr style="background-color: lightgreen;">
					</s:if>
					<s:else>
						<tr style="background-color: white;">
					</s:else>
					<td><s:property value="#st.index+1" /></td>
					<td><s:property value="#postdetailApply.applierName" /></td>
					<td><s:property value="#postdetailApply.applierIdcode" /></td>
					<td><s:property value="#postdetailApply.landRgArea" /></td>
					<td><s:property value="#postdetailApply.paddyfeildRgArea" /></td>
					<td><s:property value="#postdetailApply.drylandRgArea" /></td>
					<td><s:if test="#postdetailApply.rightAuthType==1">权证：<s:property
								value="#postdetailApply.landwarrantCode" />
						</s:if> <s:else>权证：<s:property
								value="#postdetailApply.landcontractCode" />
						</s:else></td>
					<td><s:property value="#postdetailApply.landAddress" /></td>
					<td><s:a action="PostApply!deletePostApply">删除
													<s:param name="postdetailApply.id"
								value="#postdetailApply.id" />
						</s:a>
					</tr>
				</s:iterator>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "date", {
					validateOn : [ "blur", "change" ],
					format : "yyyy-mm-dd"
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "date", {
					format : "yyyy-mm-dd",
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "none", {
					validateOn : [ "blur", "change" ],
					minChars : 2,
					maxChars : 10
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "none", {
					minChars : 2,
					maxChars : 10,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield5 = new Spry.Widget.ValidationTextField(
				"sprytextfield5", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					minChars : 11,
					maxChars : 11
				});
		var sprytextfield6 = new Spry.Widget.ValidationTextField(
				"sprytextfield6", "email", {
					validateOn : [ "blur", "change" ],
					minChars : 5,
					maxChars : 45
				});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea1",
					maxChars : 45,
					minChars : 5
				});
	</script>
	</ body>
</html>