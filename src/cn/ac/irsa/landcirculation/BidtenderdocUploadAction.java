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

public class BidtenderdocUploadAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private static final String	packageNamespace	= "bid/";
	private static final String	dirSaved			= "upload/bid/";
	private Bidtender			bidtender;
	private File				bidtenderdoc;
	private String				bidtenderdocFileName;
	private String				bidtenderdocContentType;

	public Bidtender getBidtender() {
		return bidtender;
	}

	public void setBidtender(Bidtender bidtender) {
		this.bidtender = bidtender;
	}

	public File getBidtenderdoc() {
		return bidtenderdoc;
	}

	public void setBidtenderdoc(File bidtenderdoc) {
		this.bidtenderdoc = bidtenderdoc;
	}

	public String getBidtenderdocFileName() {
		return bidtenderdocFileName;
	}

	public void setBidtenderdocFileName(String bidtenderdocFileName) {
		this.bidtenderdocFileName = bidtenderdocFileName;
	}

	public String getBidtenderdocContentType() {
		return bidtenderdocContentType;
	}

	public void setBidtenderdocContentType(String bidtenderdocContentType) {
		this.bidtenderdocContentType = bidtenderdocContentType;
	}

	@Override
	public String execute() throws Exception {

		// TODO Auto-generated method stub

		ActionContext context = ActionContext.getContext();
		if (bidtenderdoc == null)
			return "error";
		// 计算文件名
		Date dt = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String savedFileName = sdf.format(dt) + this.bidtenderdocFileName.substring(this.bidtenderdocFileName.lastIndexOf("."));
		// 计算存储路径
		String pathWeb = dirSaved + savedFileName;
		String serverRealPath = ServletActionContext.getServletContext().getRealPath(packageNamespace + pathWeb);
		// 存储文件
		System.out.println("serverrealpath:"+serverRealPath);
		File uploadFile = new File(serverRealPath);
		try {
			FileUtils.copyFile(this.bidtenderdoc, uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// this.apply = ApplyDao.getApply(this.apply.getId());
		this.bidtender = BidtenderDao.getBidtender(this.bidtender.getId());
		this.bidtender.setTenderFilePathname(pathWeb);
		BidtenderDao.updateBidtender(this.bidtender);
		context.put("bidtender", this.bidtender);
		context.put("bidenroll", BidenrollDao.getBidenroll(this.bidtender.getBidenroll().getId()));
		context.put("bidder", UserPersonDao.getUserPerson(this.bidtender.getUserPerson().getId()));
		return "uploadBidtenderdocSuccess";

	}
}
