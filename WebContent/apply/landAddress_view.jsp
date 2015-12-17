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
</head>

<body>
	<div id="dlg">
		<div id="dlgClient">
			<iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
		</div>
		<div id="dlgOperation">
			<div id="dlgUploadPhoto">
				<input type="button" value="提   交" onclick="photoUploaded()" />
			</div>
			<div id="dlgUploadIDCard">
				<input type="button" value="提   交" onclick="idcardUploaded()" />
			</div>
		</div>
	</div>
	<div id="webClient">
		<div id="wrap">
			<form id="form4" name="form4" method="post"
				action="Apply!updateLandAddress">
				<table border="0" cellpadding="0" cellspacing="0" width="99%">

					<tr class="hide">
						<td>申请系统编号</td>
						<td><input name="apply.id" type="text" value="${Apply.id}" /></td>
					<tr>
						<td rowspan="2" width="100">流转土地坐落</td>
						<td width="100"><label>地址：</label></td>
						<td><s:property value="#Apply.landAddress" /> <!-- 
							
							<td ><span id="sprytextfield28"> <input
									name="apply.landProvince" type="text" id="text21" size="10"
									value="${Apply.landProvince}" /></span> 省（自治区、直辖市）<span
								id="sprytextfield22"> <input name="apply.landCity"
									type="text" id="text27" size="10" value="${Apply.landCity}" />
							</span>市（地区、自治州、盟）</td>-->
					</tr>
					<tr>
						<td><label>行政区划编码</label></td>
						<td><s:property value="#Apply.landVillage" /></td>

						<!-- 
							<td ><span id="sprytextfield29"> <input
									name="apply.landCounty" type="text" id="text28" size="10"
									value="${Apply.landCounty}" />
							</span>县（区、旗）<span id="sprytextfield30"> <input
									name="apply.landTown" type="text" id="text29" size="10"
									value="${Apply.landTown}" />
							</span>乡（镇、街道）<span id="sprytextfield31"> <input
									name="apply.landVillage" type="text" id="text30" size="10"
									value="${Apply.landVillage}" />
							</span>村（居委会）</td>-->
					</tr>
					<tr>
						<td colspan="2"><sx:submit type="submit" 
								value="修改流转土地座落情况" targets="divLandAddress"
								executeScripts="true" /> <!--<input type="submit"
							value="修改流转土地座落情况"  />--></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
