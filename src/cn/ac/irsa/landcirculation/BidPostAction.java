package cn.ac.irsa.landcirculation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BidPostAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Apply				apply;
	private Bidpost				bidpost;
	private BidpostDetail		bidpostDetail;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public Bidpost getBidpost() {
		return bidpost;
	}

	public void setBidpost(Bidpost bidpost) {
		this.bidpost = bidpost;
	}

	public BidpostDetail getBidpostDetail() {
		return bidpostDetail;
	}

	public void setBidpostDetail(BidpostDetail bidpostDetail) {
		this.bidpostDetail = bidpostDetail;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listTopostBidApplys() {
		List<Apply> applys = ApplyDao.getApplyListByCurrentStatusCode("010303");
		ActionContext context = ActionContext.getContext();

		context.put("applys", applys);

		return "listTopostBidApplysSuccess";
	}

	public String listPostedBidposts() {
		ActionContext context = ActionContext.getContext();

		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		List<Bidpost> postedBidposts = BidpostDao.getPostedBidpostsByPosterId(userPerson.getId());
		System.out.println("\n\npostedBidposts:1" + postedBidposts.get(0).getPosterName());
		context.put("postedBidposts", postedBidposts);
		return "listPostedBidpostsSuccess";
	}

	public String listPostingBidposts() { // 列示正在公示的公示
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		List<Bidpost> postingBidposts = BidpostDao.getPostingBidpostsByPosterId(userPerson.getId());
		context.put("postingBidposts", postingBidposts);
		return "listPostingBidpostsSuccess";
	}

	public String listPostingBidpostDetails() { // 列示正在公示的流转申请明细列表
		ActionContext context = ActionContext.getContext();
		/*
		 * List<Apply> postingApplys =
		 * BidpostDao.getApplysByBidpostId(this.bidpost.getId());
		 * context.put("postingApplys", postingApplys);
		 */
		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());
		context.put("bidpost", this.bidpost);
		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpostDetails", bidpostDetails);

		return "listPostingBidpostDetailsSuccess";
	}

	public String addtoBidpost() {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");

		Bidpost currentBidpost = (Bidpost) context.getSession().get("currentBidpost");

		if (currentBidpost == null) {
			currentBidpost = new Bidpost();
			currentBidpost.setUserPerson(userPerson);
			currentBidpost.setPosterName(userPerson.getUserName());
			currentBidpost.setStatus("01");// 示发布
			System.out.println("test:begin");
			BidpostDao.saveBidpost(currentBidpost);
			currentBidpost = BidpostDao.getBidpostByPosterId(userPerson.getId());
			context.getSession().put("currentBidpost", currentBidpost);
		}

		this.apply = ApplyDao.getApply(this.apply.getId());
		this.bidpostDetail = new BidpostDetail();
		this.bidpostDetail.setBidpost(currentBidpost);
		this.bidpostDetail.setApply(this.apply);

		this.bidpostDetail.setApplierIdcode(this.apply.getApplierIdcode());
		this.bidpostDetail.setApplierName(UserPersonDao.getUserPersonByUserIdcode(this.apply.getApplierIdcode()).getUserName());

		this.bidpostDetail.setLandRgArea(this.apply.getLandRgArea());
		this.bidpostDetail.setPaddyfieldRgArea(this.apply.getPaddyfieldRgArea());
		this.bidpostDetail.setDrylandRgArea(this.apply.getDrylandRgArea());

		this.bidpostDetail.setLandAddress(this.apply.getLandTown() + this.apply.getLandVillage() + this.apply.getLandGroup());

		this.bidpostDetail.setRightAuthType(this.apply.getRightAuthType());
		this.bidpostDetail.setLandwarrantCode(this.apply.getLandWarrantCode());
		this.bidpostDetail.setLandcontractCode(this.apply.getLandContractCode());

		BidpostDetailDao.saveBidpostDetail(this.bidpostDetail);

		Workflow.setCurrentStatus(this.apply, "010401", "01040101");

		List<Apply> applys = ApplyDao.getApplyListByCurrentStatusCode("010303");

		context.put("applys", applys);

		return "addBidpostSuccess";
	}

	public String deleteBidpostDetail() {

		ActionContext context = ActionContext.getContext();

		this.bidpostDetail = BidpostDetailDao.getBidpostDetail(this.bidpostDetail.getId());
		this.apply = this.bidpostDetail.getApply();
		Workflow.setCurrentStatus(this.apply, "010303", "01030301");
		BidpostDetailDao.deleteBidpostDetail(this.bidpostDetail.getId());

		this.bidpost = (Bidpost) context.getSession().get("currentBidpost");
		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());// 更新最新状态
		context.put("bidpost", this.bidpost);

		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpostDetails", bidpostDetails);

		return "deleteBidpostSuccess";
	}

	public String updateBidpost() {// 修改待公示流转申请公示

		ActionContext context = ActionContext.getContext();

		/*
		 * this.bidpost = (Bidpost) context.getSession().get("currentBidpost");
		 * if (this.bidpost == null) { UserPerson userPerson = (UserPerson)
		 * context.getSession().get("CurrentUserPerson");
		 * System.out.println("userPerson.getId():" + userPerson.getId());
		 * this.bidpost = BidpostDao.getBidpostByPosterId(userPerson.getId());
		 * if (this.bidpost == null) { this.bidpost = new Bidpost();
		 * this.bidpost.setUserPerson(userPerson);
		 * this.bidpost.setPosterName(userPerson.getUserName());
		 * this.bidpost.setStatus("01"); BidpostDao.saveBidpost(this.bidpost);
		 * this.bidpost = BidpostDao.getBidpostByPosterId(userPerson.getId()); }
		 * context.getSession().put("currentBidpost", this.bidpost); }
		 */

		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());
		context.getSession().put("currentBidpost", this.bidpost);

		context.put("bidpost", this.bidpost);
		System.out.println("bidpost:" + this.bidpost.getId());
		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpostDetails", bidpostDetails);

		return "updateBidpostSuccess";
	}

	public String saveBidpost() {

		ActionContext context = ActionContext.getContext();
		Bidpost savedBidpost = BidpostDao.getBidpost(this.bidpost.getId());
		ObjUpdate.update(savedBidpost, this.bidpost);
		this.bidpost = savedBidpost;
		long deposit = (long) ((this.bidpost.getDrylandRgArea() * this.bidpost.getDrylandBaseprice() + this.bidpost.getPaddyfieldRgArea() * this.bidpost.getPaddyfieldBaseprice()) * 0.3 / 100 + 0.5) * 100;
		this.bidpost.setDeposit(deposit);
		BidpostDao.updateBidpost(this.bidpost);

		context.getSession().put("currentBidpost", this.bidpost);
		context.put("bidpost", this.bidpost);
		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpostDetails", bidpostDetails);

		// return "saveBidpostSuccess";
		return updateBidpost();
	}

	public String publishBidpost() {

		ActionContext context = ActionContext.getContext();

		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		for (int i = 0; i < bidpostDetails.size(); i++)// 修改公示中所列申请的工作 流状态
		{
			this.apply = bidpostDetails.get(i).getApply();
			Workflow.setCurrentStatus(this.apply, "010402", "01040201");
		}

		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());
		this.bidpost.setStatus("02");// 已发布
		String codeTown = ApplyDao.getApply(bidpostDetails.get(0).getApply().getId()).getLandTown();// 乡镇编码
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		this.bidpost.setPostNo(sdf.format(date) + codeTown + BidpostDao.ComputeBidpostNo());// 设置的Bidpost序号，yyyy+6位行政区划+3位乡镇+5位顺序号
		this.bidpost.setPublishDate(date);

		BidpostDao.updateBidpost(this.bidpost);// 修改公示状态为已发布
		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());

		context.put("bidpost", this.bidpost);
		context.getSession().put("currentBidpost", null);

		return listPostedBidposts();
	}

	public String previewBidpost() {

		ActionContext context = ActionContext.getContext();
		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());
		context.put("bidpost", this.bidpost);

		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpostDetails", bidpostDetails);

		/*
		 * ArrayList<Apply> applys = new ArrayList<Apply>(0); for (int i = 0; i
		 * < bidpostDetails.size(); i++) {
		 * applys.add(bidpostDetails.get(i).getApply()); } context.put("applys",
		 * applys);
		 */
		return "previewBidpostSuccess";
	}

	public String printBidpost() {

		ActionContext context = ActionContext.getContext();
		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());
		context.put("bidpost", this.bidpost);

		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpostDetails", bidpostDetails);

		/*
		 * ArrayList<Apply> applys = new ArrayList<Apply>(0); for (int i = 0; i
		 * < bidpostDetails.size(); i++) {
		 * applys.add(bidpostDetails.get(i).getApply()); } context.put("applys",
		 * applys);
		 */
		return "printBidpostSuccess";
	}

	public String previewApplyDetail() {
		ActionContext context = ActionContext.getContext();
		// System.out.println("this.bidpostDetail.Apply.id:"+this.bidpostDetail.getId());
		this.bidpostDetail = BidpostDetailDao.getBidpostDetail(this.bidpostDetail.getId());
		// System.out.println("this.bidpostDetail.Apply.applierName:"+this.bidpostDetail.getApplierName());
		this.apply = ApplyDao.getApply(this.bidpostDetail.getApply().getId());
		context.put("Apply", this.apply);

		UserPerson applier = UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		context.put("applier", applier);

		List<Parcel> parcels = ParcelDao.getParcelListByApplyId(this.apply.getId());
		context.put("parcels", parcels);

		if (this.apply.getRightAuthType() != null && this.apply.getRightAuthType() == 1) {
			Landwarrant landwarrant = LandwarrantDao.getLandwarrantByApplyId(this.apply.getId());
			context.put("landwarrant", landwarrant);
		} else {
			List<Landcontractimg> landcontractimgs = LandcontractimgDao.getLandcontractimgByApplyId(this.apply.getId());
			context.put("landcontractimgs", landcontractimgs);
		}

		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		context.put("rentcontract", rentcontract);

		TransfereePerson transfereePerson = rentcontract.getTransfereePerson();
		context.put("transfereePerson", transfereePerson);
		return "previewApplyDetailSuccess";
	}

	public String listToAnnounceApplypost() {
		List<Bidpost> toAnnounceApplyPosts = BidpostDao.GetToAnnounceBidposts();
		// System.out.println("记录数："+toAnnounceApplyPosts.size());
		ActionContext context = ActionContext.getContext();
		context.put("toAnnounceApplyPosts", toAnnounceApplyPosts);
		return "listToAnnounceApplypostSuccess";
	}

	public String announceApplypost() {
		ActionContext context = ActionContext.getContext();
		this.bidpost = BidpostDao.getBidpost(this.bidpost.getId());
		// BidpostDetailDao.calculatePostResponse(this.bidpost.getId());
		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		context.put("bidpost", bidpost);
		context.put("bidpostDetails", bidpostDetails);
		return "announceApplypostSuccess";
	}

	public String listClosedBidpost() {
		ActionContext context=ActionContext.getContext();
		UserPerson userperson=(UserPerson)context.getSession().get(("CurrentUserPerson"));
		if(userperson==null)
		{
			return "CurrenUserpersonIsNull";
		}else
		{
		context.put("closedBidposts", BidpostDao.getClosedBidpost(userperson.getId()));
		return "listClosedBidpostSuccess";
		}
	}
}
