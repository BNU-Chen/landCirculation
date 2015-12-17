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
				<label>电子交易--竞标结果公告</label>
			</div>
			<div id="navi">
				<table class="navitable" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td><div id="naviItem">
								<a href="BidPost!listClosedBidpost">已发布中标结果公告</a>
							</div></td>
					</tr>
				</table>
			</div>
			<div id="client">
				<div id="tabletitle">
					<label>待发布竞标结果公告项目列表</label>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="16">序号</th>
						<th width="90">招标编号</th>
						<th width="100">发布机构</th>
						<th width="80">总面积</th>
						<th width="80">起 价（元/亩）</th>
						<th width="80">保证金（元）</th>
						<th width="80">报名截止日</th>
						<th width="80">投标日期</th>
						<th width="80">联系人</th>
						<th width="80">联系电话</th>
						<th>操作</th>
					</tr>
					<s:iterator var="tocloseBidpost" value="#tocloseBidposts"
						status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:property value="#tocloseBidpost.postNo" /></td>
						<td><s:property value="#tocloseBidpost.posterName" /></td>
						<td><s:property value="#tocloseBidpost.landRgArea" /></td>
						<td><s:property value="#tocloseBidpost.basePrice" /></td>
						<td><s:property value="#tocloseBidpost.deposit" /></td>
						<td><s:date name="#tocloseBidpost.applyEndDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#tocloseBidpost.bidDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#tocloseBidpost.picName" /></td>
						<td><s:property value="#tocloseBidpost.picTel" /></td>
						<td><s:a action="BidClose!listTocloseBidtender">发布竞标结果公告
													<s:param name="bidpost.id" value="#tocloseBidpost.id" />
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
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>