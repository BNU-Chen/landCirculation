package cn.ac.irsa.landcirculation;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
//import com.sun.org.apache.bcel.internal.generic.SWITCH;

public class BidEnrollAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	Bidenroll					bidenroll			= new Bidenroll();
	int							bidpostId;

	public Bidenroll getBidenroll() {
		return bidenroll;
	}

	public void setBidenroll(Bidenroll bidenroll) {
		this.bidenroll = bidenroll;
	}

	public int getBidpostId() {
		return bidpostId;
	}

	public void setBidpostId(int bidpostId) {
		this.bidpostId = bidpostId;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listToenrollBidpost() {
		ActionContext context = ActionContext.getContext();

		context.put("toenrollBidposts", BidpostDao.getToenrollBidpost());// 获取可报名公告
		return "listToenrollBidpostSuccess";
	}

	public String preenrollBidpost() {
		ActionContext context = ActionContext.getContext();
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		Bidenroll bidenroll = BidenrollDao.prenewBidenroll(bidder, this.bidpostId);// 新建投标报名信息

		System.out.println("bidenroll:" + bidenroll.getEnrollNo());
		context.put("bidenroll", bidenroll);
		context.put("bidder", bidder);
		context.put("bidpost", BidpostDao.getBidpost(this.bidpostId));

		return "preenrollBidpostSuccess";
	}

	public String enrollBidpost() {
		ActionContext context = ActionContext.getContext();
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		Bidenroll bidenroll = BidenrollDao.newBidenroll(this.bidenroll.getId());// 新建投标报名信息
		return listToenrollBidpost();
	}

	public String modifyBidderPicinfo() {
		ActionContext context = ActionContext.getContext();
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		context.put("bidder", bidder);
		this.bidenroll = BidenrollDao.getBidenroll(this.bidenroll.getId());
		context.put("bidenroll", this.bidenroll);
		return "modifyBidderPicinfoSuccess";
	}

	public String updateBidderPicinfo() {
		ActionContext context = ActionContext.getContext();
		Bidenroll savedBidenroll = BidenrollDao.getBidenroll(this.bidenroll.getId());
		ObjUpdate.update(savedBidenroll, this.bidenroll);
		this.bidenroll = savedBidenroll;
		BidenrollDao.updateBidenroll(this.bidenroll);

		context.put("bidenroll", this.bidenroll);
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		context.put("bidder", bidder);
		context.put("bidpost", BidpostDao.getBidpost(this.bidenroll.getBidpost().getId()));

		return "updateBidderPicinfoSuccess";
	}

	public String listMyEnrollingBidenroll() {

		ActionContext context = ActionContext.getContext();
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		context.put("bidenrolls", BidenrollDao.getMyEnrollingBidenrolls(bidder));

		return "listMyEnrollingBidenrollSuccess";
	}

	public String listMyEnrolledBidenroll() {

		ActionContext context = ActionContext.getContext();
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		context.put("bidenrolls", BidenrollDao.getMyEnrolledBidenrolls(bidder));

		return "listMyEnrolledBidenrollSuccess";
	}

	public String listToreviewBidenroll() {

		ActionContext context = ActionContext.getContext();
		UserPerson reviewer = (UserPerson) context.getSession().get("CurrentUserPerson");
		context.put("bidenrolls", BidenrollDao.getToreviewBidenrolls());

		return "listToreviewBidenrollSuccess";
	}

	public String reviewBidenroll() {
		ActionContext context = ActionContext.getContext();
		context.put("bidenroll", BidenrollDao.getBidenroll(this.bidenroll.getId()));// 获取要审核的竞标报名
		return "reviewBidenrollSuccess";
	}

	public String viewBidenroll() {
		ActionContext context = ActionContext.getContext();
		Bidenroll bidenroll = BidenrollDao.getBidenroll(this.bidenroll.getId());
		context.put("bidenroll", bidenroll);// 获取要审核的竞标报名
		UserPerson bidder = (UserPerson) context.getSession().get("CurrentUserPerson");
		context.put("bidder", UserPersonDao.getUserPerson(bidenroll.getUserPersonByBidderId().getId()));
		return "viewBidenrollSuccess";
	}

	public String updateReviewBidenroll() {
		ActionContext context = ActionContext.getContext();
		context.put("bidenroll", BidenrollDao.getBidenroll(this.bidenroll.getId()));
		return "updateReviewBidenrollSuccess";
	}

	public String saveReview() {
		ActionContext context = ActionContext.getContext();
		Bidenroll savedBidenroll = BidenrollDao.getBidenroll(this.bidenroll.getId());
		switch (this.bidenroll.getReviewResult())
		{
			case "0":
			{
				this.bidenroll.setStatus("0201");
				this.bidenroll.setStatusMsg("竞标报名审核通过！");
				break;
			}
			case "1":
			{
				this.bidenroll.setStatus("0202");
				this.bidenroll.setStatusMsg("竞标报名审核未通过");
				break;
			}
		}
		ObjUpdate.update(savedBidenroll, this.bidenroll);
		BidenrollDao.updateBidenroll(savedBidenroll);// 更新审核结果
		return this.listToreviewBidenroll();// 返回待审核报名列表页面
	}


}
