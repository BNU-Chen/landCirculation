<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@page
	import="java.util.*,com.opensymphony.xwork2.util.*,cn.ac.irsa.landcirculation.UserPerson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Insert title here</title>
<sx:head />
<link href="../common/print.css" rel="stylesheet" type="text/css" />
<script src="../common/print.js" type="text/javascript"></script>
<!--media=print 这个属性可以在打印时有效-->
<style media=print>
.NOPRINT {
	display: none;
	font-family: "宋体";
	font-size: 9pt;
}

.PageNext {
	page-break-after: always;
}
</style>
<script language="javascript">
	function printPreview() {
		/* 		alert("test: invoked!");
		 alert("WebBrowser:" + document.getElementById("WebBrowser")); */
		document.getElementById("WebBrowser").ExecWB(7, 1);
	}
	function print() {
		var contractBaseId = document.getElementById("contractBase.id").value;
		var contractRentId = document.getElementById("contractRent.id").value;
		url = "ContractSign!printContractRent?contractBase.id="
				+ contractBaseId + "contractRent.id=" + contractRentId;
		alert(url);
		window
				.open(
						url,
						"打印申请表",
						'height=1100, width=714, top=0, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');

	}
</script>
</head>
<body onload="pagesetup_report();">
	<center class="NOPRINT">
		<OBJECT id="WebBrowser" height="0" width="0"
			classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
		</OBJECT>
		<input id="contractBase.id" type=hidden value="${contractBase.id}" />
		<input id="contractRent.id" type=hidden value="${contractRent.id}" />
		<input type=button value="打印 " onclick="print()" />
	</center>
	<hr align="center" width="100%" size="1" noshade class="NOPRINT">
	<div class="A4">
		<div class="A4content">
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="80"></td>
				</tr>
			</table>
			<table class="tablenoborder" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td><table width="754" border="0" cellpadding="0"
							cellspacing="0" class="tablenoborder">
							<tr>
								<td width="228" height="40"></td>
								<td width="72"><div class="tdbottom1">&nbsp;</div></td>
								<td width="48"><div class="title5">县(区)</div></td>
								<td class="baseline" width="80"><div class="tdbottom1">&nbsp;</div></td>
								<td width="40"><div class="title5">乡(镇)</div></td>
								<td width="31">&nbsp;</td>
								<td width="69"><div class="title5">合同编号：</div></td>
								<td width="160"><div class="tdbottom1">&nbsp;</div></td>
								<td width="26"></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td height="160">&nbsp;</td>
				</tr>
				<tr>
					<td height="40" class="title0">重庆市农村土地承包经营权出租合同</td>
				</tr>
				<tr>
					<td height="280">&nbsp;</td>
				</tr>
				<tr>
					<td><table class="tablenoborder" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="80"></td>
								<td width="160" height="40"><div class="titleright2">甲方（出租方）:</div></td>
								<td><div class="tdbottom1">
										<s:property value="#contractBase.transferName" />
									</div></td>
								<td width="80"></td>
							</tr>
							<tr height="40">
								<td></td>
								<td>
									<div class="titleright2">乙方（承租方）:</div>
								</td>
								<td><div class="tdbottom1">
										<s:property value="#contractBase.transfeeName" />
									</div></td>
								<td></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td height="220"></td>
				</tr>
				<tr>
					<td><table class="tablenoborder" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="224" height="20"></td>
								<td width="231"><div class="title4">重 庆 市 农 业 委 员 会</div></td>
								<td width="70" rowspan="2"><div class="title4">监制</div></td>
								<td width="229"></td>
							</tr>
							<tr height="40">
								<td height="20"></td>
								<td><div class="title4">重 庆 市 工 商 行 政 管 理 局</div></td>
								<td></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td height="60"></td>
				</tr>
			</table>
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="40"></td>
				</tr>
			</table>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
	<div class="A4">
		<div class="A4content">
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="80"></td>
				</tr>
			</table>
			<table class="tablenoborder" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="40"></td>
					<td width="634">
						<table class="tablenoborder" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="80"></td>
								<td width="80"></td>
								<td width="80"></td>
								<td width="80"></td>
								<td width="80"></td>
								<td width="80"></td>
								<td width="80"></td>
								<td width="80"></td>
							</tr>
							<tr>
								<td colspan="8" height="40"><div class="title1">重庆市农村土地承包经营权出租合同</div></td>
							</tr>

							<tr></tr>
							<tr>
								<td colspan="2"><div class="titleright4">甲方（出租方）:</div></td>
								<td colspan="6" height="40"><div class="tdbottom1">
										<s:property value="#contractBase.transferName" />
									</div></td>
							</tr>
							<tr>
								<td colspan="2"><div class="titleright4">委托代理人:</div></td>
								<td colspan="6" height="40"><div class="tdbottom1"></div></td>
							</tr>
							<tr>
								<td colspan="2"><div class="titleright4">乙方（承租方）:</div></td>
								<td colspan="6" height="40"><div class="tdbottom1">
										<s:property value="#contractBase.transfeeName" />
									</div></td>
							</tr>
							<tr>
								<td colspan="2"><div class="titleright4">委托代理人:</div></td>
								<td colspan="6" height="40"><div class="tdbottom1"></div></td>
							</tr>
							<tr>
								<td colspan="8" height="10">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="8">
									<div class="term">根据《中华人民共和国合同法》、《中华人民共和国农村土地承包法》和《农村土地承包经营权流转管理办法》等法律、法规和国家有关政策的规定，甲乙双方经协商一致，订立本合同。</div>
									<div class="titleleft3">一、标的基本情况及用途</div>
									<div class="term">
										甲方将其承包的位于
										<div class="content">长寿区</div>
										区（县）
										<div class="content">双龙镇</div>
										乡（镇）
										<div class="content">######</div>
										村
										<div class="content">######</div>
										组（社）的
										<div class="content">######</div>
										亩（土地承包经营权证所登记的面积）土地(详见下表)承包经营权，出租给乙方从事（主营项目）
										<div class="content">##################</div>
										生产经营。
									</div>
									<div class="title3">土地基本情况表</div>
									<table class="tableborder1" cellpadding="0" cellspacing="0">
										<tr>
											<td><table class="tableborder1" width="100%" border="0"
													cellspacing="0" cellpadding="0">
													<tr>
														<td width="27" rowspan="2" class="tdleft0 tdtop0">序号</td>
														<td width="99" rowspan="2" class="tdtop0">地块名称（编号）</td>
														<td width="39" rowspan="2" class="tdtop0">田<br />
															（土）
														</td>
														<td width="70" rowspan="2" class="tdtop0">面积（亩）</td>
														<td height="30" colspan="4" class="tdtop0">四至界限</td>
														<td width="168" rowspan="2" class="tdtop0">是否基本农田</td>
													</tr>
													<tr>
														<td width="67" height="30">东</td>
														<td width="67">南</td>
														<td width="67">西</td>
														<td width="67">北</td>
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
															<td><s:if test="#parcel.basicFarmland==1"> 高标准基本农田 </s:if>
																<s:elseif test="#parcel.basicFarmland==2"> 基本农田 </s:elseif>
																<s:else> 非基本农田 </s:else></td>
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
										<tr>
											<td><table class="tablenoborder" width="100%" border="0"
													cellspacing="0" cellpadding="0">
													<tr>
														<td width="106" height="30">流转总面积：</td>
														<td width="77"><div class="content">
																<s:property value="#Apply.landRgArea" />
															</div></td>
														<td width="95">亩，其中：田</td>
														<td width="95"><div class="content">
																<s:property value="#Apply.paddyfieldRgArea" />
															</div></td>
														<td width="48">亩，土</td>
														<td width="97"><div class="content">
																<s:property value="#Apply.drylandRgArea" />
															</div></td>
														<td width="83">亩；地块数：</td>
														<td width="72"><div class="content">
																<s:property value="#Apply.landNumber" />
															</div></td>
														<td width="42">块</td>
													</tr>
													<tr>
														<td width="17%" height="30">权利证明</td>
														<td colspan="3"><div class="content">
																<s:if test="#Apply.rightAuthType==1">
					承包经营权证
				</s:if>
																<s:else>
					承包经营合同
				</s:else>
															</div></td>
														<td width="9%">编号</td>
														<td width="44%" colspan="5" align="left"><div
																class="content">
																<s:if test="#Apply.rightAuthType==1">
					权证:<s:property value="#Apply.landWarrantCode" />
																</s:if>
																<s:else>
					合同：<s:property value="#Apply.landContractCode" />
																</s:else>
															</div></td>

													</tr>
												</table></td>
										</tr>


									</table>
									<div class="titleleft3">二、出租期限</div>
									<div class="term">
										土地承包经营权出租期限为
										<div class="content">########</div>
										年，自
										<div class="content">########</div>
										年
										<div class="content">########</div>
										月
										<div class="content">########</div>
										日起至
										<div class="content">########</div>
										年
										<div class="content">########</div>
										月
										<div class="content">########</div>
										日止（不得超过土地承包期的剩余期限）。
									</div>
								</td>
							</tr>




						</table>
					</td>
					<td width="40"></td>
				</tr>


			</table>


			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="40">第 2页（共5页）</td>
				</tr>
			</table>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />

	<div class="A4">


		<table class="tablenoborder" width="100%" height="40" border="0"
			cellspacing="0" cellpadding="0">
			<tr>
				<td class="title1" height="80"></td>
			</tr>
		</table>
		<table class="tablenoborder" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40"></td>
				<td><table class="tablenoborder" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<div class="titleleft3">三、出租价款及支付方式</div>
								<div class="term">
									1.该土地实际面积（按土地承包经营权证记载的四至界限所丈量的面积）与登记面积（土地承包经营权证所登记的面积）不一致的，双方约定出租价款按：
									<div class="content">##</div>
									实际面积计算；
									<div class="content">##</div>
									登记面积计算。
								</div>
								<div class="term">
									2.双方同意按下列第
									<div class="content">########</div>
									种方式支付出租价款：
								</div>
								<div class="term">
									①货币支付：第一年出租价款为每亩人民币
									<div class="content">########</div>
									元，合计人民币
									<div class="content">########</div>
									(大写：
									<div class="content">########</div>
									) 元，以后递增方式及比例为
									<div class="content">########</div>
									。
								</div>
								<div class="term">
									②实物支付：第一年出租价款为每亩
									<div class="content">########</div>
									斤
									<div class="content">########</div>
									(填黄谷、玉米或双方议定的其他实物），合计(大写：
									<div class="content">########</div>
									) 斤，以后递增方式及比例为
									<div class="content">########</div>
									。
								</div>
								<div class="term">
									③其他：
									<div class="content">########</div>
									。
								</div>
								<div class="term">3.如果双方约定以实物或其他非货币方式支付出租价款的，甲方要求变更为以货币方式支付，乙方应当同意，并参照当地当年中等市场价格折算。
								</div>
								<div class="titleleft3">四、支付时间</div>
								<div class="term">
									双方同意按下列第
									<div class="content">########</div>
									种方式支付出租价款:
								</div>
								<div class="term">
									1.提前1年支付：本合同生效后
									<div class="content">########</div>
									天内，乙方向甲方一次性支付第一年度的出租价款；以后每年
									<div class="content">########</div>
									月
									<div class="content">########</div>
									日前，乙方向甲方支付下一年度的出租价款。
								</div>
								<div class="term">
									2.逐年支付：本合同生效后
									<div class="content">########</div>
									天内，乙方向甲方一次性支付第一年度的出租价款；以后每年
									<div class="content">########</div>
									月
									<div class="content">########</div>
									日前，乙方向甲方支付当年度的出租价款。
								</div>
								<div class="term">
									3.一次性支付：
									<div class="content">####</div>
									年
									<div class="content">##</div>
									月
									<div class="content">##</div>
									日前，乙方向甲方一次性支付全部出租价款。
								</div>
								<div class="term">
									4.其他：
									<div class="content">##############################</div>
									。
								</div>
								<div class="titleleft3">五、补偿标准、方式及时间</div>
								<div class="term">
									甲方在出租前对该土地投入而提高土地生产能力，以及在该土地上的青苗、构（附）着物等，双方约定补偿标准、方式及时间为：
									<div class="content">########</div>
									。
								</div>
								<div class="titleleft3">六、土地交付方式及时间</div>
								<div class="term">
									1.甲方按下列第（
									<div class="content">########</div>
									）项方式将出租土地交付给乙方：
								</div>
								<div class="term">①一次性全部交付。</div>
								<div class="term">
									②
									<div class="content">########</div>
									。
								</div>
								<div class="term">2.交付资料：</div>
								<div class="term">①土地承包经营权证或承包合同复印件（含红线图）；</div>
								<div class="term">②土地交付时的地形、地貌、土质、青苗、构（附）着物等情况的书面描述、图片等（经双方确认）；</div>
								<div class="term">
									③
									<div class="content">########</div>
									。 
								</div>
								<div class="term">
									 3.交付时间为：
									<div class="content">########</div>
									。
								</div>
							</td>
						<tr>
					</table></td>
				<td width="40"></td>
			</tr>
		</table>
		<table class="tablenoborder" cellspacing="0" cellpadding="0">
			<tr>
				<td height="40">第 3页（共5页）</td>
			</tr>
		</table>


	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
	<div class="A4">
		<div class="A4content">
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="80"></td>
				</tr>
			</table>
			<table class="tablenoborder" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="40"></td>
					<td width="634"><table class="tablenoborder" cellpadding="0"
							cellspacing="0">
							<tr>
								<td><div class="titleleft3">七、甲方的权利和义务</div>
									<div class="term">1.依法获得土地承包经营权出租的收益。</div>
									<div class="term">2.依法或按照合同约定收回出租的土地承包经营权。</div>
									<div class="term">3.有权监督乙方合理利用、保护土地，制止乙方损坏土地和其他农业资源、污染环境等行为。</div>
									<div class="term">4.协调乙方与本集体经济组织内其他承包户之间发生的用水、用电、治安等方面的纠纷。</div>
									<div class="term">5.尊重乙方的生产经营自主权，不得干涉乙方依法进行正常的生产经营活动。</div>
									<div class="term">
										6.
										<div class="content">########</div>
										。
									</div>
									<div class="titleleft3">八、乙方的权利和义务</div>
									<div class="term">1.依法享有承租土地的使用权、收益权、自主生产经营权。</div>
									<div class="term">2.合同期内，改变合同约定主营项目，需经得甲方书面同意。</div>
									<div class="term">3.依法保护和合理利用土地，不得给土地造成永久性损害。</div>
									<div class="term">4.合同期内，对土地进行再流转，需经得甲方书面同意。</div>
									<div class="term">5.合同期满后，及时向甲方交还承租的土地承包经营权。</div>
									<div class="term">
										6.
										<div class="content">########</div>
										。
									</div>
									<div class="titleleft3">九、合同到期后地上构(附)着物及相关设施的处理</div>
									<div class="term">合同期满后，甲方收回该土地承包经营权。乙方对该土地进行投入而提高土地生产能力的、在当时为生产经营需要而设立的相关设施及地上构(附)着物等，双方约定处理方式、时间为： </div>
									<div class="titleleft3">十、合同的变更、解除</div>
									<div class="term">1.经双方协商一致，可变更或解除本合同。</div>
									<div class="term">2.乙方不按照国家法律法规和有关政策规定使用流转土地，给该土地造成永久性损害的，甲方有权解除合同，收回土地承包经营权。</div>
									<div class="term">3.甲方违反合同约定擅自干涉和破坏乙方的生产与经营,使乙方无法进行正常的生产经营活动的，乙方有权解除合同。</div>
									<div class="term">
										4.
										<div class="content">########</div>
										。
									</div>
									<div class="titleleft3">十一、违约责任</div>
									<div class="term">
										1.乙方不按期支付出租价款的，每延迟壹天，按应付费用的
										<div class="content">########</div>
										%承担违约金；超过
										<div class="content">########</div>
										天仍未付款的，甲方有权解除合同，收回土地承包经营权。 
									</div>
									<div class="term">
										2.甲方不按期交付土地的，每延迟壹天，按出租费用的
										<div class="content">########</div>
										%承担违约金；超过
										<div class="content">########</div>
										 天仍未交付的，乙方有权解除合同。
									</div>
									<div class="term">
										3.一方无故擅自解除合同的，违约方应向对方支付
										<div class="content">########</div>
										元违约金。
									</div></td>
							</tr>
						</table>
					<td width="40"></td>
				</tr>
			</table>
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="40">第4页（共5页）</td>
				</tr>
			</table>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
	<div class="A4">
		<div class="A4content">
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="80"></td>
				</tr>
			</table>
			<table class="tablenoborder" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="40"></td>
					<td width="634"><table class="tablenoborder" cellpadding="0"
							cellspacing="0">
							<tr>
								<td><div class="term">
										4.一方违反合同其他约定的，违约方应向对方支付
										<div class="content">########</div>
										元违约金。
									</div>
									<div class="term">5.一方违约给对方造成了损失的，应赔偿损失。</div>
									<div class="term">
										6.违约金不足以弥补对方损失的，违约方应在违约金外增加支付赔偿金，以补足对方损失。</div>
									<div class="term">
										7.因不可抗力不能履行合同时，一方当事人应及时通知对方，并在
										<div class="content">########</div>
										日内提供证明，可根据不可抗力的影响，部分或者全部免除责任，但法律另有规定的除外。
									</div>
									<div class="term">
										8.
										<div class="content">########</div>
										。
									</div>
									<div class="titleleft3">十二、争议解决方式</div>
									<div class="term">双方发生合同纠纷可协商解决，也可以请求村民委员会、乡（镇）人民政府等调解。不愿协商、调解或协商、调解不成的，可以向该土地所在地的农村土地承包经营纠纷仲裁委员会申请仲裁，也可以直接向人民法院起诉。</div>
									<div class="titleleft3">十三、其他约定</div>
									<div class="term">
										1.合同期内，该土地涉及的国家有关政策性补贴、补助及其他费用等权利按如下方式处理：
										<div class="content">###########</div>
										。
									</div>
									<div class="term">
										2.合同期内，如果该土地被依法征收、征用、占用，相关补偿款按如下方式处理：
										<div class="content">####################</div>
										。
									</div>
									<div class="term">3.本合同自双方签字(盖章)后生效。未尽事宜，经双方协商一致后订立补充协议，补充协议与本合同具有同等法律效力。</div>
									<div class="term">
										4.双方向乡（镇）人民政府农村土地承包管理部门：
										<div class="content">####</div>
										申请合同鉴证；
										<div class="content">####</div>
										不申请合同鉴证。
									</div>
									<div class="term">
										5.其他：
										<div class="content">##############################</div>
										。
									</div>
									<div class="term">
										6.本合同一式
										<div class="content">####</div>
										份，双方各执一份，发包方和镇（乡）人民政府农村土地承包管理部门各备案一份（如有鉴证，相应增加一份）。
									</div></td>
							</tr>
							<tr>
								<td height="30"></td>
							</tr>
							<tr>
								<td><table class="tablenoborder" cellpadding="0"
										cellspacing="0">
										<tr>
											<td rowspan="2" width="50%"><div class="titleleft4">甲方（签章）：</div></td>
											<td height="30"><div class="titleleft4">乙方（签章）：</div></td>
										</tr>
										<tr>
											<td height="30"><div class="titleleft4">
													法定代表人：
													<div class="content">####</div>
												</div></td>
										</tr>
										<tr>
											<td width="50%"><div class="titleleft4">
													身份证号：
													<div class="content">####</div>
												</div></td>
											<td height="30"><div class="titleleft4">
													身份证号：
													<div class="content">####</div>
												</div></td>
										</tr>
										<tr>
											<td width="50%"><div class="titleleft4">
													住    所：
													<div class="content">####</div>
												</div></td>
											<td height="30"><div class="titleleft4">
													住    所：
													<div class="content">####</div>
												</div></td>
										</tr>
										<tr>
											<td width="50%"><div class="titleleft4">
													联系电话：
													<div class="content">####</div>
												</div></td>
											<td height="30"><div class="titleleft4">
													联系电话：
													<div class="content">####</div>
												</div></td>
										</tr>
										<tr>
											<td width="50%"><div class="titleleft4">
													委托代理人：
													<div class="content">####</div>
												</div></td>
											<td height="30"><div class="titleleft4">
													委托代理人：
													<div class="content">####</div>
												</div></td>
										</tr>
										<tr>
											<td width="50%"><div class="titleleft4">
													签订日期：
													<div class="content">####</div>
													年
													<div class="content">####</div>
													月
													<div class="content">##</div>
													日
												</div></td>
											<td height="30"><div class="titleleft4">
													签订日期：
													<div class="content">####</div>
													年
													<div class="content">##</div>
													月
													<div class="content">##</div>
													日
												</div></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td height="40"></td>
							</tr>
						</table>
					<td width="40"></td>
				</tr>
			</table>
			<table class="tablenoborder" cellspacing="0" cellpadding="0">
				<tr>
					<td height="40">第 5页（共5页）</td>
				</tr>
			</table>
		</div>
	</div>
	<hr align="center" width="100%" size="1" class="NOPRINT" />
</body>
</html>