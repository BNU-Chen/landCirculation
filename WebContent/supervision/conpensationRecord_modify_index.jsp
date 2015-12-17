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
</head>
<body onload="init();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>流转补偿监管-补偿支付记录备案</label>
			</div>
			<div id="navi">
				<table class="navitable" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<div id="naviItem">
								<s:a action="Conpensation!viewConpensationContract"
									target="ViewTarget">
									<s:param name="conpensationRecord.contractNo"
										value="#conpensationRecord.contractNo" />合同支付约定
					</s:a>
							</div>
							<div id="naviItem">
								<s:a action="Conpensation!viewConpensationRecord"
									target="ViewTarget">
									<s:param name="conpensationRecord.id"
										value="#conpensationRecord.id" />年度支付信息
					</s:a>
							</div>
							<div id="naviItem">
								<s:a action="Conpensation!uploadConpensationRecordimgs"
									target="ViewTarget">
									<s:param name="conpensationRecord.id"
										value="#conpensationRecord.id" />上传支付凭证</s:a>
							</div>
							<div id="naviItem"></div>
							<div id="naviItemMini">
								<s:a
									action="ConpensationRecordimgUpload!previewConpensationRecordimgs"
									target="_new">
									<s:param name="conpensationRecord.id"
										value="#conpensationRecord.id" />预览</s:a>
							</div>
							<div id="naviItemMini">
								<s:a action="Conpensation!submitConpensationRecord">
									<s:param name="conpensationRecord.id"
										value="#conpensationRecord.id" />提交审核</s:a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<s:url var="urlConpesnsationRecordInfo"
				action="Conpensation!viewConpensationRecord">
				<s:param name="conpensationRecord.id" value="#conpensationRecord.id" />
			</s:url>
			<div id="client">
				<iframe id="ViewTarget" name="ViewTarget" height="400"
					src="${urlConpesnsationRecordInfo}" frameborder="0"
					scrolling="auto" width="100%"></iframe>
			</div>
		</div>
	</div>
</body>
</html>