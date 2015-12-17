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
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="navi"></div>
			<div id="client">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="150">&nbsp;</td>
						<td><span>电子招标竟标</span></td>
						<td colspan="4"><s:property value="#bidenroll.enrollNo" /></td>
					</tr>
					<tr>
					<td>&nbsp;</td>
					<td colspan="5"><span>投标人信息</span></td>
					</tr>
					<tr>
						<td><label for="bidder.userName">投标人姓名:</label></td>
						<td><s:property value="#bidder.userName" /></td>
						<td><label>投标人身份证号码:</label></td>
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
						<td><label>投标人住所:</label></td>
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
						<td colspan="5"><span>联系人信息</span></td>
					</tr>
					<tr>
						<td><label>联系人姓名:</label></td>
						<td><s:property value="#bidenroll.picName" /></td>
						<td><label>联系人身份证号码:</label></td>
						<td><s:property value="#bidenroll.picIdcode" /></td>
						<td><label>联系人电话:</label></td>
						<td><s:property value="#bidenroll.picTel" /></td>
					</tr>
					<tr>
						<td><label>电子邮件:</label></td>
						<td><s:property value="#bidenroll.picEmail" /></td>
						<td><label>通讯地址:</label></td>
						<td colspan="3"><s:property value="#bidenroll.picAddress" />
						</td>
					<tr>
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
</body>
</html>