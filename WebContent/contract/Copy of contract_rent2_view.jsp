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
<link href="../common/SpryAssets/SpryValidationRadio.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationTextarea.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationRadio.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function paystyle(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paystyle");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paystyle";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}

		rows[style].style.display = "";

		var item = rows[style].getElementsByClassName("" + style);
		for ( var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}

	function paytime(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("paytime");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "paytime";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}
		rows[style].style.display = "";
		var item = rows[style].getElementsByClassName("" + style);
		for ( var i = 0; i < item.length; i++) {
			item[i].disabled = "";
		}
	}
</script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="title"></div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" align="center" width="100%">
						<tr>
							<td><span><b>二、出租期限</b></span></td>
						</tr>
					</table>
				</div>
				<form id="form3" name="form3" method="post"
					action="Rentcontract!saveRentcontract">
					<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
						width="100%">
						<tr class="hide">
							<td></td>
							<td><input id="contractBase.id" name="contactBase.id"
								type="hidden" value="${contactBase.id}" /><input
								id="contract_rent.id" name="contact_rent.id" type="hidden"
								value="${contact_rent.id}" /></td>
						</tr>
						<tr>
							<td><label>流转起止期限</label></td>
							<td><span id="sprytextfield7"> <input
									name="contract_rent.dateFrom" type="text" id="text6"
									onclick="HS_setDate(this)"
									<s:if test="#contract_rent.fromDate!=null">
										value=<s:date name="#contractBase.fromDate" format="yyyy-MM-dd" /></s:if>
									size="8" /> <span class="textfieldRequiredMsg">输入起始日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span> 至<span
								id="sprytextfield8"> <input name="contractBase.toDate"
									type="text" id="text7" onclick="HS_setDate(this)"
									<s:if test="#contractBase.toDate!=null">
										value=<s:date name="#contractBase.toDate" format="yyyy-MM-dd" /></s:if>
									size="8" /> <span class="textfieldRequiredMsg">输入终止日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
						<tr>
							<td><label>面积计算办法</label></td>
							<td><span id="spryradio3"> <s:if
										test="#contract_rent.areaType==1">
										<label><input name="contract_rent.areaType"
											type="radio" id="RadioGroup3_0" value="1" checked="checked" />
											实际面积 </label>
										<label> <input name="contract_rent.areaType"
											type="radio" id="RadioGroup3_1" value="2" /> 登记面积
										</label>
									</s:if> <s:else>
										<label><input name="contract_rent.areaType"
											type="radio" id="RadioGroup3_0" value="1" /> 实际面积 </label>
										<label> <input name="contract_rent.areaType"
											type="radio" id="RadioGroup3_1" value="2" checked="checked" />
											登记面积
										</label>
									</s:else> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>流转价款及支付方式</span></td>
						</tr>
						<tr>
							<td><label>流转价款及支付方式</label></td>
							<td><span id="spryradio2"> <label> <s:if
											test="#contract_rent.payType==1||#contract_rent.payType==null">
											<input name="contract_rent.payType" type="radio"
												id="RadioGroup2_0" value="1" checked="checked"
												onclick="paystyle(0)" />
										</s:if> <s:else>
											<input name="contract_rent.payType" type="radio"
												id="RadioGroup2_0" value="1" onclick="paystyle(0)" />
										</s:else> 货币支付
								</label> <label><s:if test="#contract_rent.payType==2">
											<input type="radio" name="contract_rent.payType" value="2"
												id="RadioGroup2_1" onclick="paystyle(1)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contract_rent.payType" value="2"
												id="RadioGroup2_1" onclick="paystyle(1)" />
										</s:else>实物支付 </label> <label><s:if test="#contract_rent.payType==3">
											<input type="radio" name="contract_rent.payType" value="3"
												id="RadioGroup2_2" onclick="paystyle(2)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contract_rent.payType" value="3"
												id="RadioGroup2_2" onclick="paystyle(2)" />
										</s:else> 其它 </label>
							</span></td>
						</tr>
						<s:if
							test="#contract_rent.payType==1||#contract_rent.payType==null">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩人民币<span id="sprytextfield9"> <input
										class="0" name="contract_rent.payType11" type="text"
										id="text8" size="4" value="${contract_rent.payType11}" /> <span
										class="textfieldRequiredMsg">输入流转单价。</span></span>元，以后每年累积递增比例为<span
									id="sprytextfield10"> <input class="0"
										name="contract_rent.payType12" type="text" id="text9" size="2"
										value="${contract_rent.payType12}"
										<s:if
									test="#contract_rent.payType!=1&& #contract_rent.payType!=null"> disabled="disabled" 								
								</s:if> />
										<span class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩人民币<span id="sprytextfield9"> <input
										class="0" name="contract_rent.payType11" type="text"
										id="text8" size="4" value="${contract_rent.payType11}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入流转单价。</span></span>元，以后每年累积递增比例为<span
									id="sprytextfield10"> <input class="0"
										name="contract_rent.payType12" type="text" id="text9" size="2"
										value="${contract_rent.payType12}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:else>
						<s:if test="#contract_rent.payType==2">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩<span id="sprytextfield11"> <input
										class="1" name="contract_rent.payType21" type="text"
										id="text10" size="4" value="${contract_rent.payType21}" /> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤<span
									id="spryselect1"> <select class="1"
										name="contract_rent.payType22" id="select1">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，以后每年累积递增比例为<span
									id="sprytextfield12"> <input class="1"
										name="contract_rent.payType23" type="text" id="text11"
										size="2" value="${contract_rent.payType23}" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩<span id="sprytextfield11"> <input
										class="1" name="contract_rent.payType21" type="text"
										id="text10" size="4" value="${contract_rent.payType21}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入实物数量。</span></span>斤<span
									id="spryselect1"> <select class="1"
										name="contract_rent.payType22" id="select1"
										disabled="disabled">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，以后每年累积递增比例为<span
									id="sprytextfield12"> <input class="1"
										name="contract_rent.payType23" type="text" id="text11"
										size="2" value="${contract_rent.payType23}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:else>
						<s:if test="#contract_rent.payType==3">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td><span id="sprytextarea11"> <textarea class="2"
										name="contract_rent.payType31" id="textarea11" rows="5"><s:property
												value="#contract_rent.payType31" /></textarea> <span
										id="countsprytextarea11">&nbsp;</span><span
										class="textareaRequiredMsg">请填写约定的支付方式。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td><span id="sprytextarea11"> <textarea class="2"
										name="contract_rent.payType31" id="textarea11" rows="5"
										disabled="disabled"><s:property
												value="#contract_rent.payType31" /></textarea> <span
										id="countsprytextarea11">&nbsp;</span><span
										class="textareaRequiredMsg">请填写约定的支付方式。</span></span></td>
							</tr>
						</s:else>

						<tr>
							<td width="200"></td>
							<td><span>支付时间</span></td>
						</tr>
						<tr>
							<td><label>支付时间</label></td>
							<td><span id="spryradio4"> <label><s:if
											test="#contract_rent.paytimeType==1||#contract_rent.paytimeType==null">
											<input name="contract_rent.paytimeType" type="radio"
												id="RadioGroup4_0" value="1" checked="checked"
												onclick="paytime(0)" />
										</s:if> <s:else>
											<input name="contract_rent.paytimeType" type="radio"
												id="RadioGroup4_0" value="1" onclick="paytime(0)" />
										</s:else> 提前一年支付 </label> <label><s:if
											test="#contract_rent.paytimeType==2">
											<input type="radio" name="contract_rent.paytimeType"
												value="2" id="RadioGroup4_1" onclick="paytime(1)"
												checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contract_rent.paytimeType"
												value="2" id="RadioGroup4_1" onclick="paytime(1)" />
										</s:else> 逐年支付 </label> <label><s:if
											test="#contract_rent.paytimeType==3">
											<input type="radio" name="contract_rent.paytimeType"
												value="3" id="RadioGroup4_2" onclick="paytime(2)"
												checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contract_rent.paytimeType"
												value="3" id="RadioGroup4_2" onclick="paytime(2)" />
										</s:else> 一次性支付 </label> <label><s:if
											test="#contract_rent.paytimeType==4">
											<input type="radio" name="contract_rent.paytimeType"
												value="4" id="RadioGroup4_3" onclick="paytime(3)"
												checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="contract_rent.paytimeType"
												value="4" id="RadioGroup4_3" onclick="paytime(3)" />
										</s:else> 其它 </label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>
						<s:if
							test="#contract_rent.paytimeType==1||#contract_rent.paytimeType==null">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield14"> <input
										class="0" name="contract_rent.paytimeType11" type="text"
										id="text13" size="2" value="${contract_rent.paytimeType11}" />
										<span class="textfieldRequiredMsg">输入天数。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span
									id="sprytextfield15"> <input class="0"
										name="contract_rent.paytimeType12" type="text" id="text14"
										size="2" value="${contract_rent.paytimeType12}" /> <span
										class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>月<span
									id="sprytextfield16"> <input class="0"
										name="contract_rent.paytimeType13" type="text" id="text15"
										size="2" value="${contract_rent.paytimeType13}" /> <span
										class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付下一年度的出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield14"> <input
										class="0" name="contract_rent.paytimeType11" type="text"
										id="text13" size="2" value="${contract_rent.paytimeType11}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入天数。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span
									id="sprytextfield15"> <input class="0"
										name="contract_rent.paytimeType12" type="text" id="text14"
										size="2" value="${contract_rent.paytimeType12}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>月<span
									id="sprytextfield16"> <input class="0"
										name="contract_rent.paytimeType13" type="text" id="text15"
										size="2" value="${contract_rent.paytimeType13}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付下一年度的出租价款。
								</td>
							</tr>
						</s:else>
						<s:if test="#contract_rent.paytimeType==2">

							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield13"> <input
										class="1" name="contract_rent.paytimeType21" type="text"
										id="text12" size="2" value="${contract_rent.paytimeType21}" /><span
										class="textfieldRequiredMsg">输入天数。</span>
								</span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span id="sprytextfield17"> <input
										class="1" name="contract_rent.paytimeType22" type="text"
										id="text16" size="2" value="${contract_rent.paytimeType22}" />
										<span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于12。</span></span>月<span
									id="sprytextfield18"> <input class="1"
										name="contract_rent.paytimeType23" type="text" id="text17"
										size="2" value="${contract_rent.paytimeType23}" /> <span
										class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付当年度的出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield13"> <input
										class="1" name="contract_rent.paytimeType21" type="text"
										id="text12" size="2" value="${contract_rent.paytimeType21}"
										disabled="disabled" /><span class="textfieldRequiredMsg">输入天数。</span>
								</span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span id="sprytextfield17"> <input
										class="1" name="contract_rent.paytimeType22" type="text"
										id="text16" size="2" value="${contract_rent.paytimeType22}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于12。</span></span>月<span
									id="sprytextfield18"> <input class="1"
										name="contract_rent.paytimeType23" type="text" id="text17"
										size="2" value="${contract_rent.paytimeType23}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付当年度的出租价款。
								</td>
							</tr>
						</s:else>

						<s:if test="#contract_rent.paytimeType==3">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>一次性支付：<span id="sprytextfield19"> <input
										class="2" name="contract_rent.paytimeType31" type="text"
										id="text18" size="10" onclick="HS_setDate(this)"
										value=<s:date name="#contract_rent.paytimeType31" format="yyyy-MM-dd" /> />
										<span class="textfieldRequiredMsg">点击输入支付日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>前，乙方向甲方一次性支付全部出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>一次性支付：<span id="sprytextfield19"> <input
										class="2" name="contract_rent.paytimeType31" type="text"
										id="text18" size="10" onclick="HS_setDate(this)"
										disabled="disabled"
										<s:if test="##contract_rent.paytimeType31!=null">
										value=<s:date name="#contract_rent.paytimeType31" format="yyyy-MM-dd" /></s:if> />
										<span class="textfieldRequiredMsg">点击输入支付日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>前，乙方向甲方一次性支付全部出租价款。
								</td>
							</tr>
						</s:else>

						<s:if test="#contract_rent.paytimeType==4">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>其它：<span id="sprytextarea51"> <textarea
										class="3" name="contract_rent.paytimeType41" id="textarea12"
										rows="8"><s:property
												value="#contract_rent.paytimeType41" /></textarea> <span
										id="countsprytextarea51">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的支付时间。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>其它：<span id="sprytextarea51"> <textarea
										class="3" name="contract_rent.paytimeType41" id="textarea12"
										rows="8" disabled="disabled"><s:property
												value="#contract_rent.paytimeType41" /></textarea> <span
										id="countsprytextarea51">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的支付时间。</span></span></td>
							</tr>
						</s:else>

						<tr>
							<td width="200"></td>
							<td><span>青苗补偿与土地交付</span></td>
						</tr>
						<tr>
							<td><label>补偿及交付</label></td>
							<td>甲方在出租前对该土地投入而提高土地生产能力，以及在该土地上的青苗、构（附）着物等，双方约定补偿标准、方式及时间为：
								<span id="sprytextarea2"> <textarea
									name="contract_rent.compensation" id="textarea2" rows="8"><s:property
											value="#contract_rent.compensation" /></textarea> <span
									id="countsprytextarea2">&nbsp;</span></span><br />
							</td>
						</tr>
						<tr>
							<td><label>土地交付时间及方式</label></td>
							<td>1.甲方按下列方式将出租土地交付给乙方：<span id="spryradio6"> <label>
										<input name="contract_rent.landtransferType" type="radio"
										id="RadioGroup6_0" value="1"
										<s:if test="#contract_rent.landtransferType==1||#contract_rent.landtransferType==null" >checked="checked"</s:if>
										onclick="landtransfer(0)" /> 一次性全部交付
								</label> <label> <input type="radio"
										name="contract_rent.landtransferType" value="2"
										id="RadioGroup6_1"
										<s:if test="#contract_rent.landtransferType==2">checked="checked"</s:if>
										onclick="landtransfer(1)" /> 其它约定
								</label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>

						<s:if test="#contract_rent.landtransferType==2">
							<tr class="landtransfer">
								<td></td>
								<td>交付约定：<span id="sprytextarea13"> <textarea
										class="1" name="contract_rent.landtransferType21"
										id="textarea13" rows="8"><s:property
												value="#contract_rent.landtransferType21" /></textarea> <span
										id="countsprytextarea13">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的土地交付方式。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="landtransfer hide">
								<td></td>
								<td>交付约定：<span id="sprytextarea13"> <textarea
										class="1" name="contract_rent.landtransferType21" rows="8"
										disabled="disabled"><s:property
												value="#contract_rent.landtransferType21" /></textarea> <span
										id="countsprytextarea13">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的土地交付方式。</span></span></td>
							</tr>
						</s:else>

						<tr>
							<td>&nbsp;</td>
							<td>2.交付资料：  <br /> ①土地承包经营权证或承包合同复印件（含红线图）； <br />
								②土地交付时的地形、地貌、土质、青苗、构（附）着物等情况的书面描述、图片等（经双方确认）； <br /> ③ 其它：<span
								id="sprytextarea14"> <textarea
									name="contract_rent.landtransferOtherDatum" id="textarea14"
									rows="8"><s:property
											value="#contract_rent.landtransferOtherDatum" /></textarea><span
									id="countsprytextarea14">&nbsp;</span><span
									class="textareaRequiredMsg">输入其它补充约定。</span></span><br /> 3.交付时间为：<span
								id="sprytextfield20"> <input type="text"
									name="contract_rent.landtransferDate" id="text19"
									onclick="HS_setDate(this)"
									<s:if test="#contract_rent.landtransferDate!=null">
										value=<s:date name="#contract_rent.landtransferDate" format="yyyy-MM-dd" /></s:if> />
									<span class="textfieldRequiredMsg">输入土地交付日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>双方权利义务与合同变更解除</span></td>
						</tr>
						<tr>
							<td><label>甲方的权利和义务</label></td>
							<td>1.依法获得土地承包经营权出租的收益。 <br /> 2.依法或按照合同约定收回出租的土地承包经营权。 <br />
								3.有权监督乙方合理利用、保护土地，制止乙方损坏土地和其他农业资源、污染环境等行为。 <br />
								4.协调乙方与本集体经济组织内其他承包户之间发生的用水、用电、治安等方面的纠纷。 <br />
								5.尊重乙方的生产经营自主权，不得干涉乙方依法进行正常的生产经营活动。 <br /> 6.其它：<span
								id="sprytextarea3"> <textarea
									name="contract_rent.transferorOtherRight" id="textarea3"
									rows="8"><s:property
											value="#contract_rent.transferorOtherRight" /></textarea></span></td>
						</tr>
						<tr>
							<td><label>乙方的权利和义务</label></td>
							<td>1.依法享有承租土地的使用权、收益权、自主生产经营权。<br />2.合同期内，改变合同约定主营项目，需经得甲方书面同意。<br />3.依法保护和合理利用土地，不得给土地造成永久性损害。 <br />4.合同期内，对土地进行再流转，需经得甲方书面同意。 <br />5.合同期满后，及时向甲方交还承租的土地承包经营权。  <br />6.其它：<span
								id="sprytextarea4"> <textarea
									name="contract_rent.transfereeOtherRight" id="textarea4"
									rows="8"><s:property
											value="#contract_rent.transfereeOtherRight" /></textarea> <span
									id="countsprytextarea4">&nbsp;</span>
							</span> 
							</td>
						</tr>
						<tr>
							<td><label>合同到期后地上构(附)着物及相关设施的处理</label></td>
							<td>合同期满后，甲方收回该土地承包经营权。乙方对该土地进行投入而提高土地生产能力的、在当时为生产经营需要而设立的相关设施及地上构(附)着物等，双方约定处理方式、时间为：<br />
								<span id="sprytextarea5"> <textarea
									name="contract_rent.endcirculationDisposal" id="textarea5"
									rows="8"><s:property
											value="#contract_rent.endcirculationDisposal" /></textarea> <span
									id="countsprytextarea5">&nbsp;</span><span
									class="textareaRequiredMsg">需要提供一个值。</span></span></td>
						</tr>
						<tr>
							<td><label>合同的变更、解除</label></td>
							<td>1.经双方协商一致，可变更或解除本合同。 <br />
								2.乙方不按照国家法律法规和有关政策规定使用流转土地，给该土地造成永久性损害的，甲方有权解除合同，收回土地承包经营权。 <br />
								3.甲方违反合同约定擅自干涉和破坏乙方的生产与经营,使乙方无法进行正常的生产经营活动的，乙方有权解除合同。 <br />
								4.其它：<span id="sprytextarea6"> <textarea
									name="contract_rent.contractModify" rows="8" id="textarea6"><s:property
											value="#contract_rent.contractModify" /></textarea> <span
									id="countsprytextarea6">&nbsp;</span></span></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>违约责任</span></td>
						</tr>
						<tr>
							<td><label>违约责任</label></td>
							<td>1.乙方不按期支付出租价款的，每延迟壹天，按应付费用的<span id="sprytextfield21">
									<input name="contract_rent.contractBreach11" type="text"
									id="text20" size="2" value="${contract_rent.contractBreach11}" />
									<span class="textfieldRequiredMsg">输入违约金比例。</span>
							</span>%承担违约金；超过<span id="sprytextfield24"> <input
									name="contract_rent.contractBreach12" type="text" id="text23"
									size="2" value="${contract_rent.contractBreach12}" /> <span
									class="textfieldRequiredMsg">输入宽容期限</span></span>天仍未付款的，甲方有权解除合同，收回土地承包经营权。 <br />
								2.甲方不按期交付土地的，每延迟壹天，按出租费用的<span id="sprytextfield23"> <input
									name="contract_rent.contractBreach21" type="text" id="text22"
									size="2" value="${contract_rent.contractBreach21}" /> <span
									class="textfieldRequiredMsg">输入违约金比例。</span></span> %承担违约金；超过<span
								id="sprytextfield25"> <input
									name="contract_rent.contractBreach22" type="text" id="text24"
									size="2" value="${contract_rent.contractBreach22}" /> <span
									class="textfieldRequiredMsg">输入宽容期限。</span></span> 天仍未交付的，乙方有权解除合同。 <br />
								3.一方无故擅自解除合同的，违约方应向对方支付<span id="sprytextfield26"> <input
									name="contract_rent.contractBreach31" type="text" id="text25"
									size="10" value="${contract_rent.contractBreach31}" /> <span
									class="textfieldRequiredMsg">输入违约金金额。</span></span>元违约金。<br />
								4.一方违反合同其他约定的，违约方应向对方支付<span id="sprytextfield27"> <input
									name="contract_rent.contractBreach41" type="text" id="text26"
									size="10" value="${contract_rent.contractBreach41}" /> <span
									class="textfieldRequiredMsg">输入违约金金额。</span></span> 元违约金。<br />5.一方违约给对方造成了损失的，应赔偿损失。 <br />6.违约金不足以弥补对方损失的，违约方应在违约金外增加支付赔偿金，以补足对方损失。 <br />
								7.因不可抗力不能履行合同时，一方当事人应及时通知对方，并在<span id="sprytextfield4"><input
									name="contract_rent.contractBreach71" type="text" id="text31"
									size="2" value="${contract_rent.contractBreach71}" /><span
									class="textfieldRequiredMsg">输入期限。</span></span>日内提供证明，可根据不可抗力的影响，部分或者全部免除责任，但法律另有规定的除外。  <br />8.其它：<span
								id="sprytextarea7"> <textarea
									name="contract_rent.contractBreach81" id="textarea7" cols="45"
									rows="8"><s:property
											value="#contract_rent.contractBreach81" /></textarea> <span
									id="countsprytextarea7">&nbsp;</span></span></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>其它约定</span></td>
						</tr>
						<tr>
							<td><label>其它约定</label></td>
							<td>1.合同期内，该土地涉及的国家有关政策性补贴、补助及其他费用等权利按如下方式处理：<br /> <span
								id="sprytextarea8"> <textarea
									name="contract_rent.other11" id="textarea8" rows="8"><s:property
											value="#contract_rent.other11" /></textarea> <span
									id="countsprytextarea8">&nbsp;</span><span
									class="textareaRequiredMsg">需要提供一个值。</span><span
									class="textareaMaxCharsMsg">已超过最大字符数。</span></span>                 <br />
								2.合同期内，如果该土地被依法征收、征用、占用，相关补偿款按如下方式处理：<br /> <span
								id="sprytextarea9"> <textarea
									name="contract_rent.other21" id="textarea9" rows="8"><s:property
											value="#contract_rent.other21" /></textarea> <span
									id="countsprytextarea9">&nbsp;</span>
							</span>                                    <br />
								3.本合同自双方签字(盖章)后生效。未尽事宜，经双方协商一致后订立补充协议，补充协议与本合同具有同等法律效力。  <br />
								4.双方向乡（镇）人民政府农村土地承包管理部门：<span id="spryradio5"> <label>
										<input name="contract_rent.authentication" type="radio"
										id="RadioGroup5_0" value="1"
										<s:if test="#contract_rent.authentication==1||#contract_rent.authentication==null"> checked="checked" </s:if> />
										申请合同鉴证
								</label> <label> <input type="radio"
										name="contract_rent.authentication" value="2"
										id="RadioGroup5_1"
										<s:if test="#contract_rent.authentication==2"> checked="checked" </s:if> />
										不申请合同鉴证
								</label> <span class="radioRequiredMsg">请进行选择。</span></span><br /> 5.其他：<span
								id="sprytextarea10"> <textarea
									name="contract_rent.other51" id="textarea10" cols="45" rows="8"><s:property
											value="#contract_rent.other51" /></textarea> <span
									id="countsprytextarea10">&nbsp;</span></span> <br />
								6.本合同一式四份，双方各执一份，发包方和镇（乡）人民政府农村土地承包管理部门各备案一份，鉴证备用一份。
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" value="保存" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield7 = new Spry.Widget.ValidationTextField(
				"sprytextfield7", "date", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					format : "yyyy-mm-dd"
				});
		var sprytextfield8 = new Spry.Widget.ValidationTextField(
				"sprytextfield8", "date", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true,
					format : "yyyy-mm-dd"
				});
		var spryradio3 = new Spry.Widget.ValidationRadio("spryradio3");
		var spryradio2 = new Spry.Widget.ValidationRadio("spryradio2");
		var sprytextfield9 = new Spry.Widget.ValidationTextField(
				"sprytextfield9", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield10 = new Spry.Widget.ValidationTextField(
				"sprytextfield10", "integer", {
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield11 = new Spry.Widget.ValidationTextField(
				"sprytextfield11", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});

		var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");

		var sprytextfield12 = new Spry.Widget.ValidationTextField(
				"sprytextfield12", "integer", {
					validateOn : [ "blur", "change" ]
				});

		var sprytextarea11 = new Spry.Widget.ValidationTextarea(
				"sprytextarea11", {
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea11",
					maxChars : 200,
					minChars : 5
				});
		var spryradio4 = new Spry.Widget.ValidationRadio("spryradio4");
		var sprytextfield14 = new Spry.Widget.ValidationTextField(
				"sprytextfield14", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield15 = new Spry.Widget.ValidationTextField(
				"sprytextfield15", "integer", {
					minValue : 1,
					maxValue : 12,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield16 = new Spry.Widget.ValidationTextField(
				"sprytextfield16", "integer", {
					minValue : 1,
					maxValue : 31,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield13 = new Spry.Widget.ValidationTextField(
				"sprytextfield13", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield17 = new Spry.Widget.ValidationTextField(
				"sprytextfield17", "integer", {
					useCharacterMasking : true,
					minValue : 1,
					maxValue : 12,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield18 = new Spry.Widget.ValidationTextField(
				"sprytextfield18", "integer", {
					minValue : 1,
					maxValue : 31,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield19 = new Spry.Widget.ValidationTextField(
				"sprytextfield19", "date", {
					format : "yyyy-mm-dd",
					validateOn : [ "blur", "change" ]
				});
		var sprytextarea51 = new Spry.Widget.ValidationTextarea(
				"sprytextarea51", {
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea51",
					maxChars : 200,
					minChars : 5
				});
		var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea2"
				});
		var spryradio6 = new Spry.Widget.ValidationRadio("spryradio6");
		var sprytextarea13 = new Spry.Widget.ValidationTextarea(
				"sprytextarea13", {
					maxChars : 200,
					validateOn : [ "blur", "change" ],

					counterType : "chars_remaining",
					counterId : "countsprytextarea13"
				});
		var sprytextarea14 = new Spry.Widget.ValidationTextarea(
				"sprytextarea14", {
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea14"
				});
		var sprytextfield20 = new Spry.Widget.ValidationTextField(
				"sprytextfield20", "date", {
					format : "yyyy-mm-dd",
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextarea3 = new Spry.Widget.ValidationTextarea("sprytextarea3",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200
				});
		var sprytextarea4 = new Spry.Widget.ValidationTextarea("sprytextarea4",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea4"
				});
		var sprytextarea5 = new Spry.Widget.ValidationTextarea("sprytextarea5",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea5"
				});
		var sprytextarea6 = new Spry.Widget.ValidationTextarea("sprytextarea6",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea6"
				});
		var sprytextfield21 = new Spry.Widget.ValidationTextField(
				"sprytextfield21", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield24 = new Spry.Widget.ValidationTextField(
				"sprytextfield24", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield23 = new Spry.Widget.ValidationTextField(
				"sprytextfield23", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});

		var sprytextfield25 = new Spry.Widget.ValidationTextField(
				"sprytextfield25", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur" ]
				});
		var sprytextfield26 = new Spry.Widget.ValidationTextField(
				"sprytextfield26", "real", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield27 = new Spry.Widget.ValidationTextField(
				"sprytextfield27", "real", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextarea7 = new Spry.Widget.ValidationTextarea("sprytextarea7",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var sprytextarea8 = new Spry.Widget.ValidationTextarea("sprytextarea8",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var sprytextarea9 = new Spry.Widget.ValidationTextarea("sprytextarea9",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var spryradio5 = new Spry.Widget.ValidationRadio("spryradio5");
		var sprytextarea10 = new Spry.Widget.ValidationTextarea(
				"sprytextarea10", {
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea10",
					isRequired : false
				});

		/* 		var spryradio1 = new Spry.Widget.ValidationRadio("spryradio1");
		 var sprytextfield5 = new Spry.Widget.ValidationTextField(
		 "sprytextfield5", "none", {
		 validateOn : [ "blur", "change" ]
		 });
		 var sprytextfield6 = new Spry.Widget.ValidationTextField(
		 "sprytextfield6", "none", {
		 validateOn : [ "blur", "change" ]
		 });
		

		 var sprytextfield28 = new Spry.Widget.ValidationTextField(
		 "sprytextfield28", "none", {
		 validateOn : [ "blur", "change" ]
		 });
		 var sprytextfield22 = new Spry.Widget.ValidationTextField(
		 "sprytextfield22", "none", {
		 validateOn : [ "blur", "change" ],
		 isRequired : false
		 });
		 var sprytextfield29 = new Spry.Widget.ValidationTextField(
		 "sprytextfield29", "none", {
		 validateOn : [ "blur", "change" ]
		 });
		 var sprytextfield30 = new Spry.Widget.ValidationTextField(
		 "sprytextfield30", "none", {
		 validateOn : [ "blur", "change" ]
		 });
		 var sprytextfield31 = new Spry.Widget.ValidationTextField(
		 "sprytextfield31", "none", {
		 validateOn : [ "blur", "change" ]
		 }); 
		 */
	</script>
</body>
</html>