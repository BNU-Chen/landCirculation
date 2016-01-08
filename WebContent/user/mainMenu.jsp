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
<script language="JavaScript">
	/* //禁止刷新，回退 
	function onKeyDown() {
		if ((event.altKey)
				|| ((event.keyCode == 8) && (event.srcElement.type != "text"
						&& event.srcElement.type != "textarea" && event.srcElement.type != "password"))
				|| ((event.ctrlKey) && ((event.keyCode == 78) || (event.keyCode == 82)))
				|| (event.keyCode == 116)) {
			event.keyCode = 0;
			event.returnValue = false;
		}
	}
	document.onkeydown = onKeyDown;

	function stop() { //这个是禁用鼠标右键 
		return false;
	}
	document.oncontextmenu = stop; */
	if (!document.getElementsByClassName) {
		/* alert("test4:"); */
		document.getElementsByClassName = function(strClassName, oElm,
				strTagName) {
			var arrElements = document.getElementsByTagName("*");

			var arrReturnElements = new Array();
			strClassName = strClassName.replace(/\-/g, "\\-");
			var oRegExp = new RegExp("(^|\\s)" + strClassName + "(\\s|$)");
			var oElement;
			for (var i = 0; i < arrElements.length; i++) {
				oElement = arrElements[i];
				if (oRegExp.test(oElement.className)) {
					arrReturnElements.push(oElement);
				}
			}
			/* alert("test3:" + arrReturnElements.length); */
			return (arrReturnElements);
		};
	}
	function showhide(item) {
		//alert("执行了测试：");
		var menuitems = document.getElementsByClassName("menuitem");
		//alert("menuitems.length:"+menuitems.length);
		for (var i = 0; i < menuitems.length; i++) {
			menuitems[i].style.display = "none";
			menuitems[i].className = "menuitem";
		}
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientheight;
		document.getElementById("menuitem" + item).style.height = clientHeight
				- 31 * menuitems.length + "px";
		document.getElementById("menuitem" + item).style.display = "";
		//alert(document.getElementById('item0').style.display);
	}
</script>
<style type="text/css">
#menu {
	width: 200px;
	margin: 0px;
	padding: 0px;
	height: 600px;
}

body {
	margin: 0px;
	background-color: #dae6f4;
	font-size: 14px;
}

.heigh2 {
	height: 45px;
	line-height: 1.5;
	text-indent: 20px;
	padding-left: 5px;
}

ul {
	list-style-position: outside;
	list-style-image: none;
	list-style-type: none;
	background: #CCC;
	padding: 0px;
	margin: 0px;
}

li {
	background: #FFF;
	list-style-position: outside;
	list-style-image: none;
	list-style-type: none;
	margin: 0px;
	height: 30px;
	border-top: 1px none #CCC;
	border-right: 1px none #CCC;
	border-bottom: 1px solid #CCC;
	border-left: 1px none #CCC;
	line-height: 30px;
	text-indent: 10px;
	padding: 0px;
}

#menu div {
	margin: 0px;
	padding: 0px;
	line-height: 20px;
}

#menu .menul1 {
	background: #999;
	height: 30px;
	color: #FFF;
	line-height: 30px;
	margin: 0px;
	padding: 0px 0px 0px 0px;
	border-top: 1px none #FFF;
	border-right: 1px solid #CCC;
	border-bottom: 1px solid #FFF;
	border-left: 1px solid #CCC;
	text-indent: 5px;
	cursor: pointer;
}

a:link {
	color: #000;
	text-decoration: none;
}

.menul1 a {
	color: #FFF;
	text-decoration: none;
}

.menul1 a:visited {
	color: #FFF;
	text-decoration: none;
}

.menul1 a:hover {
	background: #dae6f4;
	color: #F00;
}

.hide {
	display: none;
}

.menuitem {
	border-right: 1px solid #CCC;
	border-left: 1px solid #CCC;
	border-top-width: 1px;
	border-bottom-width: 1px;
	border-top-color: #CCC;
	border-bottom-color: #CCC;
	background: #CCC;
}

a:visited {
	text-decoration: none;
	color: #000;
}

a:hover {
	background: #dae6f4;
	color: #F00;
}

a {
	height: 30px;
	width: 198px;
	display: block;
}
</style>
</head>
<body>
	<div id="menu">
		<div class="menul1" onclick="showhide(1)">供求信息发布与推送</div>
		<div id="menuitem1" class="menuitem hide">
			<ul>
				<li><a
					href="../circulationDemand/CirculationDemand!listtoSubmitCirculationDemand"
					target="contentTarget">土地转入需求登记</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiansuo_publish/"
					target="contentTarget">通知公告</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiansuo_gong/"
					target="contentTarget">供地信息检索与发布推送</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiansuo_qiu/"
					target="contentTarget">需求信息检索与发布推送</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiansuo_multi/"
					target="contentTarget" onclick="hideMenu()">多组合条件精准检索</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiansuo_liuzhuan/"
					target="contentTarget" onclick="hideMenu()">流转信息查询统计</a></li>
				<!-- <li><a
					href="http://localhost:8080/landCirculationPlus/moduleh/index.html"
					target="contentTarget" onclick="hideMenu()">流转供求信息精准检索</a></li> -->
			</ul>
		</div>
		<div class="menul1" onclick="showhide(2)">流转申请</div>
		<div id="menuitem2" class="menuitem hide">
			<ul>
				<li><a href="../apply/Apply!listtoSubmitApply_rent"
					target="contentTarget">出租申请</a></li>
				<li><a href="../apply/Apply!listtoSubmitApply_share"
					target="contentTarget">入股申请</a></li>
				<li><a href="../apply/Apply!listtoSubmitApply_assignment"
					target="contentTarget">转让申请</a></li>
				<li><a href="../apply/Apply!listtoSubmitApply_subcontract"
					target="contentTarget">转包申请</a></li>
				<li><a href="../apply/Apply!listtoSubmitApply_exchange"
					target="contentTarget">互换申请</a></li>
			</ul>
		</div>
		<div class="menul1" onclick="showhide(3)">申请审核</div>
		<div id="menuitem3" class="menuitem hide">
			<ul>
				<li><a
					href="../reviewApply/ReviewApply!listtoReviewApplys_agreement"
					target="contentTarget">协议流转申请审核</a></li>
				<li><a href="../reviewApply/ReviewApply!listtoReviewApplys_bid"
					target="contentTarget">委托交易申请审核</a></li>
			</ul>
		</div>
		<div class="menul1" onclick="showhide(4)">信息公示</div>
		<div id="menuitem4" class="menuitem hide">
			<ul>
				<li><a href="../postApply/PostApply!listTobepostApplys"
					target="contentTarget">公示信息发布</a></li>
				<li><a href="../postApply/PostApply!listPostingPostApplys"
					target="contentTarget">公示反馈登记</a></li>
				<li><a
					href="../postApply/ApplypostResponse!listTodealApplypostResponse"
					target="contentTarget">公示反馈处理</a></li>
				<li><a href="../postApply/PostApply!listToAnnounceApplypost"
					target="contentTarget">公示结果公告</a></li>
			</ul>
		</div>
		<div class="menul1" onclick="showhide(5)">电子交易</div>
		<div id="menuitem5" class="menuitem hide">
			<ul>
				<li><a href="../bid/BidPost!listTopostBidApplys"
					target="contentTarget">电子交易公告</a></li>
				<li><a href="../bid/BidEnroll!listToenrollBidpost"
					target="contentTarget">竞标报名</a></li>
				<li><a href="../bid/BidEnroll!listToreviewBidenroll"
					target="contentTarget">竞标报名审核</a></li>
				<li><a href="../bid/BidTender!listTotenderBidenroll"
					target="contentTarget">电子招标竞标</a></li>
				<li><a href="../bid/BidOpen!listToopenBidpost"
					target="contentTarget">电子招标开标</a></li>
				<!-- <li><a href="#">电子拍卖竞标</a></li>
				<li><a href="#">竞争性谈判竞标</a></li> -->
				<li><a href="../bid/BidClose!listTocloseBidpost"
					target="contentTarget">竞标结果公示</a></li>
			</ul>
		</div>
		<div class="menul1" onclick="showhide(6)">网签网备</div>
		<div id="menuitem6" class="menuitem hide">
			<ul>
				<li><a
					href="../contract/ContractSign!listtosignContractApplys_agreement"
					target="contentTarget">协议流转项目合同更正</a></li>
				<li><a
					href="../contract/ContractSign!listtosignContractApplys_bid"
					target="contentTarget">电子交易项目合同填报</a></li>
				<li><a
					href="../contract/ContractSign!listtoreviewContractApplys"
					target="contentTarget">网签合同审核</a></li>
				<li><a
					href="../contract/ContractSign!listtoPrintContractApplys"
					target="contentTarget">网签合同电子版下载</a></li>
				<li><a
					href="../contract/ContractSign!listtofillingContractApplys"
					target="contentTarget">合同网上备案信息填报</a></li>
				<li><a
					href="../contract/ContractSign!listtoreviewContractfillingApplys"
					target="contentTarget">合同网上备案信息审核</a></li>
			</ul>
		</div>
		<div class="menul1" onclick="showhide(7)">交易态势分析</div>
		<div id="menuitem7" class="menuitem hide">
			<ul>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiaoyi_taishi/"
					target="contentTarget">交易态势查询</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiaoyi_jiage/"
					target="contentTarget">按交易价格分析</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiaoyi_liang/"
					target="contentTarget">按交易量分析</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiaoyi_cishu/"
					target="contentTarget">按交易次数分析</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiaoyi_quyu/"
					target="contentTarget">按交易区域分析</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/jiaoyi_yichang/"
					target="contentTarget">交易态势异常分析</a></li>
			</ul>
		</div>
		<div class="menul1" onclick="showhide(8)">收益溯源分配</div>
		<div id="menuitem8" class="menuitem hide">
			<ul>
				<li><a
					href="http://localhost:8080/landCirculationPlus/shouyi_dengji/"
					target="contentTarget">收益登记</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/shouyi_chaxun/"
					target="contentTarget">收益查询</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/shouyi_tongji/"
					target="contentTarget">统计分析</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/shouyi_yichang/"
					target="contentTarget">异常分析</a></li>
			</ul>
		</div>

		<div class="menul1" onclick="showhide(11)">系统管理</div>
		<div id="menuitem11" class="menuitem hide">
			<ul>
				<li><a href="../user/userPerson!viewUserPerson"
					target="contentTarget">用户信息完善</a></li>
				<li><a href="../user/userPersonUpdatePassword.jsp"
					target="contentTarget">修改登录密码</a></li>
				<li><a href="../user/userPerson!reviewList"
					target="contentTarget">管理员：信息审核</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/db_users/"
					target="contentTarget">用户权限管理</a></li>
				<li><a
					href="http://localhost:8080/landCirculationPlus/db_backup/"
					target="contentTarget">数据库备份与恢复</a></li>
				<li><a href="http://localhost:8080/landCirculationPlus/db_log/"
					target="contentTarget">系统日志</a></li>
				<!-- <li><a href="#">管理员：密码重置</a></li>
				<li><a href="../admin/ActionGroupCode!getActionGroupCodes"
					target="contentTarget">功能组管理</a></li>
				<li><a target="contentTarget">功能-角色授权</a></li>
				<li><a target="contentTarget">用户-角色管理</a></li> -->
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
	function hideMenu() {
		//window.parent.hide();
	}
</script>
</html>
