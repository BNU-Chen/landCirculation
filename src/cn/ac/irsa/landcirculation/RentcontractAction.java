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

		Apply currentApply = ApplyDao.getApply(this.apply.getId());// ��ȡ��ǰ������Ϣ
		this.rentcontract.setApply(currentApply);// ��ӳ����ͬ�Ķ�Ӧ��������Ϣ

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
		if (savedRentcontract == null) {//û�к�ͬ��Ϣ
			RentcontractDao.saveRentcontract(this.rentcontract);
		}else//���к�ͬ��Ϣ
		{
			ObjUpdate.update(savedRentcontract,this.rentcontract);
			this.rentcontract=savedRentcontract;
			RentcontractDao.updateRentcontract(this.rentcontract);
		}
		
		context.put("Apply", ApplyDao.getApply(this.apply.getId()));
		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));//��ȡ���µĺ�ͬ��Ϣ
		return "saveRentcontractSuccess";
	}

}
