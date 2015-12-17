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
<script src="../common/calendar.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextField.js"
	type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextarea.js"
	type="text/javascript"></script>
<script src="SpryAssets/SpryValidationRadio.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<script language="javascript">
	function addParcel() {
		document.getElementById("dlgAddParcel").style.display = "block";
		var applyId=doucment.getElementbyId("ApplyId").value;
		alert("ApplyId"+applyId);
		showdlg("700", "430", "Apply!newParcel?apply.id="+applyId);
	}
	function parcelAdded() {
		document.getElementById("dlg").style.display = "none";
		document.getElementById("dlgAddParcel").style.display = "none";
		var d = window.frames["dlgContent"].document;

		//alert("原地址"+document.getElementById("photo").src);

		document.getElementById("photo").src = d
				.getElementById("userPerson.photoFilename").value;

		document.getElementById("userPerson.photoFilename").value = d
				.getElementById("userPerson.photoFilename").value;
		//alert(document.getElementById("userPerson.photoFilename").value);

		//document.getElementById("userPerson.city").value = "重庆市";
	}

	function showTabpane(cursel) {
		var panes = document.getElementById("client").getElementsByTagName(
				"div");
		var tabs = document.getElementById("toc").getElementsByTagName("label");
		//alert(cursel+"\n"+tabs.length);
		for ( var i = 0; i < tabs.length; i++) {
			if (i == cursel) {
				tabs.item(i).className = "selected";
				panes.item(i).style.display = "block";
				var str = "btnSubmit" + String(i + 1);
				//alert(str);
				//document.getElementById(str).click();
			} else {
				tabs.item(i).className = "";
				panes.item(i).style.display = "none";
			}

		}
	}

	function landRightCheckType(checktype) {

		var table = document.getElementById("landRightCheck");
		table.rows[4].className = "";
		table.rows[5].className = "";
		table.rows[6].className = "";
		for ( var i = 1; i < table.rows.length - 1; i++) {
			table.rows[i].style.display = "none";

		}

		table.rows[checktype * 3 + 1].style.display = "";
		table.rows[checktype * 3 + 2].style.display = "";
		table.rows[checktype * 3 + 3].style.display = "";

	}
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
	
/* 	function landtransfer(style) {
		var rows = document.getElementById("tabContract")
				.getElementsByClassName("landtransfer");
		for ( var i = 0; i < rows.length; i++) {
			rows[i].style.display = "none";
			rows[i].className = "landtransfer";
			var item = rows[i].getElementsByClassName("" + i);
			for ( var j = 0; j < item.length; j++) {
				item[j].disabled = "disabled";
			}
		}
		if (style == 1) {
			rows[0].style.display = "";
			var item = rows[0].getElementsByClassName("" + style);
			for ( var i = 0; i < item.length; i++) {
				item[0].disabled = ""; 
			}
		}
	} */

	 	function landtransfer(style) {
			var rows = document.getElementById("tabContract")
					.getElementsByClassName("landtransfer");
			rows[0].style.display = "none";
			rows[0].className = "landtransfer";
			rows[0].getElementsByClassName("1")[0].disabled = "disabled";

			if (style == 1) {
				rows[0].style.display = "";
				rows[0].getElementsByClassName("1")[0].disabled = "";
			} 
		}
</script>

<style type="text/css">
#dlgUploadIDCard {
	display: none;
}

#dlgUploadPhoto {
	display: none;
}

#adress {
	font-size: 14px;
	width: 400px;
}

#client div {<!--
	display: none;
	-->
}


</style>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationRadio.css" rel="stylesheet"
	type="text/css" />
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="dlg">
		<div id="dlgClient">
			<iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
		</div>
		<div id="dlgOperation">

			<div id="dlgAddParcel">
				<input type="button" value="提   交" onclick="parcelAdded()" />
			</div>
			<div id="dlgUploadIDCard">
				<input type="button" value="提   交" onclick="idcardUploaded()" />
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="title">
			<label>协议出租流转申请</label>
		</div>
		<div id="toolbar">
			<table align="right">
				<tr>
					<td><label>预 览</label></td>
					<td><label>提交申请</label></td>
				</tr>
			</table>
		</div>
		<div id="toc">
			<table border="0" align="left" cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="selected" id="default"
						onclick="showTabpane(0)">当事人信息</label></td>
					<td><label onclick="showTabpane(1)">流转土地基本情况</label></td>
					<td><label onclick="showTabpane(2)">权属证明信息</label></td>
					<td><label onclick="showTabpane(3)">转让协议详情</label></td>
				</tr>
			</table>
		</div>
		<div id="client">
			<div id="contact" class="hide">
				<table border="0" cellpadding="0" cellspacing="0" width="98%">
					<tr>
						<td width="200">&nbsp;</td>
						<td><span>申请人（承包人）信息</span></td>
					</tr>
					<tr>
						<td><label for="userPerson.Id">系统编号</label></td>
						<td><input type="text" id="userPerson.Id" disabled="disabled"
							value="${Apply.userPerson.id}" /><input name="userPerson.Id"
							type="hidden" id="userPerson.Id" value="${Apply.userPerson.id}" /></td>
					</tr>
					<tr>
						<td><label for="userPerson.userId">身份证号码</label></td>
						<td><input type="text" id="userPerson.userId" size="18"
							disabled="disabled" value="${Apply.applierIdCode}" /><input
							name="userPerson.userId" type="hidden"
							value="${userPerson.userId}" /></td>
					</tr>
					<tr>
						<td><label for="user.userName">用户姓名</label></td>
						<td><input type="text" id="userPerson.userName" size="20"
							disabled="disabled" value="${Apply.userPerson.userName}" /><input
							name="userPerson.userName" type="hidden"
							value="${Apply.userPerson.userName}" /></td>
					</tr>
					<tr>
						<td><label>申请人住所</label></td>
						<td><input name="textfield" type="text" id="textfield"
							readonly="readonly" value="${Apply.userPerson.address}" /></td>
					</tr>
					<tr>
						<td><label>申请人联系电话</label></td>
						<td><input type="text" name="textfield2" id="textfield2"
							value="${Apply.userPerson.mobilephone}" /></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" id="btnSubmit1" value="保存" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>

			<div id="landinfo" class="hide">
				<form id="form4" name="form4" method="post" action="">
					<table border="0" cellpadding="0" cellspacing="0" width="98%">
						<tr>
							<td colspan="2" rowspan="2">流转土地坐落：</td>
							<td colspan="9"><span id="sprytextfield28"> <input
									name="apply.landProvince" type="text" id="text21" size="10"
									value="${Apply.landProvince}" /></span> 省（自治区、直辖市）<span
								id="sprytextfield22"> <input name="apply.landCity"
									type="text" id="text27" size="10" value="${Apply.landCity}" />
							</span>市（地区、自治州、盟）</td>
						</tr>
						<tr>
							<td colspan="9"><span id="sprytextfield29"> <input
									name="apply.landCounty" type="text" id="text28" size="10"
									value="${Apply.landCounty}" />
							</span>县（区、旗）<span id="sprytextfield30"> <input
									name="apply.landTown" type="text" id="text29" size="10"
									value="${Apply.landTown}" />
							</span>乡（镇、街道）<span id="sprytextfield31"> <input
									name="apply.landVillage" type="text" id="text30" size="10"
									value="${Apply.landVillage}" />
							</span>村（居居委会）</td>
						</tr>
						<tr>
							<td colspan="11">流转总面积：<s:property value="#Apply.landArea" />亩，其中：田<s:property
									value="#Apply.paddyfieldArea" />亩，土<s:property
									value="#Apply.drylandArea" />亩；地块数：<s:property
									value="#Apply.landNumber" />块
							</td>
						</tr>
						<tr>
							<th rowspan="2">序号</th>
							<th rowspan="2">地块名称<br /> （地块编号）
							</th>
							<th rowspan="2">土地类型<br />（田/地）
							</th>
							<th rowspan="2">合同面积<br /> (亩)
							</th>
							<th rowspan="2">实际面积<br /> (亩)
							</th>
							<th rowspan="2">是否<br /> 基本农田
							</th>
							<th colspan="4">四至界限</th>
							<th rowspan="2">操作</th>
						</tr>
						<tr>
							<th width="100">东</th>
							<th width="100">南</th>
							<th width="100">西</th>
							<th width="100">北</th>
						</tr>
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
						<tr>
							<td colspan="11"><input type="submit" id="button"
								value="添加地块信息" onclick="addParcel();" /> <input type="submit"
								name="button6" id="btnSubmit2" value="保存流转土地基本情况" /></td>
						</tr>
					</table>
				</form>
			</div>

			<div id="rightCheck" class="hide">
				<form id="form2" name="form2" method="post" action="">
					<table id="landRightCheck" border="0" cellspacing="0"
						cellpadding="0" width="98%">
						<tr>
							<td width="200"><label>权属证明类型</label></td>
							<td><s:if test="#Apply.rightAuthType1==1">
									<span id="spryradio1"> <label> <input
											name="apply.rightAuthType" type="radio" id="RadioGroup1_0"
											value="1" checked="checked" onclick="landRightCheckType(0)" />
											承包经营权证
									</label> <label> <input type="radio" name="apply.rightAuthType"
											value="2" id="RadioGroup1_1" onclick="landRightCheckType(1)" />
											承包经营合同
									</label>
									</span>
								</s:if> <s:else>
									<span id="spryradio1"> <label> <input
											name="apply.rightAuthType" type="radio" id="RadioGroup1_0"
											value="1" onclick="landRightCheckType(0)" /> 承包经营权证
									</label> <label> <input type="radio" name="apply.rightAuthType"
											value="2" id="RadioGroup1_1" checked="checked"
											onclick="landRightCheckType(1)" /> 承包经营合同
									</label>
									</span>
								</s:else></td>
						</tr>
						<s:if test="#Apply.rightAuthType==1">
							<tr>
								<td width="200"><label>承包经营权证书编号</label></td>
								<td><span id="sprytextfield5"> <input type="text"
										name="apply.originalContractWarrantCode" id="text4"
										value="${Apply.originalContractWarrantCode}" /> <span
										class="textfieldRequiredMsg">承包经营权证编号。</span></span></td>
							</tr>
							<tr>
								<td><label>承包经营权证书扫描件</label></td>
								<td><input type="button" name="button3" id="button3"
									value="上传承包经营权证扫描件" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><img src="#" width="600" height="400" /></td>
							</tr>
							<tr class="hide">
								<td><label>承包经营合同编号</label></td>
								<td><span id="sprytextfield6"> <input type="text"
										name="apply.originalContractCode" id="text5"
										value="${Apply.originalContractCode}" /> <span
										class="textfieldRequiredMsg">承包经营合同号。</span></span></td>
							</tr>
							<tr class="hide">
								<td><label>承包经营合同扫描件</label></td>
								<td><input type="button" name="button4" id="button4"
									value="上传承包经营合同扫描件" /></td>
							</tr>
							<tr class="hide">
								<td>&nbsp;</td>
								<td><img src="#" width="600" height="900" /></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="hide">
								<td width="200"><label>承包经营权证书编号</label></td>
								<td><span id="sprytextfield5"> <input type="text"
										name="apply.originalContractWarrantCode" id="text4"
										value="${Apply.originalContractWarrantCode}" /> <span
										class="textfieldRequiredMsg">承包经营权证编号。</span></span></td>
							</tr>
							<tr class="hide">
								<td><label>承包经营权证书扫描件</label></td>
								<td><input type="button" name="button3" id="button3"
									value="上传承包经营权证扫描件" /></td>
							</tr>
							<tr class="hide">
								<td>&nbsp;</td>
								<td><img src="#" width="600" height="400" /></td>
							</tr>
							<tr>
								<td><label>承包经营合同编号</label></td>
								<td><span id="sprytextfield6"> <input type="text"
										name="apply.originalContractCode" id="text5"
										value="${Apply.originalContractCode}" /> <span
										class="textfieldRequiredMsg">承包经营合同号。</span></span></td>
							</tr>
							<tr>
								<td><label>承包经营合同扫描件</label></td>
								<td><input type="button" name="button4" id="button4"
									value="上传承包经营合同扫描件" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><img src="#" width="600" height="900" /></td>
							</tr>
						</s:else>
						<tr>
							<td></td>
							<td><input type="submit" name="button3" id="btnSubmit3"
								value="提交" /></td>
						</tr>
					</table>
				</form>
			</div>

			<div id="contract" class="hide">
				<form id="form3" name="form3" method="post" action="Apply!saveApply">
					<table border="0" cellspacing="0" cellpadding="0" id="tabContract"
						width="98%">
						<tr class="hide">
							<td></td>
							<td><input id="ApplyID" name="apply.id" type="hidden" value="${Apply.id}" /></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>受让方信息</span></td>
						</tr>
						<tr>
							<td><label>受让方姓名</label></td>
							<td><span id="sprytextfield1"> <input type="text"
									name="rentcontract.transfereePerson.transfereeName" id="text1"
									value="${rentcontract.transfereePerson.transfereeName}" /> <span
									class="textfieldRequiredMsg">受让方姓名，不少于两个字。</span><span
									class="textfieldMinCharsMsg">不少于两个字。</span></span></td>
						</tr>
						<tr>
							<td><label>受让方身份证号码</label></td>
							<td><span id="sprytextfield2"> <input type="text"
									name="rentcontract.transfereePerson.transfereeIdcode"
									id="text2"
									value="${rentcontract.transfereePerson.transfereeIdcode}" /> <span
									class="textfieldRequiredMsg">18位身份证号码。</span><span
									class="textfieldMinCharsMsg">不足18位。</span><span
									class="textfieldMaxCharsMsg">超过18位。</span></span></td>
						</tr>
						<tr>
							<td><label>受让方住所</label></td>
							<td><span id="sprytextarea1"> <textarea
										name="rentcontract.transfereePerson.transfereeAddress"
										id="adress" cols="45" rows="3">
										<s:property
											value="#rentcontract.transfereePerson.transfereeAddress" />
									</textarea> <span id="countsprytextarea1">&nbsp;</span></span></td>
						</tr>
						<tr>
							<td><label>受让方联系电话</label></td>
							<td><span id="sprytextfield3"> <input type="text"
									name="rentcontract.transfereePerson.transfereeTel" id="text3"
									value="${rentcontract.transfereePerson.transfereeTel}" /> <span
									class="textfieldRequiredMsg">11位电话号码。</span><span
									class="textfieldMinCharsMsg">电话话码不足11位。</span><span
									class="textfieldMaxCharsMsg">电话号码超过11位。</span></span></td>
						</tr>
						<tr>
							<td width="200"></td>
							<td><span>流转期限及面积计算办法</span></td>
						</tr>
						<tr>
							<td><label>流转起止期限</label></td>
							<td><span id="sprytextfield7"> <input
									name="rentcontract.dateFrom" type="text" id="text6"
									onclick="HS_setDate(this)"
									<s:if test="#rentcontract.dateFrom!=null">
										value=<s:date name="#rentcontract.dateFrom" format="yyyy-MM-dd" /></s:if>
									size="8" /> <span class="textfieldRequiredMsg">输入起始日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span> 至<span
								id="sprytextfield8"> <input name="rentcontract.dateTo"
									type="text" id="text7" onclick="HS_setDate(this)"
									<s:if test="#rentcontract.dateTo!=null">
										value=<s:date name="#rentcontract.dateTo" format="yyyy-MM-dd" /></s:if>
									size="8" /> <span class="textfieldRequiredMsg">输入终止日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
						<tr>
							<td><label>面积计算办法</label></td>
							<td><span id="spryradio3"> <s:if
										test="#rentcontract.areaType==1">
										<label><input name="rentcontract.areaType"
											type="radio" id="RadioGroup3_0" value="1" checked="checked" />
											实际面积 </label>
										<label> <input name="rentcontract.areaType"
											type="radio" id="RadioGroup3_1" value="2" /> 登记面积
										</label>
									</s:if> <s:else>
										<label><input name="rentcontract.areaType"
											type="radio" id="RadioGroup3_0" value="1" /> 实际面积 </label>
										<label> <input name="rentcontract.areaType"
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
											test="#rentcontract.payType==1||#rentcontract.payType==null">
											<input name="rentcontract.payType" type="radio"
												id="RadioGroup2_0" value="1" checked="checked"
												onclick="paystyle(0)" />
										</s:if> <s:else>
											<input name="rentcontract.payType" type="radio"
												id="RadioGroup2_0" value="1" onclick="paystyle(0)" />
										</s:else> 货币支付
								</label> <label><s:if test="#rentcontract.payType==2">
											<input type="radio" name="rentcontract.payType" value="2"
												id="RadioGroup2_1" onclick="paystyle(1)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="rentcontract.payType" value="2"
												id="RadioGroup2_1" onclick="paystyle(1)" />
										</s:else>实物支付 </label> <label><s:if test="#rentcontract.payType==3">
											<input type="radio" name="rentcontract.payType" value="3"
												id="RadioGroup2_2" onclick="paystyle(2)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="rentcontract.payType" value="3"
												id="RadioGroup2_2" onclick="paystyle(2)" />
										</s:else> 其它 </label>
							</span></td>
						</tr>
						<s:if test="#rentcontract.payType==1||#rentcontract.payType==null">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩人民币<span id="sprytextfield9"> <input
										class="0" name="rentcontract.payType11" type="text" id="text8"
										size="4" value="${rentcontract.payType11}" /> <span
										class="textfieldRequiredMsg">输入流转单价。</span></span>元，以后每年累积递增比例为<span
									id="sprytextfield10"> <input class="0"
										name="rentcontract.payType12" type="text" id="text9" size="2"
										value="${rentcontract.payType12}"
										<s:if
									test="#rentcontract.payType!=1&& #rentcontract.payType!=null"> disabled="disabled" 								
								</s:if> />
										<span class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩人民币<span id="sprytextfield9"> <input
										class="0" name="rentcontract.payType11" type="text" id="text8"
										size="4" value="${rentcontract.payType11}" disabled="disabled" />
										<span class="textfieldRequiredMsg">输入流转单价。</span></span>元，以后每年累积递增比例为<span
									id="sprytextfield10"> <input class="0"
										name="rentcontract.payType12" type="text" id="text9" size="2"
										value="${rentcontract.payType12}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:else>
						<s:if test="#rentcontract.payType==2">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩<span id="sprytextfield11"> <input
										class="1" name="rentcontract.payType21" type="text"
										id="text10" size="4" value="${rentcontract.payType21}" /> <span
										class="textfieldRequiredMsg">输入实物数量。</span></span>斤<span
									id="spryselect1"> <select class="1"
										name="rentcontract.payType22" id="select1">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，以后每年累积递增比例为<span
									id="sprytextfield12"> <input class="1"
										name="rentcontract.payType23" type="text" id="text11" size="2"
										value="${rentcontract.payType23}" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td>第一年流转价款为每亩<span id="sprytextfield11"> <input
										class="1" name="rentcontract.payType21" type="text"
										id="text10" size="4" value="${rentcontract.payType21}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入实物数量。</span></span>斤<span
									id="spryselect1"> <select class="1"
										name="rentcontract.payType22" id="select1" disabled="disabled">
											<option value="1">黄谷</option>
											<option value="2">玉米</option>
											<option value="3">小麦</option>
									</select> <span class="selectRequiredMsg">请选择一个项目。</span></span>，以后每年累积递增比例为<span
									id="sprytextfield12"> <input class="1"
										name="rentcontract.payType23" type="text" id="text11" size="2"
										value="${rentcontract.payType23}" disabled="disabled" /> <span
										class="textfieldRequiredMsg">输入递增比例。</span></span>%。
								</td>
							</tr>
						</s:else>
						<s:if test="#rentcontract.payType==3">
							<tr class="paystyle">
								<td>&nbsp;</td>
								<td><span id="sprytextarea11"> <textarea class="2"
											name="rentcontract.payType31" id="textarea11" rows="5">
										<s:property value="#rentcontract.payType31" />
									</textarea> <span id="countsprytextarea11">&nbsp;</span><span
										class="textareaRequiredMsg">请填写约定的支付方式。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paystyle hide">
								<td>&nbsp;</td>
								<td><span id="sprytextarea11"> <textarea class="2"
											name="rentcontract.payType31" id="textarea11" rows="5"
											disabled="disabled">
										<s:property value="#rentcontract.payType31" />
									</textarea> <span id="countsprytextarea11">&nbsp;</span><span
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
											test="#rentcontract.paytimeType==1||#rentcontract.paytimeType==null">
											<input name="rentcontract.paytimeType" type="radio"
												id="RadioGroup4_0" value="1" checked="checked"
												onclick="paytime(0)" />
										</s:if> <s:else>
											<input name="rentcontract.paytimeType" type="radio"
												id="RadioGroup4_0" value="1" onclick="paytime(0)" />
										</s:else> 提前一年支付 </label> <label><s:if
											test="#rentcontract.paytimeType==2">
											<input type="radio" name="rentcontract.paytimeType" value="2"
												id="RadioGroup4_1" onclick="paytime(1)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="rentcontract.paytimeType" value="2"
												id="RadioGroup4_1" onclick="paytime(1)" />
										</s:else> 逐年支付 </label> <label><s:if
											test="#rentcontract.paytimeType==3">
											<input type="radio" name="rentcontract.paytimeType" value="3"
												id="RadioGroup4_2" onclick="paytime(2)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="rentcontract.paytimeType" value="3"
												id="RadioGroup4_2" onclick="paytime(2)" />
										</s:else> 一次性支付 </label> <label><s:if
											test="#rentcontract.paytimeType==4">
											<input type="radio" name="rentcontract.paytimeType" value="4"
												id="RadioGroup4_3" onclick="paytime(3)" checked="checked" />
										</s:if> <s:else>
											<input type="radio" name="rentcontract.paytimeType" value="4"
												id="RadioGroup4_3" onclick="paytime(3)" />
										</s:else> 其它 </label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>
						<s:if
							test="#rentcontract.paytimeType==1||#rentcontract.paytimeType==null">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield14"> <input
										class="0" name="rentcontract.paytimeType11" type="text"
										id="text13" size="2" value="${rentcontract.paytimeType11}" />
										<span class="textfieldRequiredMsg">输入天数。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span
									id="sprytextfield15"> <input class="0"
										name="rentcontract.paytimeType12" type="text" id="text14"
										size="2" value="${rentcontract.paytimeType12}" /> <span
										class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>月<span
									id="sprytextfield16"> <input class="0"
										name="rentcontract.paytimeType13" type="text" id="text15"
										size="2" value="${rentcontract.paytimeType13}" /> <span
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
										class="0" name="rentcontract.paytimeType11" type="text"
										id="text13" size="2" value="${rentcontract.paytimeType11}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入天数。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span
									id="sprytextfield15"> <input class="0"
										name="rentcontract.paytimeType12" type="text" id="text14"
										size="2" value="${rentcontract.paytimeType12}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>月<span
									id="sprytextfield16"> <input class="0"
										name="rentcontract.paytimeType13" type="text" id="text15"
										size="2" value="${rentcontract.paytimeType13}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付下一年度的出租价款。
								</td>
							</tr>
						</s:else>
						<s:if test="#rentcontract.paytimeType==2">

							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>本合同生效后<span id="sprytextfield13"> <input
										class="1" name="rentcontract.paytimeType21" type="text"
										id="text12" size="2" value="${rentcontract.paytimeType21}" /><span
										class="textfieldRequiredMsg">输入天数。</span>
								</span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span id="sprytextfield17"> <input
										class="1" name="rentcontract.paytimeType22" type="text"
										id="text16" size="2" value="${rentcontract.paytimeType22}" />
										<span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于12。</span></span>月<span
									id="sprytextfield18"> <input class="1"
										name="rentcontract.paytimeType23" type="text" id="text17"
										size="2" value="${rentcontract.paytimeType23}" /> <span
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
										class="1" name="rentcontract.paytimeType21" type="text"
										id="text12" size="2" value="${rentcontract.paytimeType21}"
										disabled="disabled" /><span class="textfieldRequiredMsg">输入天数。</span>
								</span>天内，乙方向甲方一次性支付第一年度的出租价款；以后每年<span id="sprytextfield17"> <input
										class="1" name="rentcontract.paytimeType22" type="text"
										id="text16" size="2" value="${rentcontract.paytimeType22}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入月份。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于12。</span></span>月<span
									id="sprytextfield18"> <input class="1"
										name="rentcontract.paytimeType23" type="text" id="text17"
										size="2" value="${rentcontract.paytimeType23}"
										disabled="disabled" /> <span class="textfieldRequiredMsg">输入日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span><span
										class="textfieldMinValueMsg">输入值小于1。</span><span
										class="textfieldMaxValueMsg">输入值大于31。</span></span>日前，乙方向甲方支付当年度的出租价款。
								</td>
							</tr>
						</s:else>

						<s:if test="#rentcontract.paytimeType==3">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>一次性支付：<span id="sprytextfield19"> <input
										class="2" name="rentcontract.paytimeType31" type="text"
										id="text18" size="10" onclick="HS_setDate(this)"
										value=<s:date name="#rentcontract.paytimeType31" format="yyyy-MM-dd" /> />
										<span class="textfieldRequiredMsg">点击输入支付日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>前，乙方向甲方一次性支付全部出租价款。
								</td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>一次性支付：<span id="sprytextfield19"> <input
										class="2" name="rentcontract.paytimeType31" type="text"
										id="text18" size="10" onclick="HS_setDate(this)"
										disabled="disabled"
										<s:if test="##rentcontract.paytimeType31!=null">
										value=<s:date name="#rentcontract.paytimeType31" format="yyyy-MM-dd" /></s:if> />
										<span class="textfieldRequiredMsg">点击输入支付日期。</span><span
										class="textfieldInvalidFormatMsg">格式无效。</span></span>前，乙方向甲方一次性支付全部出租价款。
								</td>
							</tr>
						</s:else>

						<s:if test="#rentcontract.paytimeType==4">
							<tr class="paytime ">
								<td>&nbsp;</td>
								<td>其它：<span id="sprytextarea51"> <textarea
											class="3" name="rentcontract.paytimeType41" id="textarea12"
											rows="8">
											<s:property value="#rentcontract.paytimeType41" />
										</textarea> <span id="countsprytextarea51">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的支付时间。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="paytime hide">
								<td>&nbsp;</td>
								<td>其它：<span id="sprytextarea51"> <textarea
											class="3" name="rentcontract.paytimeType41" id="textarea12"
											rows="8" disabled="disabled">
											<s:property value="#rentcontract.paytimeType41" />
										</textarea> <span id="countsprytextarea51">&nbsp;</span><span
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
										name="rentcontract.compensation" id="textarea2" rows="8">
										<s:property value="#rentcontract.compensation" />
									</textarea> <span id="countsprytextarea2">&nbsp;</span></span><br />
							</td>
						</tr>
						<tr>
							<td><label>土地交付时间及方式</label></td>
							<td>1.甲方按下列方式将出租土地交付给乙方：<span id="spryradio6"> <label>
										<input name="rentcontract.landtransferType" type="radio"
										id="RadioGroup6_0" value="1"
										<s:if test="#rentcontract.landtransferType==1||#rentcontract.landtransferType==null" >checked="checked"</s:if>
										onclick="landtransfer(0)" /> 一次性全部交付
								</label> <label> <input type="radio"
										name="rentcontract.landtransferType" value="2"
										id="RadioGroup6_1"
										<s:if test="#rentcontract.landtransferType==2">checked="checked"</s:if>
										onclick="landtransfer(1)" /> 其它约定
								</label> <span class="radioRequiredMsg">请进行选择。</span></span></td>
						</tr>

						<s:if test="#rentcontract.landtransferType==2">
							<tr class="landtransfer">
								<td></td>
								<td>交付约定：<span id="sprytextarea13"> <textarea
											class="1" name="rentcontract.landtransferType21"
											id="textarea13" rows="8">
											<s:property value="#rentcontract.landtransferType21" />
										</textarea> <span id="countsprytextarea13">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的土地交付方式。</span></span></td>
							</tr>
						</s:if>
						<s:else>
							<tr class="landtransfer hide">
								<td></td>
								<td>交付约定：<span id="sprytextarea13"> <textarea
											class="1" name="rentcontract.landtransferType21" rows="8"
											disabled="disabled">
											<s:property value="#rentcontract.landtransferType21" />
										</textarea> <span id="countsprytextarea13">&nbsp;</span><span
										class="textareaRequiredMsg">输入约定的土地交付方式。</span></span></td>
							</tr>
						</s:else>

						<tr>
							<td>&nbsp;</td>
							<td>2.交付资料：  <br /> ①土地承包经营权证或承包合同复印件（含红线图）； <br />
								②土地交付时的地形、地貌、土质、青苗、构（附）着物等情况的书面描述、图片等（经双方确认）； <br /> ③ 其它：<span
								id="sprytextarea14"> <textarea
										name="rentcontract.landtransferOtherDatum" id="textarea14"
										rows="8">
										<s:property value="#rentcontract.landtransferOtherDatum" />
									</textarea><span id="countsprytextarea14">&nbsp;</span><span
									class="textareaRequiredMsg">输入其它补充约定。</span></span><br /> 3.交付时间为：<span
								id="sprytextfield20"> <input type="text"
									name="rentcontract.landtransferDate" id="text19"
									onclick="HS_setDate(this)"
									<s:if test="#rentcontract.landtransferDate!=null">
										value=<s:date name="#rentcontract.landtransferDate" format="yyyy-MM-dd" /></s:if> />
									<span class="textfieldRequiredMsg">输入土地交付日期。</span><span
									class="textfieldInvalidFormatMsg">格式无效。</span></span></td>
						</tr>

						<%-- 						<tr>
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
										name="rentcontract.transferorOtherRight" id="textarea3"
										rows="8">
										<s:property value="#rentcontract.transferorOtherRight" />
									</textarea></span></td>
						</tr>
						<tr>
							<td><label>乙方的权利和义务</label></td>
							<td>1.依法享有承租土地的使用权、收益权、自主生产经营权。<br />2.合同期内，改变合同约定主营项目，需经得甲方书面同意。<br />3.依法保护和合理利用土地，不得给土地造成永久性损害。 <br />4.合同期内，对土地进行再流转，需经得甲方书面同意。 <br />5.合同期满后，及时向甲方交还承租的土地承包经营权。  <br />6.其它：<span
								id="sprytextarea4"> <textarea
										name="rentcontract.transfereeOtherRight" id="textarea4"
										rows="8">
										<s:property value="#rentcontract.transfereeOtherRight" />
									</textarea> <span id="countsprytextarea4">&nbsp;</span>
							</span> 
							</td>
						</tr>
						<tr>
							<td><label>合同到期后地上构(附)着物及相关设施的处理</label></td>
							<td>合同期满后，甲方收回该土地承包经营权。乙方对该土地进行投入而提高土地生产能力的、在当时为生产经营需要而设立的相关设施及地上构(附)着物等，双方约定处理方式、时间为：<br />
								<span id="sprytextarea5"> <textarea
										name="rentcontract.endcirculationDisposal" id="textarea5"
										rows="8">
										<s:property value="#rentcontract.endcirculationDisposal" />
									</textarea> <span id="countsprytextarea5">&nbsp;</span><span
									class="textareaRequiredMsg">需要提供一个值。</span></span></td>
						</tr>
						<tr>
							<td><label>合同的变更、解除</label></td>
							<td>1.经双方协商一致，可变更或解除本合同。 <br />
								2.乙方不按照国家法律法规和有关政策规定使用流转土地，给该土地造成永久性损害的，甲方有权解除合同，收回土地承包经营权。 <br />
								3.甲方违反合同约定擅自干涉和破坏乙方的生产与经营,使乙方无法进行正常的生产经营活动的，乙方有权解除合同。 <br />
								4.其它：<span id="sprytextarea6"> <textarea
										name="rentcontract.contractModify" rows="8" id="textarea6">
										<s:property value="#rentcontract.contractModify" />
									</textarea> <span id="countsprytextarea6">&nbsp;</span></span></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>违约责任</span></td>
						</tr>
						<tr>
							<td><label>违约责任</label></td>
							<td>1.乙方不按期支付出租价款的，每延迟壹天，按应付费用的<span id="sprytextfield21">
									<input name="rentcontract.contractBreach11" type="text"
									id="text20" size="2" value="${rentcontract.contractBreach11}" />
									<span class="textfieldRequiredMsg">输入违约金比例。</span>
							</span>%承担违约金；超过<span id="sprytextfield24"> <input
									name="rentcontract.contractBreach12" type="text" id="text23"
									size="2" value="${rentcontract.contractBreach12}" /> <span
									class="textfieldRequiredMsg">输入宽容期限</span></span>天仍未付款的，甲方有权解除合同，收回土地承包经营权。 <br />
								2.甲方不按期交付土地的，每延迟壹天，按出租费用的<span id="sprytextfield23"> <input
									name="rentcontract.contractBreach21" type="text" id="text22"
									size="2" value="${rentcontract.contractBreach21}" /> <span
									class="textfieldRequiredMsg">输入违约金比例。</span></span> %承担违约金；超过<span
								id="sprytextfield25"> <input
									name="rentcontract.contractBreach22" type="text" id="text24"
									size="2" value="${rentcontract.contractBreach22}" /> <span
									class="textfieldRequiredMsg">输入宽容期限。</span></span> 天仍未交付的，乙方有权解除合同。 <br />
								3.一方无故擅自解除合同的，违约方应向对方支付<span id="sprytextfield26"> <input
									name="rentcontract.contractBreach31" type="text" id="text25"
									size="10" value="${rentcontract.contractBreach31}" /> <span
									class="textfieldRequiredMsg">输入违约金金额。</span></span>元违约金。<br />
								4.一方违反合同其他约定的，违约方应向对方支付<span id="sprytextfield27"> <input
									name="rentcontract.contractBreach41" type="text" id="text26"
									size="10" value="${rentcontract.contractBreach41}" /> <span
									class="textfieldRequiredMsg">输入违约金金额。</span></span> 元违约金。<br />5.一方违约给对方造成了损失的，应赔偿损失。 <br />6.违约金不足以弥补对方损失的，违约方应在违约金外增加支付赔偿金，以补足对方损失。 <br />
								7.因不可抗力不能履行合同时，一方当事人应及时通知对方，并在<span id="sprytextfield4"><input
									name="rentcontract.contractBreach71" type="text" id="text31"
									size="2" value="${rentcontract.contractBreach71}" /><span
									class="textfieldRequiredMsg">输入期限。</span></span>日内提供证明，可根据不可抗力的影响，部分或者全部免除责任，但法律另有规定的除外。  <br />8.其它：<span
								id="sprytextarea7"> <textarea
										name="rentcontract.contractBreach81" id="textarea7" cols="45"
										rows="8">
										<s:property value="#rentcontract.contractBreach81" />
									</textarea> <span id="countsprytextarea7">&nbsp;</span></span></td>
						</tr>

						<tr>
							<td width="200"></td>
							<td><span>其它约定</span></td>
						</tr>
						<tr>
							<td><label>其它约定</label></td>
							<td>1.合同期内，该土地涉及的国家有关政策性补贴、补助及其他费用等权利按如下方式处理：<br /> <span
								id="sprytextarea8"> <textarea name="rentcontract.other11"
										id="textarea8" rows="8">
										<s:property value="#rentcontract.other11" />
									</textarea> <span id="countsprytextarea8">&nbsp;</span><span
									class="textareaRequiredMsg">需要提供一个值。</span><span
									class="textareaMaxCharsMsg">已超过最大字符数。</span></span>                 <br />
								2.合同期内，如果该土地被依法征收、征用、占用，相关补偿款按如下方式处理：<br /> <span
								id="sprytextarea9"> <textarea name="rentcontract.other21"
										id="textarea9" rows="8">
										<s:property value="#rentcontract.other21" />
									</textarea> <span id="countsprytextarea9">&nbsp;</span>
							</span>                                    <br />
								3.本合同自双方签字(盖章)后生效。未尽事宜，经双方协商一致后订立补充协议，补充协议与本合同具有同等法律效力。  <br />
								4.双方向乡（镇）人民政府农村土地承包管理部门：<span id="spryradio5"> <label>
										<input name="rentcontract.authentication" type="radio"
										id="RadioGroup5_0" value="1"
										<s:if test="#rentcontract.authentication==1||#rentcontract.authentication==null"> checked="checked" </s:if> />
										申请合同鉴证
								</label> <label> <input type="radio"
										name="rentcontract.authentication" value="2"
										id="RadioGroup5_1"
										<s:if test="#rentcontract.authentication==2"> checked="checked" </s:if> />
										不申请合同鉴证
								</label> <span class="radioRequiredMsg">请进行选择。</span></span><br /> 5.其他：<span
								id="sprytextarea10"> <textarea
										name="rentcontract.other51" id="textarea10" cols="45" rows="8">
										<s:property value="#rentcontract.other51" />
									</textarea> <span id="countsprytextarea10">&nbsp;</span></span> <br />
								6.本合同一式四份，双方各执一份，发包方和镇（乡）人民政府农村土地承包管理部门各备案一份，鉴证备用一份。
							</td>
						</tr> --%>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" value="提交合同信息" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField(
				"sprytextfield1", "none", {
					validateOn : [ "blur", "change" ],
					minChars : 2
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"sprytextfield2", "none", {
					minChars : 18,
					maxChars : 18,
					validateOn : [ "blur", "change" ]
				});
		var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1",
				{
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea1",
					maxChars : 45,
					minChars : 5
				});

		var sprytextarea14 = new Spry.Widget.ValidationTextarea(
				"sprytextarea14", {
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea14"
				});
		var sprytextarea51 = new Spry.Widget.ValidationTextarea(
				"sprytextarea51", {
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea51",
					maxChars : 200,
					minChars : 5
				});
		var sprytextarea11 = new Spry.Widget.ValidationTextarea(
				"sprytextarea11", {
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea11",
					maxChars : 200,
					minChars : 5
				});

		var sprytextfield3 = new Spry.Widget.ValidationTextField(
				"sprytextfield3", "integer", {
					minChars : 11,
					maxChars : 11,
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});

		var spryradio1 = new Spry.Widget.ValidationRadio("spryradio1");
		var sprytextfield5 = new Spry.Widget.ValidationTextField(
				"sprytextfield5", "none", {
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield6 = new Spry.Widget.ValidationTextField(
				"sprytextfield6", "none", {
					validateOn : [ "blur", "change" ]
				});
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
		var spryradio2 = new Spry.Widget.ValidationRadio("spryradio2");
		var spryradio3 = new Spry.Widget.ValidationRadio("spryradio3");
		var sprytextfield9 = new Spry.Widget.ValidationTextField(
				"sprytextfield9", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield10 = new Spry.Widget.ValidationTextField(
				"sprytextfield10", "integer", {
					validateOn : [ "blur", "change" ]
				});
		var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
		var sprytextfield12 = new Spry.Widget.ValidationTextField(
				"sprytextfield12", "integer", {
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield11 = new Spry.Widget.ValidationTextField(
				"sprytextfield11", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
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
		var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea2"
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
		var sprytextarea7 = new Spry.Widget.ValidationTextarea("sprytextarea7",
				{
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea7"
				});
		var sprytextarea8 = new Spry.Widget.ValidationTextarea("sprytextarea8",
				{
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea8",
					validateOn : [ "blur", "change" ]
				});
		var sprytextarea9 = new Spry.Widget.ValidationTextarea("sprytextarea9",
				{
					maxChars : 200,
					validateOn : [ "blur", "change" ],
					counterType : "chars_remaining",
					counterId : "countsprytextarea9"
				});
		var sprytextarea10 = new Spry.Widget.ValidationTextarea(
				"sprytextarea10", {
					validateOn : [ "blur", "change" ],
					maxChars : 200,
					counterType : "chars_remaining",
					counterId : "countsprytextarea10",
					isRequired : false
				});
		var spryradio5 = new Spry.Widget.ValidationRadio("spryradio5");
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
		var spryradio6 = new Spry.Widget.ValidationRadio("spryradio6");
		var sprytextarea13 = new Spry.Widget.ValidationTextarea(
				"sprytextarea13", {
					maxChars : 200,
					validateOn : [ "blur", "change" ],

					counterType : "chars_remaining",
					counterId : "countsprytextarea13"
				});

		var sprytextfield20 = new Spry.Widget.ValidationTextField(
				"sprytextfield20", "date", {
					format : "yyyy-mm-dd",
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield21 = new Spry.Widget.ValidationTextField(
				"sprytextfield21", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield23 = new Spry.Widget.ValidationTextField(
				"sprytextfield23", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield24 = new Spry.Widget.ValidationTextField(
				"sprytextfield24", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur", "change" ]
				});
		var sprytextfield25 = new Spry.Widget.ValidationTextField(
				"sprytextfield25", "integer", {
					useCharacterMasking : true,
					validateOn : [ "blur" ]
				});
		var sprytextfield26 = new Spry.Widget.ValidationTextField(
				"sprytextfield26", "currency", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
		var sprytextfield27 = new Spry.Widget.ValidationTextField(
				"sprytextfield27", "currency", {
					useCharacterMasking : true,
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
		var sprytextfield4 = new Spry.Widget.ValidationTextField(
				"sprytextfield4", "integer", {
					validateOn : [ "blur", "change" ],
					useCharacterMasking : true
				});
	</script>
</body>
</html>
