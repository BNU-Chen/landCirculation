// 禁止刷新，回退
/*
 * function onKeyDown() { if ((event.altKey) || ((event.keyCode == 8) &&
 * (event.srcElement.type != "text" && event.srcElement.type != "textarea" &&
 * event.srcElement.type != "password")) || ((event.ctrlKey) && ((event.keyCode ==
 * 78) || (event.keyCode == 82))) || (event.keyCode == 116)) { event.keyCode =
 * 0; event.returnValue = false; } } document.onkeydown = onKeyDown;
 * 
 * function stop() { // 这个是禁用鼠标右键 return false; } document.oncontextmenu = stop;
 */

// 用div实现的网页对话框
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
			|| document.body.clientHeight;
	// alert("文档高度" + docHeight + "可用高度" + clientHeight + "已卷" + scrolltop);
	document.getElementById("dlg").style.marginTop = scrolltop
			+ (clientHeight - dlgHeight) / 2 + "px";

	document.getElementById("dlgClient").style.width = dlgWidth + "px";
	document.getElementById("dlgClient").style.height = dlgHeight - 30 + "px";

	document.getElementById("dlgContent").style.width = dlgWidth + "px";
	document.getElementById("dlgContent").style.height = dlgHeight - 30 + "px";
	// document.getElementById("dlgContent").src="http://www.sina.com.cn";
	document.getElementById("dlgContent").src = url;

	document.getElementById("dlg").style.display = "block";
}

// function uploadPhoto() { //显示对话框
// document.getElementById("dlgUploadPhoto").style.display = "block";
// //显示对话框关闭按纽
// showdlg("480", "240", "userPersonUploadPhoto.jsp"); //显示对话框
// }
// function photoUploaded() {
// document.getElementById("dlg").style.display = "none"; //关闭对话框
// document.getElementById("dlgUploadPhoto").style.display = "none"; //隐藏对话框关闭按纽
// var d = window.frames["dlgContent"].document; //获得对话框窗格（IFrame）文档的引用

// //alert("原地址"+document.getElementById("photo").src);

// document.getElementById("photo").src = d
// .getElementById("userPerson.photoFilename").value; //将对话框窗格（IFrame）的参数同步到主窗格

// document.getElementById("userPerson.photoFilename").value = d
// .getElementById("userPerson.photoFilename").value;
// //alert(document.getElementById("userPerson.photoFilename").value);

// //document.getElementById("userPerson.city").value = "重庆市";
// }

// 在主窗格的<body>后，插入以下HTML代码
// <div id="dlg">
// <div id="dlgClient">
// <iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
// </div> -->
// <div id="dlgOperation">
// <div id="dlgUploadPhoto">
// <input type="button" value="提 交" onclick="photoUploaded()" />
// </div>
// <div id="dlgUploadIDCard">
// <input type="button" value="提 交" onclick="idcardUploaded()" />
// </div>
// </div>
// </div>

function landRightCheckType(checktype) {

	var rows = document.getElementsByClassName("right");
	// alert("rows.length:" + rows.length);
	for ( var i = 0; i < rows.length; i++) {
		rows[i].className = "right hide";// 隐藏所有行
		// alert("test:i+className\n" + i + " " + rows[i].className);

		var items = document.getElementsByClassName("" + i);
		// alert("items.length:" + items.length);

		for ( var j = 0; j < items.length; j++) {
			// alert("j:" + j);
			// alert("disaled:" + items[j].disabled);
			items[j].disabled = "disabled";// 失效所有输入项
			// alert("disaled?" + items[j].disabled);

		}
		/*
		 * alert("document.getElementById('div0').className:" +
		 * document.getElementById('div0').className);
		 * alert("document.getElementById('div1').className:" +
		 * document.getElementById('div1').className);
		 */
		document.getElementById("div" + i).className = "";// 去掉隐藏标志
		document.getElementById("div" + i).style.display = "none";
		/*
		 * alert("document.getElementById('div0').className:" +
		 * document.getElementById('div0').className);
		 * alert("document.getElementById('div1').className:" +
		 * document.getElementById('div1').className);
		 */

	}

	// rows[checktype].style.display="";//显示选中项对应的行
	rows[checktype].className = "right";
	var items = document.getElementsByClassName("" + checktype);
	for ( var i = 0; i < items.length; i++) {
		items[i].disabled = "";// 使能所选项对应输入项
	}
	document.getElementById("div" + checktype).style.display = "";
	/*
	 * alert("document.getElementById('div0').className:" +
	 * document.getElementById('div0').className);
	 * alert("document.getElementById('div1').className:" +
	 * document.getElementById('div1').className);
	 */
}

function showModelDialog(page, width, height) {
	var re = window
			.showModalDialog(
					page,
					null,
					'dialogWidth:'
							+ width
							+ 'mm;dialogHeight:'
							+ height
							+ 'mm;edge:Raised;center:yes;help:no;resizable:no;status:no;scroll:no');
	if (re == 1) {
		window.location.reload();
	}
}
