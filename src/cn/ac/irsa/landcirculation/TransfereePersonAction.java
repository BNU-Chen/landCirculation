package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TransfereePersonAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;

	Apply						apply;
	TransfereePerson			transfereePerson;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public TransfereePerson getTransfereePerson() {
		return transfereePerson;
	}

	public void setTransfereePerson(TransfereePerson transfereePerson) {
		this.transfereePerson = transfereePerson;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String viewTransferee() {
		ActionContext context = ActionContext.getContext();
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());// 查询当前申请的合同信息
		if (rentcontract == null)// 没有合同记录,新建空合同空录
		{
			System.out.println("没有合同记录！");
			rentcontract = new Rentcontract();
			rentcontract.setApply(this.apply);
			rentcontract.setTransfereeType(1);

			/*
			 * TransfereePerson transfereePerson = new TransfereePerson();
			 * TransfereePersonDao.saveTransfereePerson(transfereePerson);
			 * rentcontract
			 * .setTransfereePerson(TransfereePersonDao.getTransfereePersonNew
			 * ());
			 */
			RentcontractDao.saveRentcontract(rentcontract);
			rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		}

		/*
		 * this.transfereePerson = rentcontract.getTransfereePerson();//
		 * 查询最新受让人信息 context.put("TransfereePerson", this.transfereePerson);
		 */
		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));
		System.out.println("TransfereePersonAction:合同记录ID:" + rentcontract.getId());
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		TransfereePerson transfereePerson = rentcontract.getTransfereePerson();
		if (transfereePerson == null) {
			/*
			 * transfereePerson = new TransfereePerson();// 新建空受让人
			 * TransfereePersonDao.saveTransfereePerson(transfereePerson);//
			 * 保存空受让人
			 * 
			 * rentcontract.setTransfereePerson(TransfereePersonDao.
			 * getTransfereePersonNew());// 将空受让人关联到合同
			 * RentcontractDao.updateRentcontract(rentcontract);// 更新合同信息
			 * rentcontract =
			 * RentcontractDao.getRentcontractByApplyId(this.apply.getId());//
			 * 重新提取合同信息
			 * 
			 * transfereePerson =
			 * TransfereePersonDao.getTransfereePerson(rentcontract
			 * .getTransfereePerson().getId());// 提取受让人信息
			 */
			transfereePerson = new TransfereePerson();// 新建空受让人
		} else {
			transfereePerson = TransfereePersonDao.getTransfereePerson(transfereePerson.getId());
		}
		context.put("transfereePerson", transfereePerson);

		System.out.println("transfereePerson.name??" + transfereePerson.getTransfereeName());
		System.out.println("有没有问题？");
		return "viewTransfereeSuccess";
	}

	public String modifyTransferee() {
		ActionContext context = ActionContext.getContext();
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());// 查询当前申请的合同信息
		if (rentcontract == null)// 没有合同记录,新建空合同空录
		{
			System.out.println("没有合同记录！");
			rentcontract = new Rentcontract();
			rentcontract.setApply(this.apply);
			rentcontract.setTransfereeType(1);
			RentcontractDao.saveRentcontract(rentcontract);
			rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		}

		this.transfereePerson = rentcontract.getTransfereePerson();
		transfereePerson = TransfereePersonDao.getTransfereePerson(transfereePerson.getId());// 查询最新受让人信息
		context.put("TransfereePerson", this.transfereePerson);

		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));
		System.out.println("TransfereePersonAction:合同记录ID:" + rentcontract.getId());
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		return "modifyTransfereeSuccess";
	}

	public String saveTransferee() {
		ActionContext context = ActionContext.getContext();

		Rentcontract savedRentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		System.out.println("TransfereePersonAction:获取合同信息");
		if (savedRentcontract == null)// 没有合同记录,新建空合同空录
		{
			TransfereePersonDao.saveTransfereePerson(this.transfereePerson);

			System.out.println("没有合同记录！");
			Rentcontract rentcontract = new Rentcontract();
			rentcontract.setApply(this.apply);
			rentcontract.setTransfereeType(1);
			RentcontractDao.saveRentcontract(rentcontract);
			rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		} else {
			System.out.println("有合同信息！");
			TransfereePerson savedTransfereePerson = savedRentcontract.getTransfereePerson();

			if (savedTransfereePerson == null)// 没有承租人信息记录
			{
				TransfereePersonDao.saveTransfereePerson(this.transfereePerson);// 保存承租人信息
				System.out.println("save操作没有出错！");
				savedRentcontract.setTransfereePerson(TransfereePersonDao.getTransfereePersonByTransfereeIdcode(this.transfereePerson.getTransfereeIdcode()));
				RentcontractDao.updateRentcontract(savedRentcontract);// 更新合同信息
			} else// 有承租人信息记录
			{
				System.out.println("有承租人信息！");
				System.out.println("transfereePerson.address:" + this.transfereePerson.getTransfereeAddress());
				savedTransfereePerson = TransfereePersonDao.getTransfereePerson(savedRentcontract.getTransfereePerson().getId());
				ObjUpdate.update(savedTransfereePerson, this.transfereePerson);
				TransfereePersonDao.updateTransfereePerson(savedTransfereePerson);// 更新承租人信息
				System.out.println("更新承租人信息！");
			}
			RentcontractDao.updateRentcontract(savedRentcontract);
		}
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		context.put("rentcontract", rentcontract);

		this.transfereePerson = rentcontract.getTransfereePerson();
		this.transfereePerson = TransfereePersonDao.getTransfereePerson(this.transfereePerson.getId());// 查询最新受让人信息
		context.put("transfereePerson", this.transfereePerson);

		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		return "saveTransfereeSuccess";
	}
}
