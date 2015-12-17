package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BidTenderAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Bidenroll			bidenroll;
	private Bidtender			bidtender;

	public Bidtender getBidtender() {
		return bidtender;
	}

	public void setBidtender(Bidtender bidtender) {
		this.bidtender = bidtender;
	}

	public Bidenroll getBidenroll() {
		return bidenroll;
	}

	public void setBidenroll(Bidenroll bidenroll) {
		this.bidenroll = bidenroll;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listTotenderBidenroll() throws Exception {
		ActionContext context = ActionContext.getContext();
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (bidder == null) {
			return "CurrenUserpersonIsNull";
		}
		bidder = UserPersonDao.getUserPerson(bidder.getId());
		context.put("bidenrolls", BidenrollDao.getTotendersBidenrollByBidder(bidder));
		return "listTotenderBidenrollSuccess";
	}

	public String modifyBidtender() throws Exception {
		ActionContext context = ActionContext.getContext();
		System.out.println("bidenroll.id:" + this.bidenroll.getId());
		Bidtender bidtender = BidtenderDao.getBidtenderByBidenrollId(this.bidenroll.getId());
		context.put("bidtender", bidtender);
		context.put("bidpost", BidpostDao.getBidpost(bidtender.getBidenroll().getId()));
		return "modifyBidtenderSuccess";
	}

	public String updateBidtender() throws Exception {
		ActionContext context = ActionContext.getContext();
		if (this.bidtender == null) {
			this.bidtender = (Bidtender) context.get("bidtender");
		}
		this.bidtender = BidtenderDao.getBidtender(this.bidtender.getId());
		context.put("bidtender", this.bidtender);
		context.put("bidenroll", BidenrollDao.getBidenroll(this.bidtender.getBidenroll().getId()));
		context.put("bidder", UserPersonDao.getUserPerson(this.bidtender.getUserPerson().getId()));
		return "updateBidtenderSuccess";
	}

	public String viewBidtender() throws Exception {
		ActionContext context = ActionContext.getContext();
		if (this.bidtender == null) {
			this.bidtender = (Bidtender) context.get("bidtender");
		}
		this.bidtender = BidtenderDao.getBidtender(this.bidtender.getId());
		context.put("bidtender", this.bidtender);
		context.put("bidenroll", BidenrollDao.getBidenroll(this.bidtender.getBidenroll().getId()));
		context.put("bidder", UserPersonDao.getUserPerson(this.bidtender.getUserPerson().getId()));
		return "viewBidtenderSuccess";
	}

	public String saveBidtender() throws Exception {
		ActionContext context = ActionContext.getContext();
		Bidtender savedBidtender = BidtenderDao.getBidtender(this.bidtender.getId());
		ObjUpdate.update(savedBidtender, this.bidtender);
		this.bidtender = savedBidtender;
		this.bidtender.setTotalprice(BidtenderDao.computeTotalPrice(this.bidtender));
		BidtenderDao.updateBidtender(savedBidtender);
		context.put("bidtender", BidtenderDao.getBidtender(savedBidtender.getId()));
		return updateBidtender();
	}

	public String submitBidtender() throws Exception {
		ActionContext context = ActionContext.getContext();
		BidtenderDao.submitBidtender(this.bidtender.getId());
		return listTotenderBidenroll();
	}

}
