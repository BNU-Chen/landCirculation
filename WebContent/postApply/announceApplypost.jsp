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
				<label>流转申请反馈</label>
			</div>

			<div id="client">
				<div id="tabletitle">
					<label>流转申请公示--公示结果公告 </label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="36">序号</th>
						<th width="90">申请人</th>
						<th width="138">身份证号码</th>
						<th width="80">总面积</th>
						<th width="80">田面积</th>
						<th width="80">地面积</th>
						<th width="225">土地地址</th>
						<th width="80">反馈意见</th>
						<th width="80">妥善处理</th>
						<th width="80">仍有异议</th>
						<th width="80">尚未处理</th>
						<th width="100">公示结论</th>
					</tr>
					<s:iterator var="postdetailApply" value="#postdetailApplys"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:property value="#postdetailApply.applierName" /></td>
						<td><s:property value="#postdetailApply.applierIdcode" /></td>
						<td><s:property value="#postdetailApply.landRgArea" /></td>
						<td><s:property value="#postdetailApply.paddyfeildRgArea" /></td>
						<td><s:property value="#postdetailApply.drylandRgArea" /></td>
						<td><s:property value="#postdetailApply.landAddress" /></td>
						<td><s:property value="#postdetailApply.responseNumber" /></td>
						<td><s:property value="#postdetailApply.propertreatNumber" /></td>
						<td><s:property value="#postdetailApply.objectionNumber" /></td>
						<td><s:property value="#postdetailApply.nottreatNumber" /></td>
						<td><s:if test="#postdetailApply.resultCode=='01'">公示通过 </s:if>
							<s:else>公示未通过</s:else></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
</body>
</html>