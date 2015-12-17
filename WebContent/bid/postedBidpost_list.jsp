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
				<label>流转申请招标公告--已发布招标公告</label>
			</div>

			<div id="client">
				<div id="tabletitle">
				<table class="tablenoborder" width="100%"><tr><td>已发布流转申请招标公告</td></tr></table>
					
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="2%">序号</th>
						<th width="8%">发布日期</th>
						<th width="8%">发布机构</th>
						<th width="8%">总面积</th>
						<th width="8%">旱地起价</br>（元/亩）
						</th>
						<th width="8%">水田起价</br>（元/亩）
						</th>
						<th width="8%">保证金（元）</th>
						<th width="8%">报名起始日</th>
						<th width="8%">报名截止日</th>
						<th width="8%">投标日期</th>
						<th width="6%">联系人</th>
						<th width="8%">联系电话</th>
						<th>操作</th>
					</tr>
					<s:iterator var="postedBidpost" value="#postedBidposts" status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:date name="#postedBidpost.publishDate"
								format="yyyy-MM-dd" /></td>
						<td><s:property value="#postedBidpost.posterName" /></td>
						<td><s:property value="#postedBidpost.landRgArea" /></td>
						<td><s:property value="#postedBidpost.drylandBaseprice" /></td>
						<td><s:property value="#postedBidpost.paddyfieldBaseprice" /></td>
						<td><s:property value="#postedBidpost.deposit" /></td>
						<td><s:date name="#postedBidpost.applyStartDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#postedBidpost.applyEndDate"
								format="yyyy-MM-dd" /></td>
						<td><s:date name="#postedBidpost.bidDate" format="yyyy-MM-dd" /></td>
						<td><s:property value="#postedBidpost.picName" /></td>
						<td><s:property value="#postedBidpost.picTel" /></td>
						<td><s:a action="BidPost!previewBidpost">打印招标公告
													<s:param name="bidpost.id" value="#postedBidpost.id" />
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
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>