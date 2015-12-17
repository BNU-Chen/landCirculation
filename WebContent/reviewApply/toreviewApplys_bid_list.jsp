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
#wrap {
	margin: 0px auto;
	width: 100%;
}

#navi {
	margin: 10px 10px;
	height: 30px;
}
</style>
</head>
<body onload="resizeWin();submitForm();">
	<div id="webClient">
		<table width="100%" height="100%" align="left">
			<tr>
				<td height="389">
					<div id="wrap">

						<div id="title">
							<label>委托交易流转申请-待审核列表</label>
						</div>
						<div id="client">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<th width="10">序号</th>
									<th width="80">建立日期</th>
									<th width="81">申请人姓名</th>
									<th width="100">申请人身份证号码</th>
									<th width="65">流转类型</th>
									<th width="65">交易类型</th>
									<th width="65">处理进程</th>
									<th width="100">状态</th>
									<th width="150">操作</th>
									<th>最新反馈</th>
								</tr>
								<s:iterator var="apply" value="#applys" status="st">
									<s:if test="#st.odd">
										<tr style="background-color: lightgreen;">
									</s:if>
									<s:else>
										<tr style="background-color: white;">
									</s:else>
									<td><s:property value="#st.index+1" /></td>
									<td><s:date name="#apply.id.applyDate" format="yyyy-MM-dd" /></td>
									<td><s:property value="#apply.id.applierUserName" /></td>
									<td><s:property value="#apply.id.applierIdcode" /></td>
									<td><s:property value="#apply.id.circulationTypeName" /></td>
									<td><s:property value="#apply.id.transferTypeName" /></td>
									<td><s:property value="#apply.id.stepName" /></td>
									<td><s:property value="#apply.id.statusDesc" /></td>
									<td><s:a action="ReviewApply!viewApply">审核
													<s:param name="apply.id" value="#apply.id.id" />
										</s:a>
									<td><s:property value="#apply.id.msgText" /></td>
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
								</tr>
							</table>

						</div>


					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>