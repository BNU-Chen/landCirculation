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
				<label>招标公告发布</label>
			</div>
			<div id="navi">
				<table class="navitable" cellpadding="0" cellspacing="0">
					<tr>
						<td><div id="naviItemMini">
								<a href="BidPost!listPostingBidposts"><b>【待发布】</b>招标公告</a>
							</div>
							<div id="naviItemMini">
								<a href="BidPost!listPostedBidposts"><b>【已发布】</b>招标公告</a>
							</div></td>
					</tr>
				</table>
			</div>
			<div id="client">
				<div id="tabletitle">
					<table class="tablenoborder" width="100%">
						<tr>
							<td>待招标流转申请列表</td>
						</tr>
					</table>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="4%">序号</th>
						<th width="8%">建立日期</th>
						<th width="11%">申请人姓名</th>
						<th width="15%">申请人身份证号码</th>
						<th width="12%">土地总面积（亩）</th>
						<th width="12%">旱地面积（亩）</th>
						<th width="12%">水田面积（亩）</th>
						<th width="22%">操作</th>
					</tr>
					<s:iterator var="apply" value="#applys" status="st">
						<s:if test="#st.odd">
							<tr style="background-color: lightgreen;">
						</s:if>
						<s:else>
							<tr style="background-color: white;">
						</s:else>
						<td><s:property value="#st.index+1" /></td>
						<td><s:date name="#apply.applyDate" format="yyyy-MM-dd" /></td>
						<td><s:property value="#apply.picName" /></td>
						<td><s:property value="#apply.picIdcode" /></td>
						<td><s:property value="#apply.landRgArea" /></td>
						<td><s:property value="#apply.drylandRgArea" /></td>
						<td><s:property value="#apply.paddyfieldRgArea" /></td>
						<td><s:a action="BidPost!addtoBidpost">添加到招标公告列表
													<s:param name="apply.id" value="#apply.id" />
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