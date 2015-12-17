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
				<label>电子交易招标公告--拟发布招标公告</label>
			</div>

			<div id="client">
				<div id="tabletitle">
					<label>拟发布招标公告</label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="4%">序号</th>
						<th width="10%">发布日期</th>
						<th width="15%">招标机构</th>
						<th width="10%">报名起始日期</th>
						<th width="10%">报名结束日期</th>
						<th width="10%">投标日期</th>
						<th width="10%">联系人</th>
						<th width="15%">联系电话</th>
						<th>操作</th>
					</tr>
					<s:iterator var="postingBidpost" value="#postingBidposts"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:date name="#postingBidpost.publishDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#postingBidpost.posterName" /></td>
						<td><s:date name="#postingBidpost.applyStartDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#postingBidpost.applyEndDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#postingBidpost.bidDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#postingBidpost.picName" /></td>
						<td><s:property value="#postingBidpost.picTel" /></td>
						<td><s:a action="BidPost!updateBidpost">修改
													<s:param name="bidpost.id" value="#postingBidpost.id" />
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
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>