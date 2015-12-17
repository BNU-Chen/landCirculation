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

public class ApplyAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private boolean				confirm;
	private Apply				apply;
	private Rentcontract		rentcontract;
	private Parcel				parcel;
	private Landwarrant			landwarrant;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public boolean isConfirm() {
		return confirm;
	}

	public Landwarrant getLandwarrant() {
		return landwarrant;
	}

	public void setLandwarrant(Landwarrant landwarrant) {
		this.landwarrant = landwarrant;
	}

	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	public Rentcontract getRentcontract() {
		return rentcontract;
	}

	public void setRentcontract(Rentcontract rentcontract) {
		this.rentcontract = rentcontract;
	}

	public Parcel getParcel() {
		return parcel;
	}

	public void setParcel(Parcel parcel) {
		this.parcel = parcel;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String newApply() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);

		// this.apply.setUserPerson(userPerson);
		// this.apply.setApplierIdcode(userPerson.getUserIdcode());
		// this.apply.setApplierUserName(userPerson.getUserName());
		// this.apply.setPicIdcode(userPerson.getUserIdcode());
		// this.apply.setPicName(userPerson.getUserName());
		// this.apply.setPicTel(userPerson.getMobilephone());
		// this.apply.setPicAddress(userPerson.getAddress());
		// this.apply.setPicEmail(userPerson.getEmail());
		//
		// Date date = new Date();
		// this.apply.setApplyDate(date);

		/*
		 * Stepdef stepdef = new Stepdef(); stepdef.setId(1);
		 * apply.setStepdef(stepdef);
		 * 
		 * Statusdef statusdef = new Statusdef(); statusdef.setId(1);
		 * apply.setStatusdef(statusdef);
		 * 
		 * System.out.println("currentStatus:" +
		 * apply.getStatusdef().getStatusDesc());
		 * 
		 * Rtnmsgdef rtnmsgdef = new Rtnmsgdef(); rtnmsgdef.setId(1);
		 * apply.setRtnmsgdef(rtnmsgdef);
		 */
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		return listApply();

	}

	public String listApply() throws Exception {
		// TODO Auto-generated method stub

		/*
		 * ActionContext context = ActionContext.getContext(); UserPerson
		 * userPerson = (UserPerson)
		 * context.getSession().get("CurrentUserPerson");
		 * System.out.println("查询申请列表：" + userPerson.getUserIdcode());
		 * List<Apply> applys =
		 * ApplyDao.getApplyList(userPerson.getUserIdcode());
		 * 
		 * context.put("Applys", applys);
		 */
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";

		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getApplystatusListByApplierIdcode(userPerson.getUserIdcode());
		context.put("Applys", lstApplystatus);
		return "listApplySuccess";
	}

	public String newApply_rent_agreement() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("01");
		this.apply.setCirculationTypeName("出租");
		this.apply.setTransferType("0");
		this.apply.setTransferTypeName("协议流转");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_rent();

	}

	public String newApply_rent_bid() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("01");
		this.apply.setCirculationTypeName("出租");
		this.apply.setTransferType("1");
		this.apply.setTransferTypeName("委托交易");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_rent();

	}

	public String listtoSubmitApply_rent() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());

		// List<Applystatus> lstApplystatus =
		// ApplystatusDao.getApplystatusListByApplierIdcode(userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getApplystatusListByApplierIdcode_circulationType_statusCode(userPerson.getUserIdcode(), "01", "010101");
		context.put("Applys", lstApplystatus);
		return "listApply_rentSuccess";
	}

	public String listSubmitedApply_rent() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getSubmitedApplystatusListByApplierIdcode_circulationType(userPerson.getUserIdcode(), "01");
		context.put("Applys", lstApplystatus);
		return "listApply_rentSuccess";
	}

	// 以下为入股模式

	public String newApply_share_agreement() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("02");
		this.apply.setCirculationTypeName("入股");
		this.apply.setTransferType("0");
		this.apply.setTransferTypeName("协议流转");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_share();

	}

	public String newApply_share_bid() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("02");
		this.apply.setCirculationTypeName("入股");
		this.apply.setTransferType("1");
		this.apply.setTransferTypeName("委托交易");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_share();

	}

	public String listtoSubmitApply_share() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		// List<Applystatus> lstApplystatus =
		// ApplystatusDao.getApplystatusListByApplierIdcode(userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getApplystatusListByApplierIdcode_circulationType_statusCode(userPerson.getUserIdcode(), "02", "010101");
		context.put("Applys", lstApplystatus);
		return "listApply_shareSuccess";
	}

	public String listSubmitedApply_share() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getSubmitedApplystatusListByApplierIdcode_circulationType(userPerson.getUserIdcode(), "02");
		context.put("Applys", lstApplystatus);
		return "listApply_shareSuccess";
	}

	// 以下为转让模式
	public String newApply_assignment_agreement() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("03");
		this.apply.setCirculationTypeName("转让");
		this.apply.setTransferType("0");
		this.apply.setTransferTypeName("协议流转");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_assignment();

	}

	public String newApply_assignment_bid() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("03");
		this.apply.setCirculationTypeName("转让");
		this.apply.setTransferType("1");
		this.apply.setTransferTypeName("委托交易");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_assignment();

	}

	public String listtoSubmitApply_assignment() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());

		// List<Applystatus> lstApplystatus =
		// ApplystatusDao.getApplystatusListByApplierIdcode(userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getApplystatusListByApplierIdcode_circulationType_statusCode(userPerson.getUserIdcode(), "03", "010101");
		context.put("Applys", lstApplystatus);
		return "listApply_assignmentSuccess";
	}

	public String listSubmitedApply_asignment() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getSubmitedApplystatusListByApplierIdcode_circulationType(userPerson.getUserIdcode(), "03");
		context.put("Applys", lstApplystatus);
		return "listApply_assignmentSuccess";
	}

	// 以下为转包模式

	public String newApply_subcontract_agreement() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("04");
		this.apply.setCirculationTypeName("转包");
		this.apply.setTransferType("0");
		this.apply.setTransferTypeName("协议流转");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_subcontract();

	}

	public String newApply_subcontract_bid() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("04");
		this.apply.setCirculationTypeName("转包");
		this.apply.setTransferType("1");
		this.apply.setTransferTypeName("委托交易");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_subcontract();

	}

	public String listtoSubmitApply_subcontract() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		// List<Applystatus> lstApplystatus =
		// ApplystatusDao.getApplystatusListByApplierIdcode(userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getApplystatusListByApplierIdcode_circulationType_statusCode(userPerson.getUserIdcode(), "04", "010101");
		context.put("Applys", lstApplystatus);
		return "listApply_subcontractSuccess";
	}

	public String listSubmitedApply_subcontract() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getSubmitedApplystatusListByApplierIdcode_circulationType(userPerson.getUserIdcode(), "04");
		context.put("Applys", lstApplystatus);
		return "listApply_subcontractSuccess";
	}

	// 以下为互换模式

	public String newApply_exchange_agreement() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("05");
		this.apply.setCirculationTypeName("互换");
		this.apply.setTransferType("0");
		this.apply.setTransferTypeName("协议流转");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_exchange();

	}

	public String newApply_exchange_bid() throws Exception {
		// TODO Auto-generated method stub
		this.apply = new Apply();
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		this.apply = ApplyDao.newApplyBase(userPerson);
		this.apply.setCirculationType("05");
		this.apply.setCirculationTypeName("互换");
		this.apply.setTransferType("1");
		this.apply.setTransferTypeName("委托交易");
		ApplyDao.saveApply(this.apply);
		Workflow.setCurrentStatus(this.apply, "010101", "01010101");
		// return listApply();
		return listtoSubmitApply_exchange();

	}

	public String listtoSubmitApply_exchange() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		// List<Applystatus> lstApplystatus =
		// ApplystatusDao.getApplystatusListByApplierIdcode(userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getApplystatusListByApplierIdcode_circulationType_statusCode(userPerson.getUserIdcode(), "05", "010101");
		context.put("Applys", lstApplystatus);
		return "listApply_exchangeSuccess";
	}

	public String listSubmitedApply_exchange() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("test begin");
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		System.out.println("查询到的申请列表状态属于：" + userPerson.getUserIdcode());
		List<Applystatus> lstApplystatus = ApplystatusDao.getSubmitedApplystatusListByApplierIdcode_circulationType(userPerson.getUserIdcode(), "05");
		context.put("Applys", lstApplystatus);
		return "listApply_exchangeSuccess";
	}

	//
	public String deleteApply() throws Exception {
		// TODO Auto-generated method stub

		this.apply = ApplyDao.getApply(this.apply.getId());
		ApplyDao.deleteApply(this.apply.getId());

		switch (this.apply.getCirculationType())
		{
			case "01":
			{
				return listtoSubmitApply_rent();// 返回未提交出租申请列表
			}
			case "02":
			{
				return listtoSubmitApply_rent();// 返回未提交申请列表
			}
			case "03":
			{
				return listtoSubmitApply_rent();// 返回未提交申请列表
			}
			case "04":
			{
				return listtoSubmitApply_rent();// 返回未提交申请列表
			}
			case "05":
			{
				return listtoSubmitApply_rent();// 返回未提交申请列表
			}
		}
		return "SUCCESS";

	}

	public String updateApply() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		System.out.println("申请列表传过来的ApplyId:" + this.apply.getId());
		
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);//传出申请ID
		
		switch (this.apply.getTransferType())
		{
			case "0":
			{
				switch (this.apply.getCirculationType())
				{
					case "01":
					{
						return "updateApply_rent_agreement";// 导向协调出租申请填报页面
					}
					case "02":
					{
						return "updateApply_share_agreement";// 导向协调入股申请填报页面
					}
					case "03":
					{
						return "updateApply_assignment_agreement";// 导向协调转让申请填报页面
					}
					case "04":
					{
						return "updateApply_subcontract_agreement";// 导向协调转包申请填报页面
					}
					case "05":
					{
						return "updateApply_exchange_agreement";// 导向协调互换申请填报页面
					}
				}
			}
			case "1":
			{
				return "updateApply_bidSuccess";
			}
		}
		return "updateApplySuccess";
	}

	public String saveApply() throws Exception {
		Workflow.setCurrentStatus(this.apply, "010102", "01010201");// 修改工作流状态，进入等待审核
		return listApply();
	}

	public String viewLandinfo() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		System.out.println("landRegionCode:" + this.apply.getLandVillage());
		context.put("Apply", this.apply);
		return "viewLandinfoSuccess";
	}

	public String viewLandAddress() {
		Apply savedApply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", savedApply);
		return "viewLandAddressSuccess";
	}

	public String updateLandAddress() {
		Apply savedApply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", savedApply);
		return "updateLandAddressSuccess";
	}

	public String saveLandAddress() {
		Apply savedApply = ApplyDao.getApply(this.apply.getId());
		if (this.apply.getLandGroup() != null) {
			this.apply.setLandAddress(ApplyDao.computeAddress(this.apply) + this.apply.getLandGroup());
		} else {
			this.apply.setLandAddress(ApplyDao.computeAddress(this.apply));
		}
		ObjUpdate.update(savedApply, this.apply);// 牛博士

		ApplyDao.updateApply(savedApply);
		ActionContext context = ActionContext.getContext();
		context.put("Apply", savedApply);
		return "saveLandAddressSuccess";
	}

	public String viewApplierInfo() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);

		UserPerson applier = UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		context.put("applier", applier);
		return "viewApplierInfoSuccess";
	}

	public String modifyApplierInfo() {
		/*
		 * System.out.println("ModifyApplierInfo:test:");
		 * System.out.println("view传来:apply.id:"+apply.getId());
		 */

		/*
		 * HttpServletRequest request = ServletActionContext.getRequest();
		 * System.out.println("request取值："+request.getParameter("apply.id"));
		 */

		this.apply = ApplyDao.getApply(this.apply.getId());
		UserPerson userPerson = UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		context.put("userPerson", userPerson);
		return "modifyApplierInfoSuccess";
	}

	public String updateApplierInfo() {
		Apply savedApply = ApplyDao.getApply(this.apply.getId());// 获取数据库中存储的Apply信息
		ObjUpdate.update(savedApply, this.apply);// 用前端传过来的值（当前Apply）更新已存储的Apply
		this.apply = savedApply;// 用更新后的Apply更新当前Apply

		ApplyDao.updateApply(this.apply);// 存储更新后的Apply

		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);// 返回更新后的Apply

		return "updateApplierInfoSuccess";
	}

	public String viewRightCheck() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		return "viewRightCheckSuccess";
	}

	public String modifyRightCheck() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		return "modifyRightCheckSuccess";
	}

	public String saveLandRightCheckType() {
		System.out.println("saveLandRightCheckType:TestBegin");
		System.out.println("saveLandRightCheckType:apply.id: " + this.apply.getId());
		System.out.println("getRightAuthType:" + this.apply.getRightAuthType());

		Apply savedApply = ApplyDao.getApply(this.apply.getId());

		if (this.apply.getRightAuthType() == 1) {// 权证
			System.out.println("test:noerror!");
			this.landwarrant = LandwarrantDao.getLandwarrantByApplyId(this.apply.getId());// 查询库中权证记录
			if (this.landwarrant == null) {// 没有权证记录
				this.landwarrant = new Landwarrant();// 新建权证记录
				ObjUpdate.update(savedApply, this.apply);
				this.apply = savedApply;
				this.landwarrant.setApplyId(this.apply.getId());
				this.landwarrant.setUserPerson(this.apply.getUserPerson());
				this.landwarrant.setOwnerIdcode(UserPersonDao.getUserPerson(this.apply.getUserPerson().getId()).getUserName());
				this.landwarrant.setWarrantCode(this.apply.getLandContractCode());
				LandwarrantDao.saveLandwarrant(this.landwarrant);// 保存
				this.landwarrant = LandwarrantDao.getLandwarrantByApplyId(this.apply.getId());// 查询库中权证记录
				this.apply.setLandwarrant(this.landwarrant);
			} else {// 有权证记录
				ObjUpdate.update(savedApply, this.apply);
				this.apply = savedApply;
				LandwarrantDao.updateLandwarrant(this.landwarrant);
			}

		} else {// 合同
			System.out.println("原合同号：" + savedApply.getLandContractCode());
			System.out.println("新合同号：" + this.apply.getLandContractCode());
			// if (this.apply.getLandContractCode() !=
			// savedApply.getLandContractCode())// 新合同号与原合同号不一致
			if (savedApply.getLandContractCode() != null && this.apply.getLandContractCode().equals(savedApply.getLandContractCode())) {
				System.out.println("新合同号与原合同号不一致!");
				List<Landcontractimg> imglst = LandcontractimgDao.getLandcontractimgsByLandcontractCode(savedApply.getLandContractCode());
				for (int i = 0; i < imglst.size(); i++) {
					LandcontractimgDao.deleteLandcontractimg(imglst.get(i).getId());// 删除原合同扫描件
				}
			}
		}

		ObjUpdate.update(savedApply, this.apply);
		this.apply = savedApply;
		ApplyDao.updateApply(this.apply);

		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		System.out.println("saveLandRightCheckType:apply.id: " + this.apply.getId());
		return "saveLandRightCheckTypeSuccess";
	}

	public String viewLandWarrant() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		Landwarrant landwarrant = LandwarrantDao.getLandwarrantByApplyId(this.apply.getId());
		context.put("landwarrant", landwarrant);

		return "viewLandWarrantSuccess";
	}

	public String viewLandContract() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		List<Landcontractimg> landcontractimgs = LandcontractimgDao.getLandcontractimgsByLandcontractCode(this.apply.getLandContractCode());
		context.put("landcontractimgs", landcontractimgs);// 承包合同扫描件列表
		System.out.println("landcontractimgs");
		return "viewLandContractSuccess";
	}

	public String uploadLandContract() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		return "uploadLandContractSuccess";
	}

	public String saveLandContract() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		context.put("Apply", this.apply);
		return "saveLandContractSuccess";
	}

	public String viewRentContract() {
		this.apply = ApplyDao.getApply(this.apply.getId());
		ActionContext context = ActionContext.getContext();
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		context.put("Apply", this.apply);

		context.put("rentcontract", rentcontract);
		return "viewRentContractSuccess";
	}

	public String previewApply() {
		ActionContext context = ActionContext.getContext();
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		UserPerson applier = UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		context.put("applier", applier);
		System.out.println("applieremail:" + applier.getEmail());
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

		if (rentcontract != null) {// 合同不为空
			context.put("rentcontract", rentcontract);
			if (rentcontract.getTransfereePerson() != null) {// 受让人不为空
				TransfereePerson transfereePerson = TransfereePersonDao.getTransfereePerson(rentcontract.getTransfereePerson().getId());
				context.put("transfereePerson", transfereePerson);
			}
		}

		return "previewApplySuccess";
	}

	public String printApply() {
		ActionContext context = ActionContext.getContext();
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		UserPerson applier = UserPersonDao.getUserPerson(this.apply.getUserPerson().getId());
		context.put("applier", applier);
		System.out.println("applieremail:" + applier.getEmail());
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

		if (rentcontract != null) {// 合同不为空
			context.put("rentcontract", rentcontract);
			if (rentcontract.getTransfereePerson() != null) {// 受让人不为空
				TransfereePerson transfereePerson = TransfereePersonDao.getTransfereePerson(rentcontract.getTransfereePerson().getId());
				context.put("transfereePerson", transfereePerson);
			}
		}
		return "printApplySuccess";
	}

}
