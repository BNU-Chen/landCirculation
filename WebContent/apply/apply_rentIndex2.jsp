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
							<label>流转申请列审核</label>
						</div>
						<div id="navi">
							<table border="0" cellspacing="0" cellpadding="0" align="left">
								<tr>
									<td><a href="../apply/Apply!newApply"><span>新建协议出租申请</span></a></td>
								</tr>
							</table>

						</div>
						<div id="client">
							<table width="95%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<th width="4%">序号</th>
									<th width="8%">建立日期</th>
									<th width="11%">申请人姓名</th>
									<th width="15%">申请人身份证号码</th>
									<th width="8%">处理进程</th>
									<th width="12%">状态</th>
									<th width="14%">操作</th>
									<th width="24%">最新反馈</th>
								</tr>
								<s:iterator var="Apply" value="#Applys" status="st">
									<s:if test="#st.odd">
										<tr style="background-color: lightgreen;">
									</s:if>
									<s:else>
										<tr style="background-color: white;">
									</s:else>
									<td><s:property value="#st.index+1" /></td>
									<td><s:date name="#Apply.applyDate" format="yyyy-MM-dd" /></td>
									<td><s:property value="#Apply.picName" /></td>
									<td><s:property value="#Apply.picIdcode" /></td>
									<td><s:property value="#Apply.stepdef.stepName" /></td>
									<td><s:property value="#Apply.statusdef.statusDesc" /></td>
									<td><s:if test="#Apply.stepdef.id==1">
											<s:a action="Apply!updateApply">修改
													<s:param name="apply.id" value="#Apply.id" />
											</s:a>
											<s:a action="Apply!deleteApply">删除
													<s:param name="apply.id" value="#Apply.id" />
											</s:a>
										</s:if></td>
									<td><s:property value="#Apply.rtnmsgdef.msgText" /></td>
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
				</td>
			</tr>
		</table>
	</div>
</body>
</html>