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
<title>农村土地承包经营权流转管理系统</title>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<style type="text/css">
#dlgUploadIDCard {
	display: none;
}

#dlgUploadPhoto {
	display: none;
}

#adress {
	font-size: 14px;
	width: 400px;
}

#client div {<!--
	display: none;
	-->
}
</style>
</head>
<body>
	<div id="dlg">
		<div id="dlgClient">
			<iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
		</div>
		<div id="dlgOperation">

			<div id="dlgAddParcel">
				<input type="button" value="提   交" onclick="parcelAdded()" />
			</div>
			<div id="dlgUploadIDCard">
				<input type="button" value="提   交" onclick="idcardUploaded()" />
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="title">
			<label>协议出租流转申请</label>
		</div>
		<div id="toolbar">
			<table align="right">
				<tr>
					<td><label>预 览</label></td>
					<td><label>提交申请</label></td>
				</tr>
			</table>
		</div>

		<div id="client">
			<div id="contact">
				<table border="0" cellpadding="0" cellspacing="0" width="98%">
					<tr>
						<td width="200">&nbsp;</td>
						<td><span>申请人（承包人）信息</span></td>
					</tr>
					<tr>
						<td><input type="text" name="test" value="${bb.applierName}"></td>
						<td></td>
					</tr>

					<tr>
						<td><label for="userPerson.Id">系统编号<s:property
									value="#Apply.userPerson.userId" /></label></td>
						<td><input type=text value="${Apply.applierName}" /></td>
					</tr>
					<tr>
						<td><label for="userPerson.userId">身份证号码</label></td>
						<td><input type="text" id="userPerson.userId" size="18"
							disabled="disabled" value="${Apply.applierIdCode}" /><input
							name="userPerson.userId" type="hidden"
							value="${userPerson.userId}" /></td>
					</tr>
					<tr>
						<td><label for="user.userName">用户姓名</label></td>
						<td><input type="text" id="userPerson.userName" size="20"
							disabled="disabled" value="${bb.userPerson.userName}" /><input
							name="userPerson.userName" type="hidden"
							value="${Apply.userPerson.userName}" /></td>
					</tr>
					<tr>
						<td><label>申请人住所</label></td>
						<td><input name="textfield" type="text" id="textfield"
							readonly="readonly" value="${bb.userPerson.address}" /></td>
					</tr>
					<tr>
						<td><label>申请人联系电话</label></td>
						<td><input type="text" name="textfield2" id="textfield2"
							value="${bb.userPerson.mobilephone}" /></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="button" id="btnSubmit1" value="保存" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
