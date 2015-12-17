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

public class ContractRentAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Apply				apply;
	private ContractBase		contractBase;
	private ContractRent		contractRent;
	private String				htmlURL;

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

	public ContractRent getContractRent() {
		return contractRent;
	}

	public void setContractRent(ContractRent contractRent) {
		this.contractRent = contractRent;
	}

	public String getHtmlURL() {
		return htmlURL;
	}

	public void setHtmlURL(String htmlURL) {
		this.htmlURL = htmlURL;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String viewContract_rent0() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent0Success";
	}

	public String viewContract_rent1() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		context.put("parcels", ParcelDao.getParcelListByApplyId(contractBase.getApply().getId()));
		return "viewContract_rent1Success";
	}

	public String viewContract_rent2() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		System.out.println("duration:" + contractBase.getDuration());
		this.contractRent = ContractRentDao.getContractRentByContractBaseId(contractBase.getId());
		context.put("contractRent", this.contractRent);
		return "viewContract_rent2Success";
	}

	public String saveContract_rent2() {
		ActionContext context = ActionContext.getContext();

		// ContractRent
		// savedContractRent=ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		// savedContractRent=ContractRentDao.getContractRent(savedContractRent.getId());

		ContractBase savedContractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		ObjUpdate.update(savedContractBase, this.contractBase);
		ContractBaseDao.updateContractBase(savedContractBase);
		this.contractBase = savedContractBase;

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		this.contractRent = ContractRentDao.getContractRentByContractBaseId(contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", this.contractRent);
		return viewContract_rent2();
	}

	public String viewContract_rent3() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		this.contractRent = ContractRentDao.getContractRentByContractBaseId(contractBase.getId());
		if(this.contractRent.getPayType()==1&& this.contractRent.getPayType13()!=null)
		{
			this.contractRent.setPayType13string(MyMoney.valuesToString(this.contractRent.getPayType13()));
			ContractRentDao.updateContractRent(this.contractRent);
		}
		context.put("contractBase", this.contractBase);
		context.put("contractRent", this.contractRent);
		return "viewContract_rent3Success";
	}

	public String saveContract_rent3() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);
		this.contractRent = savedContractRent;
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", this.contractRent);
		return viewContract_rent3();
	}

	public String viewContract_rent4() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent4Success";
	}

	public String saveContract_rent4() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent4();
	}

	public String viewContract_rent5() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent5Success";
	}

	public String saveContract_rent5() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent5();
	}

	public String viewContract_rent6() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent6Success";
	}

	public String saveContract_rent6() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent6();
	}

	public String viewContract_rent7() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent7Success";
	}

	public String saveContract_rent7() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent7();
	}

	public String viewContract_rent8() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent8Success";
	}

	public String saveContract_rent8() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent8();
	}

	public String viewContract_rent9() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent9Success";
	}

	public String saveContract_rent9() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent9();
	}

	public String viewContract_rent10() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent10Success";
	}

	public String saveContract_rent10() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent10();
	}

	public String viewContract_rent11() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent11Success";
	}

	public String saveContract_rent11() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent11();
	}

	public String viewContract_rent12() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent12Success";
	}

	public String saveContract_rent12() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent12();
	}

	public String viewContract_rent13() {
		ActionContext context = ActionContext.getContext();
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(contractBase.getId()));
		return "viewContract_rent13Success";
	}

	public String saveContract_rent13() {
		ActionContext context = ActionContext.getContext();

		ContractRent savedContractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		ObjUpdate.update(savedContractRent, this.contractRent);
		ContractRentDao.updateContractRent(savedContractRent);

		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId()));
		return viewContract_rent13();
	}

	public String printContract_rent() {
		ActionContext context = ActionContext.getContext();
		//ContractBaseDao.setContrctNo(this.contractBase);
		this.contractBase = ContractBaseDao.getContractBase(this.contractBase.getId());
		this.contractRent = ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		context.put("contractBase", this.contractBase);
		context.put("contractRent", this.contractRent);
		List<Parcel> parcels=ParcelDao.getParcelListByApplyId(contractBase.getApply().getId());
		if(parcels.size()<10)
		{
			Parcel parcel=new Parcel();
			for(int i=parcels.size();i<10;i++)
			parcels.add(parcel);
		}
		context.put("parcels",parcels );
		return "printContract_rentSuccess";
	}

	public String toPdf() throws Exception {
		ActionContext context = ActionContext.getContext();
		// ContractBase contractBase =
		// ContractBaseDao.getContractBase(this.contractBase.getId());
		// ContractRent contractRent =
		// ContractRentDao.getContractRentByContractBaseId(this.contractBase.getId());
		// context.put("contractBase", contractBase);
		// context.put("contractRent", contractRent);
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("request.getServletPath():" + request.getServerName());

		// this.htmlURL="http://"+request.getServerName()+":"+request.getServerPort()+this.htmlURL;
		System.out.println("this.htmlURL:" + this.htmlURL);
		// ExportPdf.exportPdfFile(this.htmlURL);
		//ExportPdf2.export2Pdf();
		return "SUCCESS";
	}

}
