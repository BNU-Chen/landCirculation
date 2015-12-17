package cn.ac.irsa.landcirculation;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserPersonUploadPhoto extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private File photo;
	private String photoFileName;
	private String photoContentType;

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	@Override
	public String execute() throws Exception {

		// TODO Auto-generated method stub

		ActionContext context = ActionContext.getContext();
		if (photo == null)
			return "error";
		Date dt = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String saveedFileName = sdf.format(dt)
				+ this.photoFileName.substring(this.photoFileName
						.lastIndexOf("."));

		String serverRealPath = ServletActionContext.getServletContext()
				.getRealPath("/user/upload/photo") + "\\" + saveedFileName;
		File uploadFile = new File(serverRealPath);

		/*
		 * File dir = uploadFile.getParentFile(); if (dir != null &&
		 * !dir.exists()) { dir.mkdirs(); } uploadFile.createNewFile();
		 */

		FileUtils.copyFile(this.photo, uploadFile);
		System.out.println("文件名：" + this.photoFileName);
		System.out.println("扩展名：" + this.photoContentType);
		// System.out.println("文件名2："+photoContentType);

		UserPerson user = (UserPerson) context.getSession().get(
				"CurrentUserPerson");

		try {
			user = UserPersonDao.getUserPerson(user.getId());

			user.setPhotoFilename("upload/photo/" + saveedFileName);
			System.out.println(user.getPhotoFilename());
			UserPersonDao.updateUserPerson(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String UserPersonPhotoWebpath = "upload/photo/" + saveedFileName;
		context.put("userPerson", user);
		System.out.println("当前用户是：" + user.getUserName());
		System.out.println("修改后的用户类型:" + user.getPhotoFilename());

		return "uploadPhotoSuccess";
	}

}
