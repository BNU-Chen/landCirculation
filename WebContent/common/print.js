// JavaScript Document
var hkey_root, hkey_path, hkey_key
hkey_root = "HKEY_CURRENT_USER"
hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"
// 设置网页打印的页眉页脚为空
function pagesetup_report() {
	try {
		var RegWsh = new ActiveXObject("WScript.Shell");
		hkey_key = "header";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
		hkey_key = "footer";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key,
				"&b页码：&p/&P&b &b&d   &t  ");
		hkey_key = "margin_bottom";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.18"); // 0.39相当于把页面设置里面的边距设置为10mm
		hkey_key = "margin_left";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.0");
		hkey_key = "margin_right";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.0");
		hkey_key = "margin_top";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.18");
	} catch (e) {
	}
}
// 设置网页打印的页眉页脚为默认值
function pagesetup_default() {
	try {
		var RegWsh = new ActiveXObject("WScript.Shell");
		hkey_key = "header";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "&w&b页码:&p/&P");
		hkey_key = "footer";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "&u&b&d");
	} catch (e) {
	}
}

function pagesetup_null() {
	var hkey_root, hkey_path, hkey_key;
	hkey_root = "HKEY_CURRENT_USER";
	hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
	try {
		var RegWsh = new ActiveXObject("WScript.Shell");
		hkey_key = "header";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
		hkey_key = "footer";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
	} catch (e) {
	}
}
