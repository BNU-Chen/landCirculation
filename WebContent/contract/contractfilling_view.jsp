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
							<td><span><b>合同基本信息</b></span></td>
						</tr>
					</table>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td><label for="user.userName"><b>合同编号:</b></label></td>
						<td colspan="5"><s:property
								value="#contractfilling.contractNo" /></td>

					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5"><span><b>甲方（转出方）</b></span></td>

					</tr>
					<tr>
						<td><label for="user.userName"><b>姓名:</b></label></td>
						<td><s:property value="#contractfilling.transferName" /></td>
						<td><label for="userPerson.userId"><b>证件号码:</b></label></td>
						<td><s:property value="#contractfilling.transferIdcode" /></td>
						<td><label><b>联系电话:</b></label></td>
						<td><s:property value="#contractfilling.transferTel" /></td>
					</tr>
					<tr>
						<td><label><b>通讯地址:</b></label></td>
						<td colspan="3"><s:property
								value="#contractfilling.transferAddress" /></td>
						<td><label><b>电子邮件:</b></label></td>
						<td><s:property value="#contractfilling.transferEmail" /></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td colspan="5"><span><b>乙方（转入方）</b></span></td>
					</tr>
					<tr>
						<td><label for="user.userName"><b>姓名:</b></label></td>
						<td><s:property value="#contractfilling.transfeeName" /></td>
						<td><label for="userPerson.userId"><b>证件号码:</b></label></td>
						<td><s:property value="#contractfilling.transfeeIdcode" /></td>
						<td><label><b>联系电话:</b></label></td>
						<td><s:property value="#contractfilling.transfeeTel" /></td>
					</tr>
					<tr>
						<td><label><b>通讯地址:</b></label></td>
						<td colspan="3"><s:property
								value="#contractfilling.transfeeAddress" /></td>
						<td><label><b>电子邮件:</b></label></td>
						<td><s:property value="#contractfilling.transfeeEmail" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5"><span><b>标的信息</b></span></td>
					</tr>
					<tr>
						<td><label><b>土地地址</b></label></td>
						<td colspan="5"><s:property
								value="#contractfilling.landAddressName" /></td>
					</tr>
					<tr>
						<td><label><b>总面积（亩）</b></label></td>
						<td><s:property value="#contractfilling.landArea" /></td>
						<td><label><b>旱地面积（亩）</b></label></td>
						<td><s:property value="#contractfilling.drylandArea" /></td>
						<td><label><b>水田面积（亩）</b></label></td>
						<td><s:property value="#contractfilling.paddyfieldArea" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5"><span><b>流转期限</b></span></td>
					</tr>
					<tr>
						<td><label><b>起始日期:</b></label></td>
						<td colspan="2"><s:date name="#contractfilling.fromDate"
								format="yyyy" />年<s:date name="#contractfilling.fromDate"
								format="M" />月<s:date name="#contractfilling.fromDate"
								format="d" />日</td>
						<td><label><b>终止日期:</b></label></td>
						<td colspan="2"><s:date name="#contractfilling.toDate"
								format="yyyy" />年<s:date name="#contractfilling.toDate"
								format="M" />月<s:date name="#contractfilling.toDate" format="d" />日
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5"><span><b>价款及支付方式</b></span></td>
					</tr>
					<tr>
						<td><label><b></b></label></td>
						<td colspan="6">
							<div class="term">
								双方同意按下列第
								<div class="content">
									【
									<s:property value="#contractfilling.payType" />
									】
								</div>
								种方式支付出租价款：
							</div> <s:if test="#contractfilling.payType==1">
								<div class="term">
									①货币支付：第一年出租价款为按水田每亩人民币
									<div class="content">
										【
										<s:property value="#contractfilling.payType11" />
										】
									</div>
									元，按旱地每亩人民币
									<div class="content">
										【
										<s:property value="#contractfilling.payType12" />
										】
									</div>
									元，合计人民币
									<div class="content">
										【
										<s:property value="#contractfilling.payType13" />
										】
									</div>
									元(大写：
									<div class="content">
										【
										<s:property value="#contractfilling.payType13string" />
										】
									</div>
									) ，以后递增方式为每年
									<div class="content">
										【
										<s:property value="#contractfilling.payType14" />
										】
									</div>
									% 。
								</div>
								<div class="term">
									②实物支付：第一年出租价款为按水田每亩
									<div class="content">【####】</div>
									斤，合计
									<div class="content">【####】</div>
									斤
									<div class="content">【####】</div>
									(填黄谷、玉米或双方议定的其他实物），按旱地每亩
									<div class="content">【####】</div>
									斤，合计
									<div class="content">【####】</div>
									斤
									<div class="content">【####】</div>
									(填黄谷、玉米或双方议定的其他实物），以后递增方式为每年
									<div class="content">【####】</div>
									% 。
								</div>
								<div class="term">
									③其他：
									<div class="content">【####】</div>

								</div>
							</s:if> <s:if test="#contractfilling.payType==2">
								<div class="term">
									①货币支付：第一年出租价款为按水田每亩人民币
									<div class="content">【####】</div>
									元，按旱地每亩人民币
									<div class="content">【####】</div>
									元，合计人民币
									<div class="content">【####】</div>
									元 (大写：
									<div class="content">【########】</div>
									) ，以后递增方式为每年
									<div class="content">【####】</div>
									% 。
								</div>
								<div class="term">
									②实物支付：第一年出租价款为按水田每亩
									<div class="content">
										【
										<s:property value="#contractfilling.payType21" />
										】
									</div>
									斤，合计
									<div class="content">
										【
										<s:property value="#contractfilling.payType23" />
										】
									</div>
									斤
									<div class="content">
										【
										<s:property value="#contractfilling.payType22name" />
										】
									</div>
									(填黄谷、玉米或双方议定的其他实物），按旱地每亩
									<div class="content">
										【
										<s:property value="#contractfilling.payType24" />
										】
									</div>
									斤，合计
									<div class="content">
										【
										<s:property value="#contractfilling.payType26" />
										】
									</div>
									斤
									<div class="content">
										【
										<s:property value="#contractfilling.payType25name" />
										】
									</div>
									(填黄谷、玉米或双方议定的其他实物），以后递增方式为每年
									<div class="content">
										【
										<s:property value="#contractfilling.payType27" />
										】
									</div>
									% 。
								</div>
								<div class="term">
									③其他：
									<div class="content">【####】</div>

								</div>
							</s:if> <s:if test="#contractfilling.payType==3">
								<div class="term">
									①货币支付：第一年出租价款为按水田每亩人民币
									<div class="content">【####】</div>
									元，按旱地每亩人民币
									<div class="content">【####】</div>
									元，合计人民币
									<div class="content">【####】</div>
									元(大写：
									<div class="content">【########】</div>
									) ，以后递增方式为每年
									<div class="content">【####】</div>
									% 。
								</div>
								<div class="term">
									②实物支付：第一年出租价款为按水田每亩
									<div class="content">【####】</div>
									斤，合计
									<div class="content">【####】</div>
									斤
									<div class="content">【####】</div>
									(填黄谷、玉米或双方议定的其他实物），按旱地每亩
									<div class="content">【####】</div>
									斤，合计
									<div class="content">【####】</div>
									斤
									<div class="content">
										【
										<s:property value="#contractfilling.payType25name" />
										】
									</div>
									(填黄谷、玉米或双方议定的其他实物），以后递增方式为每年
									<div class="content">【####】</div>
									% 。
								</div>
								<div class="term">
									③其他：
									<div class="content">
										【
										<s:property value="#contractfilling.payType31" />
										】
									</div>

								</div>
							</s:if>
						</td>

					</tr>
					<tr>
						<td width="16.5%"></td>
						<td width="16.5%"></td>
						<td width="16.5%"></td>
						<td width="16.5%"></td>
						<td width="16.5%"></td>
						<td width="16.5%"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>