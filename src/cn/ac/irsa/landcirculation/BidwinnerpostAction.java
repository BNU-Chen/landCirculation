package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BidwinnerpostAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Bidwinnerpost		bidwinnerpost;
	private Bidtender			bidtender;
	private Bidpost				bidpost;

	public Bidtender getBidtender() {
		return bidtender;
	}

	public void setBidtender(Bidtender bidtender) {
		this.bidtender = bidtender;
	}

	public Bidpost getBidpost() {
		return bidpost;
	}

	public void setBidpost(Bidpost bidpost) {
		this.bidpost = bidpost;
	}

	public Bidwinnerpost getBidwinnerpost() {
		return bidwinnerpost;
	}

	public void setBidwinnerpost(Bidwinnerpost bidwinnerpost) {
		this.bidwinnerpost = bidwinnerpost;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String saveBidwinnerpost() throws Exception {
		// TODO Auto-generated method stub
		BidwinnerpostDao.newBidwinnerpost(this.bidtender);
		return "SUCCESS";
	}

	public String previewBidwinnerpost() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		System.out.println("bidpost.id:" + bidpost.getId());
		context.put("bidwinnerpost", BidwinnerpostDao.getBidwinnerpostByBidpostId(this.bidpost.getId()));
		return "previewBidwinnerpostSuccess";
	}

	public String printBidwinnerpost() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		context.put("bidwinnerpost", BidwinnerpostDao.getBidwinnerpost(this.bidwinnerpost.getId()));
		return "printBidwinnerpostSuccess";
	}
}
