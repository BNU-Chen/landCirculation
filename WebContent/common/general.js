// ��ֹˢ�£�����
/*
 * function onKeyDown() { if ((event.altKey) || ((event.keyCode == 8) &&
 * (event.srcElement.type != "text" && event.srcElement.type != "textarea" &&
 * event.srcElement.type != "password")) || ((event.ctrlKey) && ((event.keyCode ==
 * 78) || (event.keyCode == 82))) || (event.keyCode == 116)) { event.keyCode =
 * 0; event.returnValue = false; } } document.onkeydown = onKeyDown;
 * 
 * function stop() { // ����ǽ�������Ҽ� return false; } document.oncontextmenu = stop;
 */

// ��divʵ�ֵ���ҳ�Ի���
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
	// alert("�ĵ��߶�" + docHeight + "���ø߶�" + clientHeight + "�Ѿ�" + scrolltop);
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

// function uploadPhoto() { //��ʾ�Ի���
// document.getElementById("dlgUploadPhoto").style.display = "block";
// //��ʾ�Ի���رհ�Ŧ
// showdlg("480", "240", "userPersonUploadPhoto.jsp"); //��ʾ�Ի���
// }
// function photoUploaded() {
// document.getElementById("dlg").style.display = "none"; //�رնԻ���
// document.getElementById("dlgUploadPhoto").style.display = "none"; //���ضԻ���رհ�Ŧ
// var d = window.frames["dlgContent"].document; //��öԻ��򴰸�IFrame���ĵ�������

// //alert("ԭ��ַ"+document.getElementById("photo").src);

// document.getElementById("photo").src = d
// .getElementById("userPerson.photoFilename").value; //���Ի��򴰸�IFrame���Ĳ���ͬ����������

// document.getElementById("userPerson.photoFilename").value = d
// .getElementById("userPerson.photoFilename").value;
// //alert(document.getElementById("userPerson.photoFilename").value);

// //document.getElementById("userPerson.city").value = "������";
// }

// ���������<body>�󣬲�������HTML����
// <div id="dlg">
// <div id="dlgClient">
// <iframe id="dlgContent" frameborder="0" scrolling="no"></iframe>
// </div> -->
// <div id="dlgOperation">
// <div id="dlgUploadPhoto">
// <input type="button" value="�� ��" onclick="photoUploaded()" />
// </div>
// <div id="dlgUploadIDCard">
// <input type="button" value="�� ��" onclick="idcardUploaded()" />
// </div>
// </div>
// </div>

function landRightCheckType(checktype) {

	var rows = document.getElementsByClassName("right");
	// alert("rows.length:" + rows.length);
	for ( var i = 0; i < rows.length; i++) {
		rows[i].className = "right hide";// ����������
		// alert("test:i+className\n" + i + " " + rows[i].className);

		var items = document.getElementsByClassName("" + i);
		// alert("items.length:" + items.length);

		for ( var j = 0; j < items.length; j++) {
			// alert("j:" + j);
			// alert("disaled:" + items[j].disabled);
			items[j].disabled = "disabled";// ʧЧ����������
			// alert("disaled?" + items[j].disabled);

		}
		/*
		 * alert("document.getElementById('div0').className:" +
		 * document.getElementById('div0').className);
		 * alert("document.getElementById('div1').className:" +
		 * document.getElementById('div1').className);
		 */
		document.getElementById("div" + i).className = "";// ȥ�����ر�־
		document.getElementById("div" + i).style.display = "none";
		/*
		 * alert("document.getElementById('div0').className:" +
		 * document.getElementById('div0').className);
		 * alert("document.getElementById('div1').className:" +
		 * document.getElementById('div1').className);
		 */

	}

	// rows[checktype].style.display="";//��ʾѡ�����Ӧ����
	rows[checktype].className = "right";
	var items = document.getElementsByClassName("" + checktype);
	for ( var i = 0; i < items.length; i++) {
		items[i].disabled = "";// ʹ����ѡ���Ӧ������
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
