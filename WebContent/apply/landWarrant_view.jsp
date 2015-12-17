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
<link href="../comnon/general.css" rel="stylesheet" type="text/css" />
<script src="../common/general.js" type="text/javascript"></script>
</head>
<body>
	<div id="webClient">
		<div id="wrap">
			<div id="client">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="rightWarrent">
					<tr>
						<td colspan="3">承包经营权证扫描件--测试</td>
					</tr>
					<tr>
						<td>test<s:property value="#landwarrant.warrantImgPathname12"/><div id="img12">
								
								<img src="${landwarrant.warrantImgPathname12}" width="320"
									height="240" />
								<form action="LandwarrantImgUpload"
									enctype="multipart/form-data" method="post">
									<span>承包经营权证1-2页</br></span> <input name="landwarrantImg"
										type="file" id="fileField" size="8" /> <input type="hidden"
										name="page" value="1" /><input type="hidden" name="apply.id"
										value="${Apply.id}" /><input type="submit" value="上传" />
								</form>
							</div></td>

						<td><div id="img34">
								<img src="${landwarrant.warrantImgPathname34}" width="320"
									height="240" />
								<form action="LandwarrantImgUpload"
									enctype="multipart/form-data" method="post">
									<span>承包经营权证1-2页</br></span> <input name="landwarrantImg"
										type="file" id="fileField" size="8" /> <input type="hidden"
										name="page" value="2" /><input type="hidden" name="apply.id"
										value="${Apply.id}" /><input type="submit" value="上传" />
								</form>
							</div></td>
						<td>
							<div id="img56">
								<img src="${landwarrant.warrantImgPathname56}" width="320"
									height="240" />
								<form action="LandwarrantImgUpload"
									enctype="multipart/form-data" method="post">
									<span>承包经营权证1-2页</br></span> <input name="landwarrantImg"
										type="file" id="fileField" size="8" /> <input type="hidden"
										name="page" value="3" /><input type="hidden" name="apply.id"
										value="${Apply.id}" /><input type="submit" value="上传" />
								</form>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="img78">
								<img src="${landwarrant.warrantImgPathname78}" width="320"
									height="240" />
								<form action="LandwarrantImgUpload"
									enctype="multipart/form-data" method="post">
									<span>承包经营权证1-2页</br></span> <input name="landwarrantImg"
										type="file" id="fileField" size="8" /> <input type="hidden"
										name="page" value="4" /><input type="hidden" name="apply.id"
										value="${Apply.id}" /><input type="submit" value="上传" />
								</form>
							</div>
						</td>
						<td>
							<div id="img90">
								<img src="${landwarrant.warrantImgPathname90}" width="320"
									height="240" />
								<form action="LandwarrantImgUpload"
									enctype="multipart/form-data" method="post">
									<span>承包经营权证1-2页</br></span> <input name="landwarrantImg"
										type="file" id="fileField" size="8" /> <input type="hidden"
										name="page" value="5" /><input type="hidden" name="apply.id"
										value="${Apply.id}" /><input type="submit" value="上传" />
								</form>
							</div>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
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