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
			<div id="contact">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="151">&nbsp;</td>
						<td width="217"><span>申请人（承包人）信息</span></td>
						<td width="150">&nbsp;</td>
						<td width="220">&nbsp;</td>
					</tr>
					<tr>
						<td><label for="userPerson.userId">身份证号码:</label></td>
						<td><s:property value="#applier.userIdcode" /></td>
						<td><label for="user.userName">用户姓名:</label></td>
						<td><s:property value="#applier.userName" /></td>
					</tr>
					<tr>
						<td><label>申请人联系电话:</label></td>
						<td><s:property value="#applier.mobilephone" /></td>
						<td><label>电子邮件:</label></td>
						<td><s:property value="#applier.email" /></td>
					</tr>
					<tr>
						<td><label>申请人住所:</label></td>
						<td colspan="3"><s:property
								value="#applier.province" /><span>[省（自治区、直辖市）]</span>
							<s:property value="#applier.city" /> <span>[市（地区、州、盟）]</span>
							<s:property value="#applier.county" /><span>[县（区、市、旗）]</span></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><s:property value="#applier.town" />
							<span>[乡（镇、街道）]</span> <s:property
								value="#applier.village" /> <span>[村（居委会）]</span> <s:property
								value="#applier.team" /><span>[村民小组（队、社）]</span></td>
					</tr>
					<tr>
						<td><label>通讯地址:</label></td>
						<td colspan="3"><s:property
								value="#applier.ContactAddress" /></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td><span>联系人信息</span></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><label>联系人姓名:</label></td>
						<td><s:property value="#Apply.picName" /></td>
						<td><label>联系人身份证号码:</label></td>
						<td><s:property value="#Apply.picIdcode" /></td>
					</tr>
					<tr>
						<td><label>联系电话:</label></td>
						<td><s:property value="#Apply.picTel" /></td>
						<td><label>电子邮件:</label></td>
						<td><s:property value="#Apply.picEmail" /></td>
					</tr>
					<tr>
						<td><label>通讯地址:</label></td>
						<td colspan="3"><s:property value="#Apply.picAddress" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="3"><s:url action="Apply!modifyApplierInfo"
								var="urlModifyApplier">
								<s:param name="apply.id" value="#Apply.id" />
							</s:url>
							<s:a href="%{urlModifyApplier}">
								<label class="btnLabel">修改联系人信息</label>
							</s:a></td>
					</tr>
					<tr>
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