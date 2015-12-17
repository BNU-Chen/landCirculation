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

public class LandcontractImgUploadAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private static final String	webroot				= "../upload/";
	private static final String	packageNamespace	= "apply/";
	private static final String	dirSaved			= "upload/landcontractimg/";

	private Apply		apply;
	private Landcontractimg	landcontractimg;

	private File				landcontractImg;
	private String				landcontractImgFileName;
	private String				landcontractImgContentType;
	
	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public Landcontractimg getLandcontractimg() {
		return landcontractimg;
	}

	public void setLandcontractimg(Landcontractimg landcontractimg) {
		this.landcontractimg = landcontractimg;
	}

	public File getLandcontractImg() {
		return landcontractImg;
	}

	public void setLandcontractImg(File landcontractImg) {
		this.landcontractImg = landcontractImg;
	}

	public String getLandcontractImgFileName() {
		return landcontractImgFileName;
	}

	public void setLandcontractImgFileName(String landcontractImgFileName) {
		this.landcontractImgFileName = landcontractImgFileName;
	}

	public String getLandcontractImgContentType() {
		return landcontractImgContentType;
	}

	public void setLandcontractImgContentType(String landcontractImgContentType) {
		this.landcontractImgContentType = landcontractImgContentType;
	}

	@Override
	public String execute() throws Exception {

		// TODO Auto-generated method stub

		ActionContext context = ActionContext.getContext();
		if (landcontractImg == null)
			return "error";
		// 计算文件名
		Date dt = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String savedFileName = sdf.format(dt) + this.landcontractImgFileName.substring(this.landcontractImgFileName.lastIndexOf("."));
		// 计算存储路径
		String pathWeb = packageNamespace +dirSaved + savedFileName;
		System.out.println("pathweb:"+pathWeb);
		String serverRealPath = ServletActionContext.getServletContext().getRealPath("/");
		// 存储文件
		System.out.println("serverRealPath:"+serverRealPath);
		serverRealPath=serverRealPath.substring(0,serverRealPath.lastIndexOf("\\")+1);
		System.out.println("serverRealPath:"+serverRealPath);
		try {
			File uploadFile = new File(serverRealPath+"upload/"+pathWeb);
			FileUtils.copyFile(this.landcontractImg, uploadFile);
			this.landcontractimg.setLandcontractimgPathFilename("/upload/"+pathWeb);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		
		this.apply=ApplyDao.getApply(this.apply.getId());
		this.landcontractimg.setApply(this.apply);
		UserPerson userperson=UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		this.landcontractimg.setUserPerson(userperson);
		this.landcontractimg.setOwerIdcode(userperson.getUserIdcode());
		this.landcontractimg.setContractCode(this.apply.getLandContractCode());
		LandcontractimgDao.saveLandcontractimg(this.landcontractimg);
		context.put("landcontractimgs", LandcontractimgDao.getLandcontractimgByApplyId(this.apply.getId()));
		context.put("Apply",this.apply);
		return "uploadLandcontractimgSuccess";

	}

	public String deleteContractImg() {
		this.landcontractimg=LandcontractimgDao.getLandcontractimg(this.landcontractimg.getId());
		String serverRealPath = ServletActionContext.getServletContext().getRealPath(".." + this.landcontractimg.getLandcontractimgPathFilename());
		try {
			File todelLandcontractimg=new File(serverRealPath);
			todelLandcontractimg.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("serverRealPath:"+serverRealPath);
		LandcontractimgDao.deleteLandcontractimg(this.landcontractimg.getId());
		ActionContext context = ActionContext.getContext();
		this.apply=ApplyDao.getApply(this.apply.getId());
		context.put("Apply",this.apply);
		context.put("landcontractimgs", LandcontractimgDao.getLandcontractimgByApplyId(this.apply.getId()));
		return "deleteLandcontractimgSuccess";
		
	}

	public String previewContractImg() {
		ActionContext context = ActionContext.getContext();
		this.landcontractimg=LandcontractimgDao.getLandcontractimg(this.landcontractimg.getId());
		context.put("landcontractimg", LandcontractimgDao.getLandcontractimg(this.landcontractimg.getId()));
		return "previewLandcontractimgSuccess";
	}

}
