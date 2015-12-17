package cn.ac.irsa.landcirculation;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
// Generated 2014-10-26 21:21:00 by Hibernate Tools 3.4.0.CR1
import com.opensymphony.xwork2.ActionSupport;

public class CirculationDemandAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private CirculationDemand	circulationDemand;

	public CirculationDemand getCirculationDemand() {
		return circulationDemand;
	}

	public void setCirculationDemand(CirculationDemand circulationDemand) {
		this.circulationDemand = circulationDemand;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listAllCirculationDemand() {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");// CurrentUserPerson
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		} // 当前登录用户
		System.out.println("userPerson:" + userPerson.getId());
		context.put("circulationDemands", CirculationDemandDao.getCirculationDemandListByDemanderId(userPerson.getId()));
		return "listtoeditCirculationDemandSuccess";
	}

	public String listSubmitedCirculationDemand() {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");// CurrentUserPerson
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		} // 当前登录用户
		System.out.println("userPerson:" + userPerson.getId());
		context.put("circulationDemands", CirculationDemandDao.getSubmitedCirculationDemandListByDemanderId(userPerson.getId()));
		return "listtoeditCirculationDemandSuccess";
	}

	public String listtoSubmitCirculationDemand() {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");// CurrentUserPerson
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		} // 当前登录用户
		System.out.println("userPerson:" + userPerson.getId());
		context.put("circulationDemands", CirculationDemandDao.gettoSubmitCirculationDemandListByDemanderId(userPerson.getId()));
		return "listtoeditCirculationDemandSuccess";
	}

	public String newCirculationDemand() {
		ActionContext context = ActionContext.getContext();
		this.circulationDemand = new CirculationDemand();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");// CurrentUserPerson
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		} // 当前登录用户
		userPerson = UserPersonDao.getUserPerson(userPerson.getId());// 获取登录用户的完整信息
		System.out.println("userPerson:" + userPerson.getUserName());
		this.circulationDemand.setUserPerson(userPerson);
		this.circulationDemand.setDemanderName(userPerson.getUserName());
		this.circulationDemand.setDemanderType(userPerson.getUserType());
		if (this.circulationDemand.getDemanderType().contentEquals("01")) {
			this.circulationDemand.setDemanderTypeName("身份证");
		} else {
			this.circulationDemand.setDemanderTypeName("机构代码");
		}
		this.circulationDemand.setDemanderIdcode(userPerson.getUserIdcode());
		this.circulationDemand.setDemanderTel(userPerson.getMobilephone());
		this.circulationDemand.setDemanderAddress(userPerson.getAddress());
		this.circulationDemand.setDemanderEmail(userPerson.getEmail());

		this.circulationDemand.setPicIdcode(userPerson.getPicIdcode());
		this.circulationDemand.setPicName(userPerson.getPicName());
		this.circulationDemand.setPicTel(userPerson.getPicTel());
		this.circulationDemand.setPicAddress(userPerson.getPicAddress());
		this.circulationDemand.setPicEmail(userPerson.getPicEmail());
		this.circulationDemand.setSetupDate(new Date());
		this.circulationDemand.setCurrentStatusCode("01");
		this.circulationDemand.setCurrentReturnMsg("已新建，等待完善提交。");
		CirculationDemandDao.saveCirculationDemand(this.circulationDemand);
		this.circulationDemand = CirculationDemandDao.getCirculationDemand(this.circulationDemand.getUserPerson().getId());
		return listtoSubmitCirculationDemand();
	}

	public String modifyCirculationDemand() {
		this.circulationDemand = CirculationDemandDao.getCirculationDemand(this.circulationDemand.getId());
		ActionContext context = ActionContext.getContext();
		context.put("circulationDemand", this.circulationDemand);
		return "modifyCirculationDemandSuccess";
	}

	public String deleteCirculationDemand() {
		CirculationDemandDao.deleteCirculationDemand(this.circulationDemand.getId());
		return listtoSubmitCirculationDemand();
	}

	public String updateCirculationDemand() {
		CirculationDemand savedCirculationDemand = CirculationDemandDao.getCirculationDemand(this.circulationDemand.getId());
		ObjUpdate.update(savedCirculationDemand, this.circulationDemand);
		this.circulationDemand = savedCirculationDemand;
		CirculationDemandDao.updateCirculationDemand(this.circulationDemand);
		ActionContext context = ActionContext.getContext();
		context.put("circulationDemand", this.circulationDemand);
		this.circulationDemand = CirculationDemandDao.getCirculationDemand(this.circulationDemand.getId());
		return "updateCirculationDemandSuccess";
	}

	public String previewCirculationDemand() {
		this.circulationDemand = CirculationDemandDao.getCirculationDemand(this.circulationDemand.getId());
		ActionContext context = ActionContext.getContext();
		context.put("circulationDemand", this.circulationDemand);
		return "previewCirculationDemandSuccess";
	}

	public String submitCirculationDemand() {
		this.circulationDemand = CirculationDemandDao.getCirculationDemand(this.circulationDemand.getId());
		this.circulationDemand.setCurrentStatusCode("02");
		this.circulationDemand.setCurrentReturnMsg("已提交，等待审核。");
		CirculationDemandDao.updateCirculationDemand(this.circulationDemand);
		ActionContext context = ActionContext.getContext();
		context.put("circulationDemand", this.circulationDemand);
		return listtoSubmitCirculationDemand();
	}
}
