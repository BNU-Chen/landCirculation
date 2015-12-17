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
<script src="../common/calendar.js" type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" cellspacing="0" cellpadding="0"
						align="center" width="100%">
						<tr>
							<td><span><b>一、流转合同中关于流转收益支付的约定</b></span></td>
						</tr>
					</table>
				</div>
				<table border="0" cellspacing="0" cellpadding="0" width="100%">
					<tr>
						<td class="alignright">&nbsp;</td>
						<td colspan="5"><span class="aligncenter"><b>基本信息</b></span></td>
					</tr>
					<tr>
						<td class="alignright"><b>流转合同编号</b></td>
						<td><s:property value="#contractfilling.contractNo" /></td>
						<td class="alignright"><b>流转起始日期</b></td>
						<td><s:date name="#contractfilling.fromDate"
								format="yyyy-MM-dd" /></td>
						<td class="alignright"><b>流转结束日期</b></td>
						<td><s:date name="#contractfilling.toDate"
								format="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td class="alignright"><b>转出方名称</b></td>
						<td colspan="2"><s:property
								value="#contractfilling.transferName" /></td>
						<td class="alignright"><b>转出方证件号码</b></td>
						<td colspan="2" class="alignright"><s:property
								value="#contractfilling.transferIdcode" /></td>
					</tr>
					<tr>
						<td width="17%" class="alignright"><b>转入方名称</b></td>
						<td colspan="2"><s:property
								value="#contractfilling.transfeeName" /></td>
						<td width="17%" class="alignright"><b>转入方证件号码</b></td>
						<td colspan="2" class="alignright"><s:property
								value="#contractfilling.transfeeIdcode" /></td>
					</tr>
					<tr>
						<td class="alignright"><b>土地位置</b></td>
						<td colspan="5"><s:property
								value="#contractfilling.landAddressName" /></td>
					</tr>
					<tr>
						<td class="alignright"><b>土地总面积（亩）</b></td>
						<td width="17%"><s:property value="#contractfilling.landArea" /></td>
						<td width="17%" class="alignright"><b>水田（亩）</b></td>
						<td><s:property value="#contractfilling.paddyfieldArea" /></td>
						<td class="alignright"><b>旱地（亩）</b></td>
						<td><s:property value="#contractfilling.drylandArea" /></td>
					</tr>
					<tr>
						<td class="alignright">&nbsp;</td>
						<td colspan="5"><span class="aligncenter"><b>对价信息</b></span></td>
					</tr>
					<tr>
						<td class="alignright"><b>支付方式</b></td>
						<td><s:if test="#contractfilling.payType==1">现金支付</s:if> <s:if
								test="#contractfilling.payType==2">实物支付</s:if> <s:if
								test="#contractfilling.payType==3">其它</s:if></td>
						<td class="alignright"><b>支付时间</b></td>
						<td><s:date name="#contractfilling.payDate"
								format="yyyy-MM-dd" /></td>
						<td class="alignright">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<s:if test="#contractfilling.payType==1">
						<tr>
							<td class="alignright"><b>水田单价(元/亩)</b></td>
							<td><s:property value="#contractfilling.payType11" /></td>
							<td class="alignright"><b>旱地单价(元/亩)</b></td>
							<td><s:property value="#contractfilling.payType12" /></td>
							<td class="alignright"><b>年增长率（%）</b></td>
							<td><s:property value="#contractfilling.payType14" /></td>
						</tr>
						<tr>
							<td class="alignright"><b>基准年额度（水田）</b></td>
							<td>--</td>
							<td class="alignright"><b>基准年额度（旱地）</b></td>
							<td>--</td>
							<td class="alignright"><b>基准年额度合计(元)</b></td>
							<td><s:property value="#contractfilling.payType13" /></td>
						</tr>
					</s:if>
					<s:else>
						<tr>
							<td class="alignright"><b>水田单价(斤/亩)</b></td>
							<td><s:property value="#contractfilling.payType21" /> <s:property
									value="#contractfilling.payType22Name" /></td>
							<td class="alignright"><b>旱地单价(斤/亩)</b></td>
							<td><s:property value="#contractfilling.payType24" /> <s:property
									value="#contractfilling.payType25Name" /></td>
							<td class="alignright"><b>年增长率（%）</b></td>
							<td><s:property value="#contractfilling.payType27" /></td>
						</tr>
						<tr>
							<td class="alignright"><b>基准年额度（水田）</b></td>
							<td><s:property value="#contractfilling.payType22Name" /> <s:property
									value="#contractfilling.payType23" />斤</td>
							<td class="alignright"><b>基准年额度（旱地）</b></td>
							<td><s:property value="#contractfilling.payType25Name" /> <s:property
									value="#contractfilling.payType26" />斤</td>
							<td class="alignright"><b>基准年额度合计</b></td>
							<td>--</td>
						</tr>
					</s:else>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
