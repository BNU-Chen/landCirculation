package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReviewApplyAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;

	private Apply				apply;
	private ReviewApply			reviewApply;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public ReviewApply getReviewApply() {
		return reviewApply;
	}

	public void setReviewApply(ReviewApply reviewApply) {
		this.reviewApply = reviewApply;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub

		return SUCCESS;
	}

	public String listApplys() throws Exception {
		// TODO Auto-generated method stub
		List<Apply> applys = ApplyDao.getApplyListByCurrentStatusCode("010102");
		ActionContext context = ActionContext.getContext();

		context.put("applys", applys);

		return "listApplysSuccess";
	}

	public String listtoReviewApplys_agreement() throws Exception {
		// TODO Auto-generated method stub

		List<Applystatus> applys = ApplystatusDao.getApplystatusListByTransferType_statusCode("0", "010102");
		ActionContext context = ActionContext.getContext();

		context.put("applys", applys);

		return "listtoreviewApplys_agreementSuccess";
	}

	public String listtoReviewApplys_bid() throws Exception {
		// TODO Auto-generated method stub

		List<Applystatus> applys = ApplystatusDao.getApplystatusListByTransferType_statusCode("1", "010102");
		ActionContext context = ActionContext.getContext();

		context.put("applys", applys);

		return "listtoreviewApplys_bidSuccess";
	}

	public String viewApply() throws Exception {
		// TODO Auto-generated method stub
		this.apply = ApplyDao.getApply(this.apply.getId());

		ActionContext context = ActionContext.getContext();
		context.put("apply", apply);

		return "viewApplySuccess";
	}

	public String updateReviewApply() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("\ntest from updateReviewApply!\n");
		ActionContext context = ActionContext.getContext();
		this.apply = ApplyDao.getApply(this.apply.getId());

		this.reviewApply = ReviewApplyDao.getReviewByApplyId(this.apply.getId());
		if (this.reviewApply == null) {
			this.reviewApply = new ReviewApply();
			this.reviewApply.setApply(this.apply);
			ReviewApplyDao.saveReviewApply(this.reviewApply);
		}
		context.put("reviewApply", this.reviewApply);
		context.put("apply", apply);

		return "updateReviewApplySuccess";
	}

	public String saveReviewApply() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("\n!!!!test from SaveReviewApply!\n");
		ActionContext context = ActionContext.getContext();
		this.reviewApply.setApply(this.apply);
		ReviewApply savedReviewApply = ReviewApplyDao.getReviewByApplyId(this.apply.getId());
		ObjUpdate.update(savedReviewApply, this.reviewApply);
		this.reviewApply = savedReviewApply;
		ReviewApplyDao.updateReviewApply(this.reviewApply);

		if (this.reviewApply.getReviewResult() == 0) {
			Workflow.setCurrentStatus(this.apply, "010202", "01020201");
		} else {
			Workflow.setCurrentStatus(this.apply, "010203", "01020301");
		}

		context.put("reviewApply", this.reviewApply);
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("apply", this.apply);
		return "saveReviewApplySuccess";
	}

	public String viewReviewApply() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		this.apply = ApplyDao.getApply(this.apply.getId());

		this.reviewApply = ReviewApplyDao.getReviewByApplyId(this.apply.getId());
		if (this.reviewApply == null) {
			this.reviewApply = new ReviewApply();
			this.reviewApply.setApply(this.apply);
			ReviewApplyDao.saveReviewApply(this.reviewApply);
		}
		context.put("reviewApply", this.reviewApply);
		context.put("apply", apply);

		return "viewReviewSuccess";
	}

}
