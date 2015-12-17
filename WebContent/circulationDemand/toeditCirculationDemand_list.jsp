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
</style>
</head>
<body onload="resizeWin();submitForm();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>土地流转转入需求登记</label>
			</div>
			<div id="navi">
				<table class="navitable" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<div id="naviItem">
								<a
									href="../circulationDemand/CirculationDemand!newCirculationDemand">新建【空白】转入需求
								</a>
							</div>
							<div id="naviItem">
								<a
									href="../circulationDemand/CirculationDemand!listtoSubmitCirculationDemand"><b>查看【待提交】</b>转入需求
								</a>
							</div>
							<div id="naviItem">
								<a
									href="../circulationDemand/CirculationDemand!listSubmitedCirculationDemand"><b>查看【已提交】</b>转入需求
								</a>
							</div>
							<div id="naviItem">
								<a
									href="../circulationDemand/CirculationDemand!listAllCirculationDemand">查看<b>【全部】</b>转入需求
								</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="client">
				<div id="tabletitle">
					<label>我的待提交转入需求列表</label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="20">序号</th>
						<th width="80">建立日期</th>
						<th width="160">意向位置</th>
						<th width="90">土地类型</th>
						<th width="80">意向面积（亩）</th>
						<th width="80">意向价格（元/亩）</th>
						<th width="40">流转形式</th>
						<th width="80">流转期限（年）</th>
						<th width="160">流转后用途</th>
						<th width="80">操作</th>
						<th>最新反馈</th>
					</tr>
					<s:iterator var="circulationDemand" value="#circulationDemands"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:date name="#circulationDemand.setupDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#circulationDemand.landAddress" /></td>
						<td><s:property value="#circulationDemand.landTypeName" /></td>
						<td><s:property value="#circulationDemand.landArea" /></td>
						<td><s:property value="#circulationDemand.landPrice" /></td>
						<td><s:property
								value="#circulationDemand.circulationTypeName" /></td>
						<td><s:property value="#circulationDemand.landDuration" /></td>
						<td><s:property value="#circulationDemand.landUseType" /></td>
						<td><s:if
								test="#circulationDemand.currentStatusCode=='01' or #circulationDemand.currentStatusCode==null">
								<s:a action="CirculationDemand!modifyCirculationDemand">修改&nbsp;
													<s:param name="circulationDemand.id"
										value="#circulationDemand.id" />
								</s:a>
							</s:if> <s:a action="CirculationDemand!deleteCirculationDemand">删除
													<s:param name="circulationDemand.id"
									value="#circulationDemand.id" />
							</s:a>
						<td><s:property value="#circulationDemand.currentReturnMsg" /></td>
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
		</div>
	</div>
</body>
</html>