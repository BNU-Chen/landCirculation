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
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
<body onload="resizeWin();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>流转申请公示--已发布流转公示</label>
			</div>

			<div id="client">
				<div id="tabletitle">
					<label>已发布流转申请公示</label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="4%">序号</th>
						<th width="10%">发布日期</th>
						<th width="15%">发布机构</th>
						<th width="10%">公示起始日期</th>
						<th width="10%">公示结束日期</th>
						<th width="10%">反馈联系人</th>
						<th width="15%">反馈联系电话</th>
						<th >操作</th>
					</tr>
					<s:iterator var="postedPostApply" value="#postedPostApplys"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:date name="#postedPostApply.publishDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#postedPostApply.poster" /></td>
						<td><s:date name="#postedPostApply.startDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#postedPostApply.endDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#postedPostApply.responsePicname" /></td>
						<td><s:property value="#postedPostApply.responseTel" /></td>
						<td><s:a action="PostApply!previewPostApply">打印公示
													<s:param name="postApply.id" value="#postedPostApply.id" />
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
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>