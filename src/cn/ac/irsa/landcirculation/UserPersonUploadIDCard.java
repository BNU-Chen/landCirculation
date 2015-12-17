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

public class UserPersonUploadIDCard extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private final String subdir = "upload/IDCard/";
	private int page;
	private File IDCard;
	private String IDCardFileName;
	private String IDCardContentType;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public File getIDCard() {
		return IDCard;
	}

	public void setIDCard(File iDCard) {
		IDCard = iDCard;
	}

	public String getIDCardFileName() {
		return IDCardFileName;
	}

	public void setIDCardFileName(String iDCardFileName) {
		IDCardFileName = iDCardFileName;
	}

	public String getIDCardContentType() {
		return IDCardContentType;
	}

	public void setIDCardContentType(String iDCardContentType) {
		IDCardContentType = iDCardContentType;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		if (IDCard == null)
			return "error";
		Date dt = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

		String saveedFileName = sdf.format(dt)
				+ this.IDCardFileName.substring(this.IDCardFileName
						.lastIndexOf("."));

		String serverRealPath = ServletActionContext.getServletContext()
				.getRealPath("user/" + subdir) + "\\" + saveedFileName;
		
		File uploadFile = new File(serverRealPath);

		FileUtils.copyFile(this.IDCard, uploadFile);
		//System.out.println("文件名：" + this.IDCardFileName);

		// System.out.println("文件名2："+photoContentType);

		UserPerson user = (UserPerson) context.getSession().get(
				"CurrentUserPerson");

		try {
			user = UserPersonDao.getUserPerson(user.getId());
			if (page == 1) {
				user.setIdcard1(subdir + saveedFileName);
				System.out.println(user.getIdcard1());
			} else {
				user.setIdcard2(subdir + saveedFileName);
				System.out.println(user.getIdcard2());
			}

			UserPersonDao.updateUserPerson(user);
			context.put("userPerson", UserPersonDao.getUserPerson(user.getId()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("当前用户是：" + user.getUserName());
		System.out.println("修改后的用户类型:" + user.getPhotoFilename());

		return "uploadIDCardSuccess";
	}

}
