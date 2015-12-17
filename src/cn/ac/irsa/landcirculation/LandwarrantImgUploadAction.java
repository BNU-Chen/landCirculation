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

public class LandwarrantImgUploadAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private static final String	packageNamespace	= "apply/";
	private static final String	dirSaved			= "upload/warrant/";
	private Apply				apply;
	private File				landwarrantImg;
	private String				landwarrantImgFileName;
	private String				landwarrantImgContentType;
	private int					page;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public File getLandwarrantImg() {
		return landwarrantImg;
	}

	public void setLandwarrantImg(File landwarrantImg) {
		this.landwarrantImg = landwarrantImg;
	}

	public String getLandwarrantImgFileName() {
		return landwarrantImgFileName;
	}

	public void setLandwarrantImgFileName(String landwarrantImgFileName) {
		this.landwarrantImgFileName = landwarrantImgFileName;
	}

	public String getLandwarrantImgContentType() {
		return landwarrantImgContentType;
	}

	public void setLandwarrantImgContentType(String landwarrantImgContentType) {
		this.landwarrantImgContentType = landwarrantImgContentType;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String execute() throws Exception {

		// TODO Auto-generated method stub

		ActionContext context = ActionContext.getContext();
		if (landwarrantImg == null)
			return "error";
		// 计算文件名
		Date dt = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String savedFileName = sdf.format(dt) + this.landwarrantImgFileName.substring(this.landwarrantImgFileName.lastIndexOf("."));
		// 计算存储路径
		String pathWeb = dirSaved + savedFileName;
		String serverRealPath = ServletActionContext.getServletContext().getRealPath(packageNamespace + pathWeb);
		// 存储文件
		File uploadFile = new File(serverRealPath);
		try {
			FileUtils.copyFile(this.landwarrantImg, uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Landwarrant landwarrantTmp = new Landwarrant();
		switch (this.page)
		{
			case 1:
			{
				landwarrantTmp.setWarrantImgPathname12(pathWeb);
				break;
			}
			case 2:
			{
				landwarrantTmp.setWarrantImgPathname34(pathWeb);
				break;
			}
			case 3:
			{
				landwarrantTmp.setWarrantImgPathname56(pathWeb);
				break;
			}
			case 4:
			{
				landwarrantTmp.setWarrantImgPathname78(pathWeb);
				break;
			}
			case 5:
			{
				landwarrantTmp.setWarrantImgPathname90(pathWeb);
				break;
			}
		}

		// this.apply = ApplyDao.getApply(this.apply.getId());
		Landwarrant landwarrantSaved = LandwarrantDao.getLandwarrantByApplyId(this.apply.getId());
		if (landwarrantSaved != null) {
			System.out.println("LandwarrantImgUploadAction:还没出错：");
			ObjUpdate.update(landwarrantSaved, landwarrantTmp);
			LandwarrantDao.updateLandwarrant(landwarrantSaved);
			this.apply=ApplyDao.getApply(this.apply.getId());
			context.put("Apply", this.apply);
			context.put("landwarrant", landwarrantSaved);
		} else {
			System.out.println("LandwarrantImgUploadAction:出错了！");
			return "error";

		}
		return "uploadLandwarrantImgSuccess";
	}
}
