package cn.ac.irsa.landcirculation;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RentcontractAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;

	private Apply				apply;
	private Rentcontract		rentcontract;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public Rentcontract getRentcontract() {
		return rentcontract;
	}

	public void setRentcontract(Rentcontract rentcontract) {
		this.rentcontract = rentcontract;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String viewRentcontract() {
		ActionContext context = ActionContext.getContext();
		context.put("Apply", ApplyDao.getApply(this.apply.getId()));
		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));
		return "viewRentcontractSuccess";
	}

	public String ModifyRentcontract() {
		ActionContext context = ActionContext.getContext();
		context.put("Apply", ApplyDao.getApply(this.apply.getId()));
		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));
		return "modifyRentcontractSuccess";
	}

	public String saveRentcontract() {
		ActionContext context = ActionContext.getContext();

		Apply currentApply = ApplyDao.getApply(this.apply.getId());// 获取当前申请信息
		this.rentcontract.setApply(currentApply);// 添加出租合同的对应的申请信息

		/*
		 * Iterator<Rentcontract> iRentcontract =
		 * currentApply.getRentcontracts().iterator(); Rentcontract
		 * currentRentcontract = new Rentcontract(); if
		 * (iRentcontract.hasNext()) { currentRentcontract =
		 * iRentcontract.next();
		 * this.rentcontract.setId(currentRentcontract.getId());
		 * RentcontractDao.updateRentcontract(this.rentcontract); } else {
		 * RentcontractDao.saveRentcontract(this.rentcontract); }
		 */

		Rentcontract savedRentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		if (savedRentcontract == null) {//没有合同信息
			RentcontractDao.saveRentcontract(this.rentcontract);
		}else//已有合同信息
		{
			ObjUpdate.update(savedRentcontract,this.rentcontract);
			this.rentcontract=savedRentcontract;
			RentcontractDao.updateRentcontract(this.rentcontract);
		}
		
		context.put("Apply", ApplyDao.getApply(this.apply.getId()));
		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));//获取最新的合同信息
		return "saveRentcontractSuccess";
	}

}
