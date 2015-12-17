package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ParcelAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private Apply apply;
	private Parcel parcel;

	public Parcel getParcel() {
		return parcel;
	}

	public void setParcel(Parcel parcel) {
		this.parcel = parcel;
	}

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String newParcel() {

		Parcel parcel = new Parcel();

		/*
		 * HttpServletRequest request = ServletActionContext.getRequest();
		 * System.out.println("test:"+request.getParameter("apply.id"));
		 * this.apply.setId(Integer.parseInt(request.getParameter("apply.id")));
		 */
/*		System.out.println("Test前");
		System.out.println("this.apply:" + this.apply.getId());
		System.out.println("Test后");*/
		this.apply=ApplyDao.getApply(this.apply.getId());
		parcel.setApply(this.apply);
		parcel.setParcelCode(this.apply.getLandVillage());
/*
		System.out.println("新建地块：this.apply.id" + parcel.getApply().getId());*/

		ParcelDao.saveParcel(parcel);
		ActionContext context = ActionContext.getContext();

		context.put("parcel", parcel);
		return "newParcelSuccess";
	}

	public String updateParcel() {
		this.parcel = ParcelDao.getParcel(this.parcel.getId());
		ActionContext context = ActionContext.getContext();
		context.put("parcel", this.parcel);
		context.put("Apply", this.parcel.getApply());
		return "updateParcelSuccess";
	}

	public String deleteParcel() {
		this.parcel = ParcelDao.getParcel(this.parcel.getId());
		ParcelDao.deleteParcel(this.parcel.getId());
		this.apply = ApplyDao.getApply(this.parcel.getApply().getId());
		List<Parcel> parcels = ParcelDao.getParcelListByApplyId(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("parcels", parcels);
		context.put("Apply", this.apply);
		return "deleteParcelSuccess";
	}

	public String saveParcel() {
		ParcelDao.updateParcel(this.parcel);
		ActionContext context = ActionContext.getContext();
		this.apply=this.parcel.getApply();
		this.apply=ApplyDao.getApply(this.parcel.getApply().getId());
		context.put("Apply", this.apply);
		
/*		List<Parcel> parcels = ParcelDao.getParcelListByApplyId(this.apply.getId());
		context.put("parcels", parcels);*/
		return "saveParcelSuccess";
	}

	public String listParcel() {
		List<Parcel> parcels = ParcelDao.getParcelListByApplyId(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("parcels", parcels);
		context.put("Apply", this.apply);
		return "listParcelSuccess";
	}
}
