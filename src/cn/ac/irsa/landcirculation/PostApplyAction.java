package cn.ac.irsa.landcirculation;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PostApplyAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Apply				apply;
	private PostApply			postApply;
	private PostdetailApply		postdetailApply;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public PostApply getPostApply() {
		return postApply;
	}

	public void setPostApply(PostApply postApply) {
		this.postApply = postApply;
	}

	public PostdetailApply getPostdetailApply() {
		return postdetailApply;
	}

	public void setPostdetailApply(PostdetailApply postdetailApply) {
		this.postdetailApply = postdetailApply;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listTobepostApplys() {
		List<Apply> applys = ApplyDao.getApplyListByCurrentStatusCode("010202");
		ActionContext context = ActionContext.getContext();

		context.put("applys", applys);

		return "listTobepostApplysSuccess";
	}

	public String listPosedPostApplys() {
		ActionContext context = ActionContext.getContext();

		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		}
		List<PostApply> postedPostApplys = PostApplyDao.getPostedPostApplysByPosterId(userPerson.getId());
		System.out.println("\n\npostedPostApplys:1" + postedPostApplys.get(0).getPoster());
		context.put("postedPostApplys", postedPostApplys);

		return "listPostedPostApplysSuccess";
	}

	public String listPostingPostApplys() { // 列示正在公示的公示
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		}
		List<PostApply> postingApplys = PostApplyDao.getPostingPostApplysByPosterId(userPerson.getId());
		context.put("postingPostApplys", postingApplys);
		return "listPostingPostApplysSuccess";
	}

	public String listPostingPostdetailApplys() { // 列示正在公示的流转申请明细列表
		ActionContext context = ActionContext.getContext();
		/*
		 * List<Apply> postingApplys =
		 * PostApplyDao.getApplysByPostApplyId(this.postApply.getId());
		 * context.put("postingApplys", postingApplys);
		 */
		this.postApply = PostApplyDao.getPostApply(this.postApply.getId());
		context.put("postApply", this.postApply);
		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postdetailApplys", postdetailApplys);

		return "listPostingPostdetailApplysSuccess";
	}

	public String addPostApply() {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		}
		PostApply currentPost = (PostApply) context.getSession().get("currentPost");
		if (currentPost == null) {
			currentPost = new PostApply();
			currentPost.setUserPerson(userPerson);
			currentPost.setPoster(userPerson.getUserName());
			currentPost.setStatus("01");
			PostApplyDao.savePostApply(currentPost);
			currentPost = PostApplyDao.getPostApplyByPosterId(userPerson.getId());
			context.getSession().put("currentPost", currentPost);
		}

		this.apply = ApplyDao.getApply(this.apply.getId());
		this.postdetailApply = new PostdetailApply();
		this.postdetailApply.setPostApply(currentPost);
		this.postdetailApply.setApply(this.apply);

		this.postdetailApply.setApplierIdcode(this.apply.getApplierIdcode());
		this.postdetailApply.setApplierName(UserPersonDao.getUserPersonByUserIdcode(this.apply.getApplierIdcode()).getUserName());

		this.postdetailApply.setLandRgArea(this.apply.getLandRgArea());
		this.postdetailApply.setPaddyfeildRgArea(this.apply.getPaddyfieldRgArea());
		this.postdetailApply.setDrylandRgArea(this.apply.getDrylandRgArea());

		this.postdetailApply.setLandAddress(this.apply.getLandTown() + this.apply.getLandVillage() + this.apply.getLandGroup());

		this.postdetailApply.setRightAuthType(this.apply.getRightAuthType());
		this.postdetailApply.setLandwarrantCode(this.apply.getLandWarrantCode());
		this.postdetailApply.setLandcontractCode(this.apply.getLandContractCode());

		PostdetailApplyDao.savePostdetailApply(this.postdetailApply);
		Workflow.setCurrentStatus(this.apply, "010301", "01030101");

		List<Apply> applys = ApplyDao.getApplyListByCurrentStatusCode("010202");
		context.put("applys", applys);

		return "addPostApplySuccess";
	}

	public String deletePostApply() {

		ActionContext context = ActionContext.getContext();

		this.postApply = (PostApply) context.getSession().get("currentPost");
		context.put("postApply", this.postApply);

		this.postdetailApply = PostdetailApplyDao.getPostdetailApply(this.postdetailApply.getId());
		this.apply = this.postdetailApply.getApply();
		Workflow.setCurrentStatus(this.apply, "010202", "01020201");
		PostdetailApplyDao.deletePostdetailApply(this.postdetailApply.getId());

		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postdetailApplys", postdetailApplys);

		return "deletePostApplySuccess";
	}

	public String updatePostApply() {// 修改待公示流转申请公示

		ActionContext context = ActionContext.getContext();

		this.postApply = (PostApply) context.getSession().get("currentPost");
		if (this.postApply == null) {
			UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
			if (userPerson == null) {
				return "CurrenUserpersonIsNull";
			}
			System.out.println("userPerson.getId():" + userPerson.getId());
			this.postApply = PostApplyDao.getTobepostPostApplyByPosterId(userPerson.getId());
			if (this.postApply == null) {
				this.postApply = new PostApply();
				this.postApply.setUserPerson(userPerson);
				this.postApply.setPoster(userPerson.getUserName());
				this.postApply.setStatus("01");
				PostApplyDao.savePostApply(this.postApply);
				this.postApply = PostApplyDao.getPostApplyByPosterId(userPerson.getId());
			}
			context.getSession().put("currentPost", this.postApply);
		}

		context.put("postApply", this.postApply);
		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postdetailApplys", postdetailApplys);

		return "updatePostApplySuccess";
	}

	public String savePostApply() {

		ActionContext context = ActionContext.getContext();
		PostApply savedPostApply = PostApplyDao.getPostApply(this.postApply.getId());
		ObjUpdate.update(savedPostApply, this.postApply);
		this.postApply = savedPostApply;
		PostApplyDao.updatePostApply(this.postApply);

		context.getSession().put("currentPost", this.postApply);
		context.put("postApply", this.postApply);
		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postdetailApplys", postdetailApplys);

		return "savePostApplySuccess";
	}

	public String publishPostApply() {

		ActionContext context = ActionContext.getContext();
		this.postApply = PostApplyDao.getPostApply(this.postApply.getId());
		this.postApply.setStatus("02");
		Date date = new Date();
		this.postApply.setPublishDate(date);
		PostApplyDao.updatePostApply(this.postApply);// 修改公示状态为已发布
		this.postApply = PostApplyDao.getPostApply(this.postApply.getId());
		context.put("postApply", this.postApply);
		context.getSession().put("currentPost", null);

		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		for (int i = 0; i < postdetailApplys.size(); i++)// 修改公示中所列申请的工作 流状态
		{
			this.apply = postdetailApplys.get(i).getApply();
			Workflow.setCurrentStatus(this.apply, "010302", "01030201");
		}
		context.put("postdetailApplys", postdetailApplys);

		return "publishPostApplySuccess";
	}

	public String previewPostApply() {

		ActionContext context = ActionContext.getContext();
		this.postApply = PostApplyDao.getPostApply(this.postApply.getId());
		context.put("postApply", this.postApply);

		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postdetailApplys", postdetailApplys);

		/*
		 * ArrayList<Apply> applys = new ArrayList<Apply>(0); for (int i = 0; i
		 * < postdetailApplys.size(); i++) {
		 * applys.add(postdetailApplys.get(i).getApply()); }
		 * context.put("applys", applys);
		 */
		return "previewPostApplySuccess";
	}

	public String printPostApply() {

		ActionContext context = ActionContext.getContext();
		this.postApply = PostApplyDao.getPostApply(this.postApply.getId());
		context.put("postApply", this.postApply);

		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postdetailApplys", postdetailApplys);

		/*
		 * ArrayList<Apply> applys = new ArrayList<Apply>(0); for (int i = 0; i
		 * < postdetailApplys.size(); i++) {
		 * applys.add(postdetailApplys.get(i).getApply()); }
		 * context.put("applys", applys);
		 */
		return "printPostApplySuccess";
	}

	public String previewApplyDetail() {
		ActionContext context = ActionContext.getContext();
		// System.out.println("this.postdetailApply.Apply.id:"+this.postdetailApply.getId());
		this.postdetailApply = PostdetailApplyDao.getPostdetailApply(this.postdetailApply.getId());
		// System.out.println("this.postdetailApply.Apply.applierName:"+this.postdetailApply.getApplierName());
		this.apply = ApplyDao.getApply(this.postdetailApply.getApply().getId());
		context.put("Apply", this.apply);

		UserPerson applier = UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		context.put("applier", applier);

		List<Parcel> parcels = ParcelDao.getParcelListByApplyId(this.apply.getId());
		context.put("parcels", parcels);

		if (this.apply.getRightAuthType() == 1) {
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
		List<PostApply> toAnnounceApplyPosts = PostApplyDao.GetToAnnounceApplyposts();
		// System.out.println("记录数："+toAnnounceApplyPosts.size());
		ActionContext context = ActionContext.getContext();
		context.put("toAnnounceApplyPosts", toAnnounceApplyPosts);
		return "listToAnnounceApplypostSuccess";
	}

	public String announceApplypost() {
		ActionContext context = ActionContext.getContext();
		this.postApply = PostApplyDao.getPostApply(this.postApply.getId());
		PostdetailApplyDao.calculatePostResponse(this.postApply.getId());
		List<PostdetailApply> postdetailApplys = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(this.postApply.getId());
		context.put("postApply", postApply);
		context.put("postdetailApplys", postdetailApplys);
		return "announceApplypostSuccess";
	}
}
