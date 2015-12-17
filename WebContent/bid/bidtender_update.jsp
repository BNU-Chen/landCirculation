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
<style type="text/css">
</style>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css">
<script src="../common/general.js" type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="160"><label>报名编号</label></td>

						<td colspan="5"><s:property value="#bidenroll.enrollNo" /></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td colspan="5"><span>竞标人信息</span></td>
					</tr>
					<tr>
						<td><label for="bidder.userName">投标人姓名:</label></td>
						<td><s:property value="#bidder.userName" /></td>
						<td><label>身份证号码:</label></td>
						<td><s:property value="#bidder.userIdcode" /></td>
						<td><label>投标人联系电话:</label></td>
						<td><s:property value="#bidder.mobilephone" /></td>
					</tr>
					<tr>
						<td><label>电子邮件:</label></td>
						<td><s:property value="#bidder.email" /></td>
						<td><label>通讯地址:</label></td>
						<td colspan="3"><s:property value="#bidder.ContactAddress" /></td>
					</tr>
					<tr>
						<td><label>竞标人住所:</label></td>
						<td colspan="5"><s:property value="#bidder.province" /><span>[省（自治区、直辖市）]</span>
							<s:property value="#bidder.city" /> <span>[市（地区、州、盟）]</span> <s:property
								value="#bidder.county" /><span>[县（区、市、旗）]</span></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="5"><s:property value="#bidder.town" /> <span>[乡（镇、街道）]</span>
							<s:property value="#bidder.village" /> <span>[村（居委会）]</span> <s:property
								value="#bidder.team" /><span>[村民小组（队、社）]</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><span>竞标人联系人信息</span></td>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td><label>联系人姓名:</label></td>
						<td><s:property value="#bidenroll.picName" /></td>
						<td><label>联系人身份证号码:</label></td>
						<td><s:property value="#bidenroll.picIdcode" /></td>
						<td><label>联系电话:</label></td>
						<td><s:property value="#bidenroll.picTel" /></td>
					</tr>
					<tr>
						<td><label>电子邮件:</label></td>
						<td><s:property value="#bidenroll.picEmail" /></td>
						<td><label>通讯地址:</label></td>
						<td colspan="3"><s:property value="#bidenroll.picAddress" />
						</td>
					</tr>

					<tr>
						<td colspan="6"><form name="form1" method="post"
								action="BidTender!saveBidtender">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr class="hide">
										<td><input type="text" name="bidtender.id"
											value="${bidtender.id}"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td colspan="2"><span>开标一览表</span></td>
										<td colspan="3"><input type="submit" value=" 保存开标一览表  "></td>
									</tr>
									<tr>
										<td width="159"><label for="text1">旱地单价（元/亩年）</label></td>
										<td width="320"><span id="sprytextfield1"> <input
												name="bidtender.drylandprice" type="text" id="text1"
												size="7" maxlength="7" value="${bidtender.drylandprice}">
												<span class="textfieldMaxCharsMsg">最多7位数字</span><span
												class="textfieldMinValueMsg">最低价格0元。</span><span
												class="textfieldRequiredMsg">必填。</span></span></td>
										<td width="160"><label for="text2">水田单价（元/亩年）</label></td>
										<td><span id="sprytextfield2"> <input
												name="bidtender.paddyfieldprice" type="text" id="text2"
												size="7" maxlength="7" value="${bidtender.paddyfieldprice}">
												<span class="textfieldRequiredMsg">必填。</span><span
												class="textfieldMaxCharsMsg">最多7位数字。</span><span
												class="textfieldMinValueMsg">最低价格0元。</span></span></td>
									</tr>
									<tr>
										<td><label for="text3">总价（元/年）</label></td>
										<td><span id="sprytextfield3"> <input
												name="bidtender.totalprice" type="text" disabled id="text3"
												size="7" maxlength="7" value="${bidtender.totalprice}">
												<span class="textfieldRequiredMsg">必填。</span><span
												class="textfieldMaxCharsMsg">最多7位数字。</span><span
												class="textfieldMinValueMsg">最低单价0元。</span><span
												class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
										<td><label for="text4">年递增率（%）</label></td>
										<td><span id="sprytextfield4"> <input
												name="bidtender.increaserate" type="text" id="text4"
												size="2" maxlength="2" value="${bidtender.increaserate}">
												<span class="textfieldRequiredMsg">必填。</span><span
												class="textfieldMinValueMsg">最低递增率0。</span><span
												class="textfieldMaxCharsMsg">最多两位数字。</span></span></td>
									</tr>

								</table>
							</form></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td><span>竞标文件</span></td>
						<td colspan="4"><s:property
								value="#bidtender.tenderFilePathname" /></td>
					</tr>

					<tr>
						<td><label>上传竞标书电子版</label></td>

						<td colspan="2"><form action="BidtenderdocUpload"
								enctype="multipart/form-data" method="post">
								<input type="file" id="fileField2" name="bidtenderdoc" /><input
									type="hidden" id="fileField1" name="bidtender.id"
									value="${bidtender.id}" /><input type="submit" value="上传" />
							</form></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td width="160">&nbsp;</td>
						<td width="160">&nbsp;</td>
						<td width="160">&nbsp;</td>
						<td width="160">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="2"><s:url action="BidTender!submitBidtender"
								var="urlsubmitBidtender">
								<s:param name="bidtender.id" value="#bidtender.id" />
							</s:url> <s:a href="%{urlsubmitBidtender}">
								<label class="btnLabel">提交竞标书</label>
							</s:a></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "integer", {
					validateOn : [ "blur", "change" ],
					maxChars : 7,
					minValue : 0,
					useCharacterMasking : true
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "integer", {
					validateOn : [ "blur", "change" ],
					maxChars : 7,
					useCharacterMasking : true,
					minValue : 0
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "currency", {
					minValue : 7,
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					maxChars : 2,
					minValue : 0
				});
	</script>
	</ body>
</html>