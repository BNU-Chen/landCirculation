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
	//禁止刷新，回退 
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
	document.oncontextmenu = stop;
</script>
<link href="../common/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
<style type="text/css">
#tdwebClient {
	height: 400px;
}

#wrap {
	margin: auto;
	width: 60%;
	height: 320px;
}

#client {
	margin: auto;
	width: 80%;
	text-align: center;
}
</style>
</head>
<link href="../common/SpryAssets/SpryValidationPassword.css"
	rel="stylesheet" type="text/css" />
<link href="../common/SpryAssets/SpryValidationConfirm.css"
	rel="stylesheet" type="text/css" />
<script src="../common/SpryAssets/SpryValidationPassword.js"
	type="text/javascript"></script>
<script src="../common/SpryAssets/SpryValidationConfirm.js"
	type="text/javascript"></script>
<script src="../common/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById("btRegist").click();
	}

	function init() {
		//alert("init脚本启动");
		/*var clientWidth = document.documentElement.offsetWidth
				|| document.body.offsetWidth;*/
		var clientWidth = window.screen.availWidth;//浏览器可用宽度
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientHeight;
		//alert("\nclientWidth:" + clientWidth+"\nclientHeight:" + clientHeight); 

		//alert("设置前tdwebClient height:"+document.getElementById("tdwebClient").clientHeight);
		document.getElementById("tdwebClient").style.height = clientHeight
				+ "px";
		//alert("设置后tdwebClient height:"+document.getElementById("tdwebClient").clientHeight);

	}
</script>
<script language="javascript" type="text/javascript">
	  jQuery.fn.beforeload = function(options) {
		options = $.extend({
			src : "",
		}, options);
		var self = this;
		self.hide();
		self.load(function() {
			self.show("slow");
		});
		self.attr("src", options.src);
	return $(self);
	};
	$(document).ready(function() {
		// 		$("a").click(function() {
		// 			alert("Hello world!");
		// 		});
		// 		// 		$.each([ 0, 1, 2 ], function(i) {
		// 			alert("Item #" + i + ": " + this);
		// 		});
		// 		$(function() {
		// 			var arr = $.grep([ 1, 2, 3, 4, 5 ], function(i) {
		// 				return i > 2;
		// 			});

		// 			$.each(arr, function(i) {
		// 				alert(i + ":" + this);
		// 			});
		// 		});
		// 		$(function() {
		// 			var settings = {
		// 				validate : false,
		// 				limit : 5,
		// 				name : "foo"
		// 			};
		// 			var options = {
		// 				validate : true,
		// 				name : "bar"
		// 			};
		// 			$.extend(settings, options);
		// 			$.each(settings, function(i) {
		// 				alert(i + "=" + this);
		// 			});
		// 		})
		// 	});
		// 	function jq() {
		// 		var f = $("p").add("span");
		// 		for (var i = 0; i < $(f).size(); i++) {
		// 			alert($(f).eq(i).html());
		// 		}
		// 	};
		$("#btnTest").bind("click", function() {
			$("#imgShow").beforeload({
				"src" : "testimg.JPG"
			}).title("test");
			$("#btnTest").html("点了");
		});
	});
</script>
</head>
<body onload="init();">
	<div id="webClient">
		<table class="layouttable" width="100%" cellspacing="0"
			cellpadding="0">
			<tr>
				<td id="tdwebClient">
					<div id="wrap">
						<div id="title">测试</div>
						<div id="client">
							<table class="contenttable" width="100%" cellspacing="0"
								cellpadding="0">
								<tr class="hide">
									<td><a href="../admin/ActionGroupCode!getActionGroupCodes">功能组测试</a></td>
									<td></td>
								</tr>
								<tr>
									<td><p>Hello</p>
										<p>
											<span>Hello Again</span>
										</p> <a href="#" onClick="jq()">jQuery</a></td>
									<td></td>
								</tr>
								<tr>
									<td><img  id="imgShow" /></td>
									<td><div id="btnTest">加图</div></td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>