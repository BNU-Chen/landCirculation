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
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<table class="rightContract" width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td colspan="2"><span>已上传文件列表</span></td>
						<td></td>

					</tr>
					<tr>
						<th width="60">序号</th>
						<th width="130">预览图</th>
						<th width="100">页次</th>
						
						<th >操作</th>
					</tr>
					<s:iterator var="landcontractimg" value="landcontractimgs"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td align="center"><s:property value="#st.index+1" /></td>
						<td><img src="${landcontractimg.landcontractimgPathFilename}" width="120" height="180"/></td>
						<td><s:property value="#landcontractimg.pgno"/></td>
						<td><s:url action="LandcontractImgUpload!deleteContractImg"
								var="urlDel">
								<s:param name="apply.id" value="#Apply.id" />
								<s:param name="landcontractimg.id" value="#landcontractimg.id" />
							</s:url> <sx:a href="%{urlDel}" targets="landConractImglist">删除
		
					</sx:a> <s:url action="LandcontractImgUpload!previewContractImg" var="urlPreview">
								<s:param name="apply.id" value="#Apply.id" />
								<s:param name="landcontractimg.id" value="#landcontractimg.id" />
							</s:url> <s:a href="%{urlPreview}" target="_blank">查看
		
					</s:a></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
</body>
</html>