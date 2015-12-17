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
					<label>正公示流转申请列表--公示编号：<s:property value="postApply.idcode" /></label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="36">序号</th>
						<th width="90">申请人姓名</th>
						<th width="138">申请人身份证号码</th>
						<th width="80">总面积</th>
						<th width="80">田面积</th>
						<th width="80">地面积</th>
						<th width="201">权属证明</th>
						<th width="225">土地地址</th>
						<th width=>操作</th>
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
						<td><s:if test="#postdetailApply.rightAuthType==1">权证：<s:property
									value="#postdetailApply.landwarrantCode" />
							</s:if> <s:else>权证：<s:property
									value="#postdetailApply.landcontractCode" />
							</s:else></td>
						<td><s:property value="#postdetailApply.landAddress" /></td>
						<td><s:a action="ApplypostResponse!addApplypostResponseRecorde">添加反馈意见
													<s:param name="postdetailApply.id"
									value="#postdetailApply.id" />
								<%-- <s:param name="postApply.id" value="posApply.id" /> --%>
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
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>