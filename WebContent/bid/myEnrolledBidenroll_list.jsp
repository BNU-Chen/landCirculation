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
<style type="text/css">
.nohover tr:hover {
	background: #eee;
}
</style>
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
<body onload="resizeWin();">
	<div id="webClient">
		<div id="wrap">
			<div id="title">
				<label>电子交易--竟标报名</label>
			</div>
			<div id="navi">
				<table border="0" cellpadding="0" cellspacing="0" align="right"
					height="100%">
					<tr>

						<td><a href="BidEnroll!listToenrollBidpost">返回竟标报名页面</a></td>

					</tr>
				</table>
			</div>
			<div id="client">
				<div id="tabletitle">
					<label>我的已提交竞标报名</label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="16">序号</th>
						<th width="120">报名编号</th>
						<th width="80">报名截止日</th>
						<th width="80">投标日期</th>
						<th width="80">联系人</th>
						<th width="80">联系电话</th>
						<th width="300">当前状态</th>
						<th>操作</th>
					</tr>
					<s:iterator var="bidenroll" value="#bidenrolls" status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:property value="#bidenroll.enrollNo" /></td>
						<td><s:date name="#bidenroll.applyEndDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#bidenroll.bidDate" format="yyyy-MM-dd" /></td>
						<td><s:property value="#bidenroll.picName" /></td>
						<td><s:property value="#bidenroll.picTel" /></td>
						<td><s:property value="#bidenroll.statusMsg" /></td>
						<td><s:a action="BidPost!previewBidpost">查阅招标公告
													<s:param name="bidpost.id" value="#bidenroll.bidpost.id" />
							</s:a>
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
	</div>
</body>
</html>