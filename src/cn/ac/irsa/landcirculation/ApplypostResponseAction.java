package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ApplypostResponseAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private PostApply			postApply;
	private PostdetailApply		postdetailApply;
	private ApplypostResponse	applypostResponse;

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

	public ApplypostResponse getApplypostResponse() {
		return applypostResponse;
	}

	public void setApplypostResponse(ApplypostResponse applypostResponse) {
		this.applypostResponse = applypostResponse;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String addApplypostResponseRecorde() {
		ActionContext context = ActionContext.getContext();
		context.put("postApply", this.postApply);
		context.put("postdetailApply", this.postdetailApply);
		return "addApplypostResponseRecordeSuccesss";
	}

	public String saveApplypostResponseRecorde() {
		ActionContext context = ActionContext.getContext();
		this.postdetailApply = PostdetailApplyDao.getPostdetailApply(this.postdetailApply.getId());
		this.applypostResponse.setApply(this.postdetailApply.getApply());
		this.applypostResponse.setPostApply(this.postdetailApply.getPostApply());
		UserPerson currentUsr = (UserPerson) context.getSession().get("CurrentUserPerson");
		this.applypostResponse.setUserPersonByRecorderId(currentUsr);
		ApplypostResponseDao.saveApplypostResponse(this.applypostResponse);

		context.put("applypostResponse", applypostResponse);
		return "saveApplypostResponseRecordeSuccess";
	}

	public String listTodealApplypostResponse() {
		List<ApplypostResponse> applypostResponses = ApplypostResponseDao.getTodealApplypostResponseList();
		ActionContext context = ActionContext.getContext();
		context.put("applypostResponses", applypostResponses);
		return "listTodealApplypostResponseSuccess";
	}

	public String dealindexApplypostResponse() {
		ApplypostResponse applypostResponse = ApplypostResponseDao.getApplypostResponse(this.applypostResponse.getId());
		Apply apply = applypostResponse.getApply();// 获取对应的流转申请信息
		PostApply postApply = applypostResponse.getPostApply();// 获取对应的公示信息
		ActionContext context = ActionContext.getContext();
		context.put("applypostResponse", applypostResponse);
		context.put("apply", apply);
		context.put("postApply", postApply);
		return "dealindexApplypostResponseSuccess";
	}

	public String dealupdateApplypostResponse() {
		ApplypostResponse applypostResponse = ApplypostResponseDao.getApplypostResponse(this.applypostResponse.getId());
		ActionContext context = ActionContext.getContext();
		context.put("applypostResponse", applypostResponse);
		return "dealupdateApplypostResponseSuccess";
	}

	public String dealsaveApplypostResponse() {
		ActionContext context = ActionContext.getContext();
		ApplypostResponse applypostResponse = ApplypostResponseDao.getApplypostResponse(this.applypostResponse.getId());
		ObjUpdate.update(applypostResponse, this.applypostResponse);
		this.applypostResponse = applypostResponse;
		UserPerson currentUsr = (UserPerson) context.getSession().get("CurrentUserPerson");
		this.applypostResponse.setUserPersonByDealerId(currentUsr);
		ApplypostResponseDao.updateApplypostResponse(this.applypostResponse);// 保存结果

		return listTodealApplypostResponse();// 返回待处理列表
	}
}
