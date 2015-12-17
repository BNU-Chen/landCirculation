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
<script src="../common/SpryAssets/SpryValidationSelect.js"
	type="text/javascript"></script>
<link href="../common/SpryAssets/SpryValidationSelect.css"
	rel="stylesheet" type="text/css" />
<script src="../common/regioncode.js" type="text/javascript"></script>
</head>
<body onload="send_provinceRequest();>
	<!-- onload="send_provinceRequest();"-->
	<div id="webClient">
		<div id="wrap">
			<div id="divLandAddress">
				<form id="form4" name="form4" method="post"
					action="Apply!saveLandAddress">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr class="hide">
							<td>申请系统编号</td>
							<td><input name="apply.id" type="text" value="${Apply.id}" /></td>
						</tr>
						<tr>
							<td rowspan="2"><label>流转土地坐落：</label></td>
							<td><span id="spryselect1"> <select
									name="apply.landProvince" id="province"
									onchange="send_cityRequest();">
										<option value="-1">--请选择--</option>
								</select>
							</span> 省（自治区、直辖市）<span id="spryselect2"> <select
									name="apply.landCity" id="city"
									onchange="send_countyRequest();">
										<option value="-1">--请选择--</option>
								</select>
							</span>市（地区、自治州、盟）</td>
						</tr>
						<tr>
							<td><span id="spryselect3"> <select
									name="apply.landCounty" id="county"
									onchange="send_townRequest();">
										<option value="-1">--请选择--</option>
								</select>
							</span>县（区、旗）<span id="spryselect4"> <select
									name="apply.landTown" id="town"
									onchange="send_villageRequest();">
										<option value="-1">--请选择--</option>
								</select>
							</span>乡（镇、街道）<span id="spryselect5"> <select
									name="apply.landVillage" id="village">
										<option value="-1">--请选择--</option>
								</select>
							</span>村（居居委会）</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="保存土地座落信息" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		send_provinceRequest();
		var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var spryselect2 = new Spry.Widget.ValidationSelect("spryselect2", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});

		var spryselect3 = new Spry.Widget.ValidationSelect("spryselect3", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var spryselect4 = new Spry.Widget.ValidationSelect("spryselect4", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
		var spryselect5 = new Spry.Widget.ValidationSelect("spryselect5", {
			validateOn : [ "blur", "change" ],
			invalidValue : "-1",
			isRequired : true
		});
	</script>
</body>
</html>
