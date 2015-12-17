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
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td><span><b>封面：合同当事人信息</b></span></td>
						</tr>
					</table>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="151">&nbsp;</td>
						<td width="217"><span><b>甲方（出租方）</b></span></td>
						<td width="150">&nbsp;</td>
						<td width="220">&nbsp;</td>
					</tr>
					<tr>
						<td><label for="user.userName"><b>姓名:</b></label></td>
						<td><s:property value="#contractBase.transferName" /></td>
						<td><label for="userPerson.userId"><b>身份证号码:</b></label></td>
						<td><s:property value="#contractBase.transferIdcode" /></td>

					</tr>
					<tr>
						<td><label><b>联系电话:</b></label></td>
						<td><s:property value="#contractBase.transferTel" /></td>
						<td><label><b>通讯地址:</b></label></td>
						<td colspan="3"><s:property
								value="#contractBase.transferAddress" /></td>
					</tr>
					<tr>
						<td><label for="user.userName"><b>联系人姓名:</b></label></td>
						<td><s:property value="#contractBase.transferPicName" /></td>
						<td><label for="userPerson.userId"><b>联系人身份证号码:</b></label></td>
						<td><s:property value="#contractBase.transferPicIdcode" /></td>

					</tr>
					<tr>
						<td><label><b>联系人电话:</b></label></td>
						<td><s:property value="#contractBase.transferPicTel" /></td>
						<td><label><b>联系人通讯地址:</b></label></td>
						<td colspan="3"><s:property
								value="#contractBase.transferPicAddress" /></td>
					</tr>
					<tr>
						<td width="151">&nbsp;</td>
						<td width="217"><span><b>乙方（承租方）</b></span></td>
						<td width="150">&nbsp;</td>
						<td width="220">&nbsp;</td>
					</tr>
					<tr>
						<td><label for="user.userName"><b>姓名:</b></label></td>
						<td><s:property value="#contractBase.transfName" /></td>
						<td><label for="userPerson.userId"><b>身份证号码:</b></label></td>
						<td><s:property value="#contractBase.transfeeIdcode" /></td>

					</tr>
					<tr>
						<td><label><b>联系电话:</b></label></td>
						<td><s:property value="#contractBase.transfeeTel" /></td>
						<td><label><b>通讯地址:</b></label></td>
						<td colspan="3"><s:property
								value="#contractBase.transfeeAddress" /></td>
					</tr>
					<tr>
						<td><label for="user.userName"><b>联系人姓名:</b></label></td>
						<td><s:property value="#contractBase.transfName" /></td>
						<td><label for="userPerson.userId"><b>联系人身份证号码:</b></label></td>
						<td><s:property value="#contractBase.transfeeIdcode" /></td>

					</tr>
					<tr>
						<td><label><b>联系人电话:</b></label></td>
						<td><s:property value="#contractBase.transfeeTel" /></td>
						<td><label><b>联系人通讯地址:</b></label></td>
						<td colspan="3"><s:property
								value="#contractBase.transfeeAddress" /></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>