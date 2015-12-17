<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>农村土地承包经营权管理系统</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	color: #FFF;
}

a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}

.bg{
background:url(./common/images/sy.jpg);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;
/*Webkit*/
-webkit-background-size:100% 100%;
/*Presto*/
-o-background-size:100% 100%;}
.f1{
	background:url(./common/images/zc.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f1:hover{
	background:url(./common/images/zc1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f2{
	background:url(./common/images/zr.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f2:hover{
	background:url(./common/images/zr1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f3{
	background:url(./common/images/zj.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f3:hover{
	background:url(./common/images/zj1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f4{
	background:url(./common/images/jg.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f4:hover{
	background:url(./common/images/jg1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f5{
	background:url(./common/images/yh.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f5:hover{
	background:url(./common/images/yh1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f6{
	background:url(./common/images/gl.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f6:hover{
	background:url(./common/images/gl1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f7{
	background:url(./common/images/tg.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
.f7:hover{
	background:url(./common/images/tg1.gif);
filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
-moz-background-size:100% 100%;
    background-size:100% 100%;}
}

</style>
<script language="javascript">
	function init() {
		 //alert("init脚本启动"); 
		/*var clientWidth = document.documentElement.offsetWidth
				|| document.body.offsetWidth;*/
		var clientWidth = window.screen.availWidth;//浏览器可用宽度
		var clientHeight = document.documentElement.clientHeight
				|| document.body.clientHeight;
		//alert("\nclientWidth:" + clientWidth+"\nclientHeight:" + clientHeight); 
		//alert("设置前desktop height:"+document.getElementById("desktop").clientHeight);
		document.getElementById("desktop").style.height = clientHeight+"px";//全屏高度
		//alert("设置后desktop height:"+document.getElementById("desktop").clientHeight);
		//alert("设置前bkgnd height:"+document.getElementById("bkgnd").clientHeight);
		document.getElementById("bkgnd").style.height = clientHeight*.8+"px";
		//alert("设置后bkgnd height:"+document.getElementById("bkgnd").clientHeight);
	
		document.getElementById("navi").style.height = document.getElementById("bkgnd").clientHeight*.35+"px";

	}
</script>
</head>
<body onload="init();" onresize="init();">
<table  id="desktop" width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr>
				<td width="100%" bgcolor="#EEE"><table id="bkgnd" width="100%" height="80%" border="0" cellspacing="0" cellpadding="0" class="bg">
								<tr height="50%"><td ></td></tr>
								<tr height="35%"><td ><table id="navi" width="100%" height="100%" border="0" cellspacing="3" cellpadding="0">
										<tr height="12.5%">
												<td width="30%">&nbsp;</td>
												<td class="f1" bgcolor="#FFFFFF" width="16%"><a href="./user/login.jsp"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												<td class="f2" bgcolor="#FFFFFF" width="16%"><a href="http://www.sina.com.cn"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												<td class="f3" bgcolor="#FFFFFF" width="16%"><a href="http://www.sina.com.cn"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												<td class="f7" rowspan="2" bgcolor="#FFFFFF" width="16%"><a href="./user/register.jsp"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												<td width="6%" ></td>
												
										</tr>
										<tr  height="12.5%">
												<td>&nbsp;</td>
												<td class="f4" bgcolor="#FFFFFF"><a href="http://www.sina.com.cn"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												<td class="f5" bgcolor="#FFFFFF"><a href="http://www.sina.com.cn"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												<td class="f6" bgcolor="#FFFFFF"><a href="./user/userPersonRegister.jsp"><div style="width:100%;height:100%">&nbsp;</div></a></td>
												</tr>
								</table></td></tr>
								<tr height="15%"><td ></td></tr>
				</table></td>
		</tr>
</table>
</body>
</html>