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

public class ContractfillingimgUploadAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private static final String	webroot				= "../upload/";
	private static final String	packageNamespace	= "contract/";
	private static final String	dirSaved			= "upload/contract/";

	private Contractfilling		contractfilling;
	private Contractfillingimg	contractfillingimg;

	private File				contractImg;
	private String				contractImgFileName;
	private String				contractImgContentType;

	public Contractfilling getContractfilling() {
		return contractfilling;
	}

	public void setContractfilling(Contractfilling contractfilling) {
		this.contractfilling = contractfilling;
	}

	public Contractfillingimg getContractfillingimg() {
		return contractfillingimg;
	}

	public void setContractfillingimg(Contractfillingimg contractfillingimg) {
		this.contractfillingimg = contractfillingimg;
	}

	public File getContractImg() {
		return contractImg;
	}

	public void setContractImg(File contractImg) {
		this.contractImg = contractImg;
	}

	public String getContractImgFileName() {
		return contractImgFileName;
	}

	public void setContractImgFileName(String contractImgFileName) {
		this.contractImgFileName = contractImgFileName;
	}

	public String getContractImgContentType() {
		return contractImgContentType;
	}

	public void setContractImgContentType(String contractImgContentType) {
		this.contractImgContentType = contractImgContentType;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String uploadContractfillingimg() {
		ActionContext context = ActionContext.getContext();
		if (contractImg == null)
			return "error";
		// 计算文件名
		Date dt = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String savedFileName = sdf.format(dt) + this.contractImgFileName.substring(this.contractImgFileName.lastIndexOf("."));
		// 计算存储路径
		String pathWeb = packageNamespace + dirSaved + savedFileName;
		String serverRealPath = ServletActionContext.getServletContext().getRealPath(webroot + pathWeb);
		// 存储文件
		System.out.println("serverRealPath:" + serverRealPath);
		try {
			File uploadFile = new File(serverRealPath);
			FileUtils.copyFile(this.contractImg, uploadFile);
			this.contractfillingimg.setContractfillingimgPathFilename("/upload/" + pathWeb);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		this.contractfillingimg.setContractfilling(this.contractfilling);
		this.contractfillingimg.setContractNo(this.contractfilling.getContractNo());
		ContractfillingimgDao.saveContractfillingimg(this.contractfillingimg);
		context.put("contractfilling", this.contractfilling);

		// return "uploadContractfillingimgSuccess";
		return listContractfillingimg();
	}

	public String addContractfillingimg() {
		ActionContext context = ActionContext.getContext();
		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		context.put("contractfilling", this.contractfilling);
		return "addContractfillingimgSuccess";
	}

	public String listContractfillingimg() {
		ActionContext context = ActionContext.getContext();
		this.contractfillingimg = null;
		List<Contractfillingimg> contractfillingimgs = ContractfillingimgDao.getContractfillingimgListByContractfilling(this.contractfilling,false);
		context.put("contractfillingimgs", contractfillingimgs);
		System.out.println("listContractfillingimg invoked!");
		return "listContractfillingimgsSuccess";
	}

	public String deleteContractfillingimg() {
		this.contractfillingimg = ContractfillingimgDao.getContractfillingimg(this.contractfillingimg.getId());
		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfillingimg.getContractfilling().getId());
		String serverRealPath = ServletActionContext.getServletContext().getRealPath(".." + this.contractfillingimg.getContractfillingimgPathFilename());
		System.out.println("serverRealPath @del:" + serverRealPath);
		try {
			File todelFile = new File(serverRealPath);
			todelFile.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ContractfillingimgDao.deleteContractfillingimg(this.contractfillingimg.getId());
		ActionContext context = ActionContext.getContext();

		context.put("contractfilling", this.contractfilling);
		return listContractfillingimg();

	}

	public String previewContractfillingimgs() {
		ActionContext context = ActionContext.getContext();
		List<Contractfillingimg> contractfillingimgs = ContractfillingimgDao.getContractfillingimgListByContractfilling(this.contractfilling,true);
		context.put("contractfillingimgs", contractfillingimgs);
		return "previewContractfillingimgsSuccess";
	}

}
