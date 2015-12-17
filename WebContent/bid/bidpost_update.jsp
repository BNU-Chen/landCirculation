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
<script src="../common/calendarDatetime.js" type="text/javascript"></script>
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
				<label>招标公告--待发布招标公告</label>
			</div>
			<div id="navi">
				<table border="0" cellpadding="0" cellspacing="0" align="right"
					height="100%">
					<tr>
						<td><a href="BidPost!listTopostBidApplys">添加拟招标流转申请</a></td>
						<td><label><s:url var="urlPreviewBidpost"
									value="BidPost!previewBidpost">
									<s:param name="bidpost.id" value="#bidpost.id" />
								</s:url><a href="${urlPreviewBidpost}">打印预览</a></label></td>
						<td><label> <s:url var="urlPublishBidpost"
									value="BidPost!publishBidpost">
									<s:param name="bidpost.id" value="#bidpost.id" />
								</s:url> <a href="${urlPublishBidpost}">发布招标公告</a></label></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="client">
			<form id="form1" name="form1" method="post"
				action="BidPost!saveBidpost">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr class="hide">
						<td>公示id</td>
						<td><input type="text" name="bidpost.id"
							value="${bidpost.id}"></td>
					</tr>
					<tr>
						<td width="15%"><label for="text3">公告机构</label></td>
						<td width="18%"><span id="sprytextfield3"> <input
								name="bidpost.poster" type="text" id="text3" size="10"
								maxlength="10" value="${bidpost.posterName}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldMinCharsMsg">最少2字。</span><span
								class="textfieldMaxCharsMsg">最多10字。</span></span></td>
						<td width="15%"><label for="select">交易类型</label></td>
						<td width="18%"><select name="bidpost.bidType" id="select">
								<option value="01"
									<s:if test="bidpost.bidType=='01'||bidpost.bidType==''"> selected="selected"</s:if>>
									公开招标</option>
								<option value="02"
									<s:if test="bidpost.bidType=='02'"> selected="selected"</s:if>>拍卖</option>
								<option value="03"
									<s:if test="bidpost.bidType=='03'"> selected="selected"</s:if>>竞争性谈判</option>
						</select></td>
						<td width="15%">&nbsp;</td>
						<td>&nbsp;</td>

					</tr>
					<tr>
						<td><label for="textfield">土地面积</label></td>
						<td><input name="bidpost.landRgArea" type="text"
							id="textfield" size="10" maxlength="10" readonly="readonly"
							value="${bidpost.landRgArea}" /></td>
						<td><label for="textfield2">旱地面积</label></td>
						<td><input name="bidpost.drylandRgArea" type="text"
							id="textfield2" size="10" maxlength="10" readonly="readonly"
							value="${bidpost.drylandRgArea}" /></td>
						<td><label for="textfield3">水田面积</label></td>
						<td><input name="bidpost.paddyfieldRgArea" type="text"
							id="textfield2" size="10" maxlength="10" readonly="readonly"
							value="${bidpost.paddyfieldRgArea}" /></td>
					</tr>
					<tr>

						<td><label for="text7">旱地起价（元/亩）</label></td>
						<td><span id="sprytextfield7"> <input type="text"
								name="bidpost.drylandBaseprice" id="text7"
								value="${bidpost.drylandBaseprice}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldInvalidFormatMsg">请输入数字。</span><span
								class="textfieldMinValueMsg">单价要求大于0。</span></span></td>
						<td><label for="text71">水田起价（元/亩）</label></td>
						<td><span id="sprytextfield71"> <input type="text"
								name="bidpost.paddyfieldBaseprice" id="text71"
								value="${bidpost.paddyfieldBaseprice}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldInvalidFormatMsg">请输入数字。</span><span
								class="textfieldMinValueMsg">单价要求大于0。</span></span></td>
						<td><label for="text8">投标保证金（元）</label></td>
						<td><span id="sprytextfield8"> <input type="text"
								name="bidpost.deposit" id="text8" value="${bidpost.deposit}"
								disabled /> <span class="textfieldRequiredMsg">必填。</span><span
								class="textfieldInvalidFormatMsg">请输入数字。</span><span
								class="textfieldMinValueMsg">保证金要求大于0。</span></span></td>
					</tr>
					<tr>
						<td><label for="text1">报名起始日期</label></td>
						<td><span id="sprytextfield1"> <input
								name="bidpost.applyStartDate" type="text" id="text1" size="10"
								maxlength="10"
								<s:if test="#bidpost.applyStartDate!=null" > value=<s:date name="#bidpost.applyStartDate" format="yyyy-MM-dd" /> </s:if>
								onclick="HS_setDate(this)" /> <span
								class="textfieldRequiredMsg">必填。</span>
						</span></td>
						<td><label for="text2">报名结束日期</label></td>
						<td><span id="sprytextfield2"> <input
								name="bidpost.applyEndDate" type="text" id="text2" size="10"
								maxlength="10"
								<s:if test="#bidpost.applyStartDate!=null"> value=<s:date name="#bidpost.applyEndDate" format="yyyy-MM-dd" /> </s:if>
								onclick="HS_setDate(this)" /> <span
								class="textfieldRequiredMsg">必填。</span>
						</span></td>
						<td><label for="text9">开标时间</label></td>
						<td> <input type="text"
								name="bidpost.bidDate"  value="${bidpost.bidDate}"
								onClick="setDayHM(this);" /> </td>
<%-- 						<td><span id="sprytextfield9"> <input type="text" --%>
<%-- 								name="bidpost.bidDate" id="text9" value="${bidpost.bidDate}" --%>
<%-- 								onClick="HS_setDate(this)" /> <span --%>
<%-- 								class="textfieldRequiredMsg">必填。</span></span></td> --%>
					</tr>
					<tr>
						<td><label for="text4">联系人</label></td>
						<td><span id="sprytextfield4"> <input
								name="bidpost.picName" type="text" id="text4" size="10"
								maxlength="10" value="${bidpost.picName}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldMinCharsMsg">最少2字。</span><span
								class="textfieldMaxCharsMsg">最多10字。</span></span></td>
						<td><label for="text5">联系电话</label></td>
						<td><span id="sprytextfield5"> <input
								name="bidpost.picTel" type="text" id="text5" size="11"
								maxlength="11" value="${bidpost.picTel}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldMinCharsMsg">11位。</span><span
								class="textfieldMaxCharsMsg">11位。</span></span></td>
						<td><label for="text6">电子邮件</label></td>
						<td><span id="sprytextfield6"> <input
								name="bidpost.picEmail" type="text" id="text6" size="20"
								value="${bidpost.picEmail}" /> <span
								class="textfieldRequiredMsg">必填。</span><span
								class="textfieldInvalidFormatMsg">格式无效。</span><span
								class="textfieldMinCharsMsg">填写完整地址。</span><span
								class="textfieldMaxCharsMsg">最多45字符。</span></span></td>
					</tr>
					<tr>
						<td><label for="textarea1">联系地址</label></td>
						<td colspan="3"><span id="sprytextarea1"> <textarea
								name="bidpost.picAddress" id="textarea1" cols="20" rows="2"><s:property
										value="#bidpost.picAddress" /></textarea> <span id="countsprytextarea1">&nbsp;</span><span
								class="textareaRequiredMsg">必填。</span><span
								class="textareaMinCharsMsg">填写完整地址。</span></span></td>
						<td colspan="2"><input type="submit" value="保存"></td>
					</tr>
				</table>
			</form>
			<div id="tabletitle">
				<label>拟招标流转申请列表</label>
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
				<s:iterator var="bidpostDetail" value="#bidpostDetails" status="st">
					<s:if test="#st.odd">
						<tr style="background-color: lightgreen;">
					</s:if>
					<s:else>
						<tr style="background-color: white;">
					</s:else>
					<td><s:property value="#st.index+1" /></td>
					<td><s:property value="#bidpostDetail.applierName" /></td>
					<td><s:property value="#bidpostDetail.applierIdcode" /></td>
					<td><s:property value="#bidpostDetail.landRgArea" /></td>
					<td><s:property value="#bidpostDetail.paddyfieldRgArea" /></td>
					<td><s:property value="#bidpostDetail.drylandRgArea" /></td>
					<td><s:if test="#bidpostDetail.rightAuthType==1">权证：<s:property
								value="#bidpostDetail.landwarrantCode" />
						</s:if> <s:else>权证：<s:property
								value="#bidpostDetail.landcontractCode" />
						</s:else></td>
					<td><s:property value="#bidpostDetail.landAddress" /></td>
					<td><s:a action="BidPost!deleteBidpostDetail">删除
													<s:param name="bidpostDetail.id" value="#bidpostDetail.id" />
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
	<script type="text/javascript">
		var sprytextfield7 = new Spry.Widget.ValidationTextField(
				"sprytextfield7", "integer", {
					validateOn : [ "blur", "change" ],
					minValue : 1
				});
		var sprytextfield71 = new Spry.Widget.ValidationTextField(
				"sprytextfield71", "integer", {
					validateOn : [ "blur", "change" ],
					minValue : 1
				});
		var sprytextfield8 = new Spry.Widget.ValidationTextField(
				"sprytextfield8", "integer", {
					validateOn : [ "blur", "change" ],
					minValue : 1
				});
		var sprytextfield9 = new Spry.Widget.ValidationTextField(
				"sprytextfield9", "date", {
					format : "yyyy-mm-dd hh:mm:ss",
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
	</script>
</html>