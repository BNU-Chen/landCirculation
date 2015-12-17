var xmlHttp;
function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}

}
function send_provinceRequest() {
	createXMLHttpRequest();
	// var year = document.getElementById("province");
	// var url = "../common/CodeProvince!listProvinceAll?sn=" + Math.random();
	var url = "../common/CodeProvince!listProvinceAll";
	// alert("URL:" + url);
	if (xmlHttp != null) {
		// alert("xmlHttp ²»Îª¿Õ");
		xmlHttp.open("POST", url, true);
		xmlHttp.onreadystatechange = provinceHandler;
		xmlHttp.send(null);
	}

}

function provinceHandler() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {
			var doc = xmlHttp.responseXML;
			// alert("response XML:" + doc);
			var list = doc.documentElement.getElementsByTagName("option");
			// alert("Number:" + list.length);
			var select = document.getElementById("province");
			select.options.length = 0;
			for ( var i = 0; i < list.length; i++) {
				var opt = new Option(list.item(i).childNodes[0].nodeValue, list
						.item(i).attributes.getNamedItem("value").nodeValue);
				select.appendChild(opt);
			}
		}
	}
}

function send_cityRequest() {
	createXMLHttpRequest();
	var provincecode = document.getElementById("province").value;
	// var url = "../common/CodeCity!listCityByProvinceCode?provinceCode=11";
	var url = "../common/CodeCity!listCityByProvinceCode?provinceCode="
			+ provincecode;
	// alert("url:" + url);
	if (xmlHttp != null) {
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = cityHandler;
		xmlHttp.send(null);
	}
}

function cityHandler() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {

			var doc = xmlHttp.responseXML
			// alert("response XML:" + doc);
			var list = doc.documentElement.getElementsByTagName("option");
			// alert("Number:" + list.length);
			var select = document.getElementById("city");
			select.options.length = 0;
			for ( var i = 0; i < list.length; i++) {
				var opt = new Option(list.item(i).childNodes[0].nodeValue, list
						.item(i).attributes.getNamedItem("value").nodeValue);
				select.appendChild(opt);
			}
		}
	}
}
function send_countyRequest() {
	createXMLHttpRequest();
	var citycode = document.getElementById("city").value;
	// alert("citycode:" + citycode);
	// var url = "../common/CodeCity!listCityByProvinceCode?provinceCode=11";
	var url = "../common/CodeCounty!listCountyByCityCode?cityCode=" + citycode;
	// alert("url:" + url);
	if (xmlHttp != null) {
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = countyHandler;
		xmlHttp.send(null);

	}
}

function countyHandler() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {

			var doc = xmlHttp.responseXML;
			// alert("response XML:" + doc);
			var list = doc.documentElement.getElementsByTagName("option");
			// alert("Number:" + list.length);
			var select = document.getElementById("county");
			select.options.length = 0;
			for ( var i = 0; i < list.length; i++) {
				var opt = new Option(list.item(i).childNodes[0].nodeValue, list
						.item(i).attributes.getNamedItem("value").nodeValue);
				select.appendChild(opt);
			}
		}
	}
}
function send_townRequest() {
	createXMLHttpRequest();
	var countycode = document.getElementById("county").value;
	// alert("countycode:" + countycode);
	// var url = "../common/CodeCity!listCityByProvinceCode?provinceCode=11";
	var url = "../common/CodeTown!listTownByCountyCode?countyCode="
			+ countycode;
	// alert("url:" + url);
	if (xmlHttp != null) {
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = townHandler;
		xmlHttp.send(null);

	}
}

function townHandler() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {

			var doc = xmlHttp.responseXML;
			// alert("response XML:" + doc);
			var list = doc.documentElement.getElementsByTagName("option");
			// alert("Number:" + list.length);
			var select = document.getElementById("town");
			select.options.length = 0;
			for ( var i = 0; i < list.length; i++) {
				var opt = new Option(list.item(i).childNodes[0].nodeValue, list
						.item(i).attributes.getNamedItem("value").nodeValue);
				select.appendChild(opt);
			}
		}
	}
}
function send_villageRequest() {
	createXMLHttpRequest();
	var towncode = document.getElementById("town").value;
	// alert("countycode:" + countycode);
	// var url = "../common/CodeCity!listCityByProvinceCode?provinceCode=11";
	var url = "../common/CodeVillage!listVillageByTownCode?townCode="
			+ towncode;
	// alert("url:" + url);
	if (xmlHttp != null) {
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = villageHandler;
		xmlHttp.send(null);

	}
}

function villageHandler() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {

			var doc = xmlHttp.responseXML;
			// alert("response XML:" + doc);
			var list = doc.documentElement.getElementsByTagName("option");
			// alert("Number:" + list.length);
			var select = document.getElementById("village");
			select.options.length = 0;
			for ( var i = 0; i < list.length; i++) {
				var opt = new Option(list.item(i).childNodes[0].nodeValue, list
						.item(i).attributes.getNamedItem("value").nodeValue);
				select.appendChild(opt);
			}
		}
	}
}
