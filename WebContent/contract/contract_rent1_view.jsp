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
<style type="text/css">
</style>
<sx:head />
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td width="160"><span><b>一、标的基本情况及用途</b></span></td>
						</tr>
					</table>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30" width="100"><b>土地权利证明</b></td>
						<s:if test="#contractBase.rightAuthType==1">
							<td colspan="3" width="100">承包经营权证</td>
						</s:if>
						<s:else>
							<td width="100">承包经营合同</td>
						</s:else>
						<td width="100"><b>编号</b></td>
						<s:if test="#contractBase.rightAuthType==1">
							<td colspan="5" align="left">权证:<s:property
									value="#contractBase.landWarrantCode" /></td>
						</s:if>
						<s:else>
							<td colspan="7" align="left">合同：<s:property
									value="#contractBase.landContractCode" /></td>
						</s:else>
					</tr>
					<tr>
						<td colspan="10"><table class="tablenoborder" width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="106" height="30"><b>流转总面积：</b></td>
									<td width="77"><s:property
											value="#contractBase.landRgArea" /></td>
									<td width="95"><b>亩，其中：田</b></td>
									<td width="95"><s:property
											value="#contractBase.paddyfieldRgArea" /></td>
									<td width="48"><b>亩，土</b></td>
									<td width="97"><s:property
											value="#contractBase.drylandRgArea" /></td>
									<td width="83"><b>亩；地块数：</b></td>
									<td width="72"><s:property
											value="#contractBase.landNumber" /></td>
									<td width="42"><b>块</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td colspan="10"><table class="tableright0 tablebottom0"
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th width="31" rowspan="2" class="tdleft0 tdtop0">序号</th>
									<th width="120" rowspan="2" class="tdtop0">地块名称（编号）</th>
									<th width="38" rowspan="2" class="tdtop0">田<br /> （土）
									</th>
									<th width="91" rowspan="2" class="tdtop0">面积（亩）</th>
									<th colspan="4" class="tdtop0">四至界限</th>
									<th width="114" rowspan="2" class="tdtop0">是否基本农田</th>
								</tr>
								<tr>
									<th width="80">东</th>
									<th width="80">南</th>
									<th width="80">西</th>
									<th width="81">北</th>
								</tr>
								<s:iterator var="parcel" value="#parcels" status="st">
									<tr>
										<td height="30" class="tdleft0"><s:property
												value="#st.index+1" /></td>
										<td><s:property value="#parcel.parcelCode" /></td>
										<td><s:if test="#parcel.type==1">田</s:if> <s:if
												test="#parcel.type==2">地</s:if></td>
										<td><s:property value="#parcel.rgArea" /></td>
										<td><s:property value="#parcel.east" /></td>
										<td><s:property value="#parcel.south" /></td>
										<td><s:property value="#parcel.west" /></td>
										<td><s:property value="#parcel.north" /></td>
										<s:if test="#parcel.basicFarmland==1">
											<td>高标准基本农田</td>
										</s:if>
										<s:elseif test="#parcel.basicFarmland==2">
											<td>基本农田</td>
										</s:elseif>
										<s:else>
											<td>非基本农田</td>
										</s:else>
									</tr>
								</s:iterator>
								<tr>
									<td height="30" class="tdleft0">&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>