package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BidopenAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Bidpost				bidpost;
	private Bidtender			bidtender;

	public Bidpost getBidpost() {
		return bidpost;
	}

	public void setBidpost(Bidpost bidpost) {
		this.bidpost = bidpost;
	}

	public Bidtender getBidtender() {
		return bidtender;
	}

	public void setBidtender(Bidtender bidtender) {
		this.bidtender = bidtender;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listToopenBidpost() {
		ActionContext context = ActionContext.getContext();
		context.put("toopenBidposts", BidpostDao.getToopenBidpost());
		return "listToopenBidpostSuccess";
	}

	public String listToopenBidtender() {
		ActionContext context = ActionContext.getContext();
		List<Bidtender> bidtenders = BidtenderDao.getToopenBidtendersByBidpostId(this.bidpost.getId());
		context.put("toopenBidtenders", bidtenders);
		return "listToopenBidtenderSuccess";
	}

	public String reviewBidtender() {
		ActionContext context = ActionContext.getContext();
		context.put("bidtender", BidtenderDao.getBidtender(this.bidtender.getId()));// 获取要审核的竞标书
		return "reviewBidtenderSuccess";
	}
	public String updateBidtenderReview() {
		ActionContext context = ActionContext.getContext();
		context.put("bidtender", BidtenderDao.getBidtender(this.bidtender.getId()));// 获取要审核的竞标书
		return "updateBidtenderReviewSuccess";
	}

	public String saveBidtenderReview() {
		ActionContext context = ActionContext.getContext();
		BidtenderDao.saveBidtenderReview(this.bidtender);
		this.bidpost = BidtenderDao.getBidtender(this.bidtender.getId()).getBidpost();//设置当前投标书所对应的招标公告
		return listToopenBidtender();//继续形式审核
	}
}
