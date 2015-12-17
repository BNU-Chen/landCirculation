package cn.ac.irsa.landcirculation;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ContractSignAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Apply				apply;
	private ContractBase		contractBase;
	private Contractfilling		contractfilling;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public ContractBase getContractBase() {
		return contractBase;
	}

	public void setContractBase(ContractBase contractBase) {
		this.contractBase = contractBase;
	}

	public Contractfilling getContractfilling() {
		return contractfilling;
	}

	public void setContractfilling(Contractfilling contractfilling) {
		this.contractfilling = contractfilling;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listtosignContractApplys_agreement() {
		ActionContext context = ActionContext.getContext();
		List<Applystatus> applys = ApplystatusDao.getApplystatusListByTransferType_statusCode("0", "010303");
		context.put("applys", applys);
		return "listtosignContractApplys_agreementSuccess";
	}

	public String listtosignContractApplys_bid() {
		ActionContext context = ActionContext.getContext();
		List<Applystatus> applys = ApplystatusDao.getApplystatusListByTransferType_statusCode("1", "010406");
		context.put("applys", applys);
		return "listtosignContractApplys_bidSuccess";
	}

	public String newContract() {
		ActionContext context = ActionContext.getContext();

		ContractBase contractBase = ContractBaseDao.getContractBaseByApplyId(this.apply.getId());
		if (contractBase == null) {
			contractBase = ContractBaseDao.newContractBase(this.apply);
		}
		context.put("contractBase", contractBase);
		switch (contractBase.getCirculationType())
		{
			case "01":
			{
				context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
				return "newContract_rentSuccess";
			}
			case "02":
			{
				return "newContract_shareSuccess";
			}
			case "03":
			{
				return "newContract_assignmentSuccess";
			}
			case "04":
			{
				return "newContract_subcontractSuccess";
			}
			case "05":
			{
				return "newContract_exchangeSuccess";
			}
		}
		return "SUCCESS";
	}

	public String newContractCore() {
		ActionContext context = ActionContext.getContext();

		ContractBase contractBase = ContractBaseDao.getContractBaseByApplyId(this.apply.getId());
		if (contractBase == null) {
			contractBase = ContractBaseDao.newContractBase(this.apply);
		}
		context.put("contractBase", contractBase);
		switch (contractBase.getCirculationType())
		{
			case "01":
			{
				context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
				return "newContractCore_rentSuccess";
			}
			case "02":
			{
				return "newContractCore_shareSuccess";
			}
			case "03":
			{
				return "newContractCore_assignmentSuccess";
			}
			case "04":
			{
				return "newContractCore_subcontractSuccess";
			}
			case "05":
			{
				return "newContractCore_exchangeSuccess";
			}
		}
		return "SUCCESS";
	}

	public String submitContract() {
		ContractBaseDao.submitContract(this.contractBase);
		return listtosignContractApplys_bid();
	}

	public String listtoreviewContractApplys() {
		ActionContext context = ActionContext.getContext();
		List<Applystatus> applys = ApplystatusDao.getApplystatusListByStatusCode("010502");
		context.put("applys", applys);
		return "listtoreviewContractApplysSuccess";
	}

	public String reviewContract() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBaseByApplyId(this.apply.getId());
		context.put("contractBase", this.contractBase);
		return "reviewContractSuccess";
	}

	public String previewContract() {
		ActionContext context = ActionContext.getContext();

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		switch (contractBase.getCirculationType())
		{
			case "01":
			{
				this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
				ContractRent contractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
				context.put("contractRent", contractRent);
				List<Parcel> parcels = ParcelDao.getParcelListByApplyId(contractBase.getApply().getId());
				if (parcels.size() < 10) {
					Parcel parcel = new Parcel();
					for (int i = parcels.size(); i < 10; i++)
						parcels.add(parcel);
				}
				context.put("parcels", parcels);
				return "previewContract_rentSuccess";
			}
			case "02":
			{
				return "previewContract_shareSuccess";
			}
			case "03":
			{
				return "previewContract_assignmentSuccess";
			}
			case "04":
			{
				return "previewContract_subcontractSuccess";
			}
			case "05":
			{
				return "previewContract_exchangeSuccess";
			}
		}
		return "SUCCESS";
	}

	public String updateReviewContract() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		return "updateReviewContractSuccess";
	}

	public String saveReviewContract() {
		ActionContext context = ActionContext.getContext();

		ContractBase savedContractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		ObjUpdate.update(savedContractBase, this.contractBase);
		this.contractBase = savedContractBase;
		ContractBaseDao.updateContractBase(this.contractBase);

		if (this.contractBase.getReviewResult().contentEquals("0")) {
			ContractBaseDao.setContrctNo(this.contractBase);
			Date approveDate = new Date();
			this.contractBase.setApprovedDate(approveDate);
			Workflow.setCurrentStatus(this.contractBase.getApply(), "010503", "01050301");
		} else {
			Workflow.setCurrentStatus(this.contractBase.getApply(), "010504", "01050401");
		}

		context.put("contractBase", this.contractBase);
		return listtoreviewContractApplys();
	}

	public String listtoPrintContractApplys() {
		ActionContext context = ActionContext.getContext();
		List<Applystatus> applys = ApplystatusDao.getApplystatusListByStatusCode("010503");
		applys.addAll(ApplystatusDao.getApplystatusListByStatusCode("010504"));
		applys.addAll(ApplystatusDao.getApplystatusListByStatusCode("010505"));
		applys.addAll(ApplystatusDao.getApplystatusListByStatusCode("010506"));
		applys.addAll(ApplystatusDao.getApplystatusListByStatusCode("010507"));
		System.out.println("toprintContracts:" + applys.size());
		context.put("applys", applys);
		return "listtoprintContractApplysSuccess";
	}

	public String printContract() {
		this.contractBase = ContractBaseDao.getContractBaseByApplyId(this.apply.getId());
		return previewContract();// 调预览功能打印
	}

	public String listtofillingContractApplys() {
		ActionContext context = ActionContext.getContext();
		List<Applystatus> applys = ApplystatusDao.getApplystatusListByStatusCode("010503");
		List<Applystatus> applys2 = ApplystatusDao.getApplystatusListByStatusCode("010505");// 备案审核未通过的
		List<Applystatus> applys3 = ApplystatusDao.getApplystatusListByStatusCode("010508");// 备案审核未通过的

		applys.addAll(applys2);
		applys.addAll(applys3);
		System.out.println("tofillingContracts:" + applys.size());
		context.put("applys", applys);
		return "listtofillingContractApplysSuccess";
	}

	public String fillingContract() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBaseByApplyId(this.apply.getId());
		this.contractfilling = ContractfillingDao.newContractfilling(this.contractBase);
		context.put("contractfilling", this.contractfilling);
		List<Contractfillingimg> contractfillingimgs = ContractfillingimgDao.getContractfillingimgListByContractNo(this.contractfilling.getContractNo());
		context.put("contractfillingimgs", contractfillingimgs);
		return "fillingContractSuccess";
	}

	public String listtoreviewContractfillingApplys() {
		ActionContext context = ActionContext.getContext();
		List<Applystatus> applys = ApplystatusDao.getApplystatusListByStatusCode("010506"); // 已提交备案信息，等待审核的
		System.out.println("tofillingContracts:" + applys.size());
		context.put("applys", applys);
		return "listtoreviewContractfillingApplysSuccess";
	}

	public String viewContractfilling() {
		ActionContext context = ActionContext.getContext();
		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		context.put("contractfilling", this.contractfilling);
		return "viewContractfillingSuccess";
	}

	public String uploadContractfillingimgs() {
		ActionContext context = ActionContext.getContext();
		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		context.put("contractfilling", this.contractfilling);
		return "uploadContractfillingimgsSuccess";
	}

	public String submitContractfilling() {
		ActionContext context = ActionContext.getContext();
		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		Workflow.setCurrentStatus(this.contractfilling.getApply(), "010506", "01050601");
		return listtoreviewContractfillingApplys();
	}

	public String updateReviewContractfilling() {
		ActionContext context = ActionContext.getContext();
		this.contractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		context.put("contractfilling", this.contractfilling);
		return "updateReviewContractfillingSuccess";
	}

	public String reviewContractfilling() {
		ActionContext context = ActionContext.getContext();
		this.contractfilling = ContractfillingDao.getContractfillingByApplyId(this.apply.getId());
		context.put("contractfilling", this.contractfilling);
		return "reviewContractfillingSuccess";
	}

	public String saveReviewContractfilling() {
		ActionContext context = ActionContext.getContext();

		Contractfilling savedContractfilling = ContractfillingDao.getContractfilling(this.contractfilling.getId());
		ObjUpdate.update(savedContractfilling, this.contractfilling);
		this.contractfilling = savedContractfilling;
		ContractfillingDao.updateContractfilling(this.contractfilling);

		if (this.contractfilling.getReviewResult().contentEquals("0")) {
			ContractfillingDao.setContrctfillingNo(this.contractfilling);
			Date approveDate = new Date();
			this.contractfilling.setApprovedDate(approveDate);
			Workflow.setCurrentStatus(this.contractfilling.getApply(), "010507", "01050701");
		} else {
			Workflow.setCurrentStatus(this.contractfilling.getApply(), "010508", "01050801");
		}

		context.put("contractfilling", this.contractfilling);
		return listtoreviewContractApplys();
	}
}
