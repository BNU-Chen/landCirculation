//绂佹鍒锋柊锛屽洖閫�
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

function stop() { // 杩欎釜鏄鐢ㄩ紶鏍囧彸閿�
	return false;
}
document.oncontextmenu = stop;

// 鐢╠iv瀹炵幇鐨勭綉椤靛璇濇

function showdlg(dlgWidth, dlgHeight, url) {

	document.getElementById("dlg").style.width = dlgWidth + "px";
	document.getElementById("dlg").style.height = dlgHeight + "px";
	clientWidth = document.documentElement.clientWidth
			|| document.body.clientwidth;

	document.getElementById("dlg").style.marginLeft = (clientWidth - dlgWidth)
			/ 2 + "px";

	scrolltop = document.documentElement.scrollTop || document.body.scrollTop;
	docHeight = document.documentElement.scrollHeight
			|| document.body.scrollHeight;
	clientHeight = document.documentElement.clientHeight
			|| document.body.clientHeight

	// alert("鏂囨。楂樺害锛�+docHeight+"鍙敤灞忛珮锛�+clientHeight+"宸插嵎锛�+scrolltop);
	document.getElementById("dlg").style.marginTop = scrolltop
			+ (clientHeight - dlgHeight) / 2 - 30 + "px";

	document.getElementById("dlgClient").style.width = dlgWidth + "px";
	document.getElementById("dlgClient").style.height = dlgHeight - 30 + "px";

	document.getElementById("dlgContent").style.width = dlgWidth + "px";
	document.getElementById("dlgContent").style.height = dlgHeight - 30 + "px";
	// document.getElementById("dlgContent").src="http://www.sina.com.cn";
	document.getElementById("dlgContent").src = url;

	document.getElementById("dlg").style.display = "block";
}

// function uploadPhoto() { //鏄剧ず瀵硅瘽妗�
// document.getElementById("dlgUploadPhoto").style.display = "block";
// //鏄剧ず瀵硅瘽妗嗗叧闂寜绾�
// showdlg("480", "240", "userPersonUploadPhoto.jsp"); //鏄剧ず瀵硅瘽妗�
// }
// function photoUploaded() {
// document.getElementById("dlg").style.display = "none"; //鍏抽棴瀵硅瘽妗�
// document.getElementById("dlgUploadPhoto").style.display = "none";
// //闅愯棌瀵硅瘽妗嗗叧闂寜绾�
// var d = window.frames["dlgContent"].document; //鑾峰緱瀵硅瘽妗嗙獥鏍硷紙IFrame锛夋枃妗ｇ殑寮曠敤

// //alert("鍘熷湴鍧�+document.getElementById("photo").src);

// document.getElementById("photo").src = d
// .getElementById("userPerson.photoFilename").value;
// //灏嗗璇濇绐楁牸锛圛Frame锛夌殑鍙傛暟鍚屾鍒颁富绐楁牸

// document.getElementById("userPerson.photoFilename").value = d
// .getElementById("userPerson.photoFilename").value;
// //alert(document.getElementById("userPerson.photoFilename").value);

// //document.getElementById("userPerson.city").value = "閲嶅簡甯�;
// }

// 鍦ㄤ富绐楁牸鐨�body>鍚庯紝鎻掑叆浠ヤ笅HTML浠ｇ爜
// <div id="dlg">
// <div id="dlgClient">
// <iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
// </div>
// <div id="dlgOperation">
// <div id="dlgUploadPhoto">
// <input type="button" value="鎻� 浜� onclick="photoUploaded()" />
// </div>
// <div id="dlgUploadIDCard">
// <input type="button" value="鎻� 浜� onclick="idcardUploaded()" />
// </div>
// </div>
// </div>

function resizeWin() { // 通过表格实现垂直居中
	var clientHeight = document.documentElement.clientHeight
			|| document.body.clientHeight;
	document.getElementById("webClient").style.height = clientHeight*.8 + "px";
	// alert("客户区高度：" + clientHeight + "表格高度："
	// + document.getElementById("webClient").style.height);
}
