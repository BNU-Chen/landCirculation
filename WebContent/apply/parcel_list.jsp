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
		<table width="99%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2" ><span>拟转让地块详细信息</span></td>
				<td colspan="9" ></td>
			</tr>
			<tr>
				<td colspan="11">流转地块数量：<s:property value="#Apply.landNumber" />块,登记总面积：<s:property
						value="#Apply.landRgArea" />亩，其中：田<s:property
						value="#Apply.paddyfieldRgArea" />亩，地<s:property
						value="#Apply.drylandRgArea" />亩；实际总面积：<s:property
						value="#Apply.landRealArea" />亩，其中：田<s:property
						value="#Apply.paddyfieldRealArea" />亩，地<s:property
						value="#Apply.drylandRealArea" />亩。
				</td>
			</tr>
			<tr>
				<th rowspan="2">序号</th>
				<th rowspan="2">地块名称<br /> （地块编号）
				</th>
				<th rowspan="2">土地类型<br />（田/地）
				</th>
				<th rowspan="2">合同面积<br /> (亩)
				</th>
				<th rowspan="2">实际面积<br /> (亩)
				</th>
				<th rowspan="2">是否<br /> 基本农田
				</th>
				<th colspan="4">四至界限</th>
				<th rowspan="2">操作</th>
			</tr>
			<tr>
				<th width="100">东</th>
				<th width="100">南</th>
				<th width="100">西</th>
				<th width="100">北</th>
			</tr>
			<s:iterator var="parcel" value="parcels" status="st">
				<s:if test="#st.odd">
					<tr style="background-color: lightgreen;">
				</s:if>
				<s:else>
					<tr style="background-color: white;">
				</s:else>
				<td><s:property value="#st.index+1" /></td>
				<td><s:property value="#parcel.parcelCode" /></td>
				<td><s:if test="#parcel.type==1">田</s:if> <s:if
						test="#parcel.type==2">地</s:if></td>
				<td><s:property value="#parcel.rgArea" /></td>
				<td><s:property value="#parcel.realArea" /></td>
				<td><s:if test="#parcel.basicFarmland==1">高标准基本农田</s:if> <s:if
						test="#parcel.basicFarmland==2">基本农田</s:if> <s:if
						test="#parcel.basicFarmland==3">非基本农田</s:if></td>
				<td><s:property value="#parcel.east" /></td>
				<td><s:property value="#parcel.south" /></td>
				<td><s:property value="#parcel.west" /></td>
				<td><s:property value="#parcel.north" /></td>
				<td><s:url action="Parcel!deleteParcel" var="urlDel">
						<s:param name="parcel.id" value="#parcel.id" />
					</s:url> <sx:a href="%{urlDel}" targets="ParcelInfo">删除		
					</sx:a> <s:url action="Parcel!updateParcel" var="urlUpdate">
						<s:param name="parcel.id" value="#parcel.id" />
					</s:url> <sx:a href="%{urlUpdate}" targets="ParcelInfo"
						executeScripts="true">编辑
					</sx:a>
					  <!--<form action="Parcel!updateParcel" method="post">
					<input type="hidden" name="parcel.id" value="${parcel.id}">
					<sx:submit type="button"  label="编辑" targets="ParcelInfo" executeScripts="true"/>
					</form>--></td>
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
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
</body>
</html>
