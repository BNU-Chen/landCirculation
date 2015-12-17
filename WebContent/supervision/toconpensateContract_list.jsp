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
							<label>流转补偿监管-补偿备案-待申报流转合同列表</label>
						</div>
						<div id="client">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<th width="10">序号</th>
									<th width="80">合同编号</th>
									<th width="200">土地地址</th>
									<th width="80">土地面积（亩）</th>
									<th width="81">转出人姓名</th>
									<th width="128">转出人身份证号码</th>
									<th width="80">操作</th>
									<th width="150">状态</th>
									<th>最新反馈</th>
								</tr>
								<s:iterator var="contractfilling"
									value="#passedContractfillings" status="st">
									<s:if test="#st.odd">
										<tr style="background-color: lightgreen;">
									</s:if>
									<s:else>
										<tr style="background-color: white;">
									</s:else>
									<td><s:property value="#st.index+1" /></td>
									<td><s:property value="#contractfilling.contractNo" /></td>
									<td><s:property value="#contractfilling.landAddressName" /></td>
									<td><s:property value="#contractfilling.landArea" /></td>
									<td><s:property value="#contractfilling.transferName" /></td>
									<td><s:property value="#contractfilling.transferIdcode" /></td>
									<td><s:a action="Conpensation!modifyConpensationRecord">补偿备案
													<s:param name="conpensationRecord.contractNo"
												value="#contractfilling.contractNo" />
										</s:a>
									<td><s:property value="#contractfilling.statusDesc" /></td>
									<td><s:property value="#contractfilling.msgText" /></td>
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
				</td>
			</tr>
		</table>
	</div>
</body>
</html>