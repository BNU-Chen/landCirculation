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
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());// ��ѯ��ǰ����ĺ�ͬ��Ϣ
		if (rentcontract == null)// û�к�ͬ��¼,�½��պ�ͬ��¼
		{
			System.out.println("û�к�ͬ��¼��");
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
		 * ��ѯ������������Ϣ context.put("TransfereePerson", this.transfereePerson);
		 */
		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));
		System.out.println("TransfereePersonAction:��ͬ��¼ID:" + rentcontract.getId());
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		TransfereePerson transfereePerson = rentcontract.getTransfereePerson();
		if (transfereePerson == null) {
			/*
			 * transfereePerson = new TransfereePerson();// �½���������
			 * TransfereePersonDao.saveTransfereePerson(transfereePerson);//
			 * �����������
			 * 
			 * rentcontract.setTransfereePerson(TransfereePersonDao.
			 * getTransfereePersonNew());// ���������˹�������ͬ
			 * RentcontractDao.updateRentcontract(rentcontract);// ���º�ͬ��Ϣ
			 * rentcontract =
			 * RentcontractDao.getRentcontractByApplyId(this.apply.getId());//
			 * ������ȡ��ͬ��Ϣ
			 * 
			 * transfereePerson =
			 * TransfereePersonDao.getTransfereePerson(rentcontract
			 * .getTransfereePerson().getId());// ��ȡ��������Ϣ
			 */
			transfereePerson = new TransfereePerson();// �½���������
		} else {
			transfereePerson = TransfereePersonDao.getTransfereePerson(transfereePerson.getId());
		}
		context.put("transfereePerson", transfereePerson);

		System.out.println("transfereePerson.name??" + transfereePerson.getTransfereeName());
		System.out.println("��û�����⣿");
		return "viewTransfereeSuccess";
	}

	public String modifyTransferee() {
		ActionContext context = ActionContext.getContext();
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());// ��ѯ��ǰ����ĺ�ͬ��Ϣ
		if (rentcontract == null)// û�к�ͬ��¼,�½��պ�ͬ��¼
		{
			System.out.println("û�к�ͬ��¼��");
			rentcontract = new Rentcontract();
			rentcontract.setApply(this.apply);
			rentcontract.setTransfereeType(1);
			RentcontractDao.saveRentcontract(rentcontract);
			rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		}

		this.transfereePerson = rentcontract.getTransfereePerson();
		transfereePerson = TransfereePersonDao.getTransfereePerson(transfereePerson.getId());// ��ѯ������������Ϣ
		context.put("TransfereePerson", this.transfereePerson);

		context.put("rentcontract", RentcontractDao.getRentcontractByApplyId(this.apply.getId()));
		System.out.println("TransfereePersonAction:��ͬ��¼ID:" + rentcontract.getId());
		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		return "modifyTransfereeSuccess";
	}

	public String saveTransferee() {
		ActionContext context = ActionContext.getContext();

		Rentcontract savedRentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		System.out.println("TransfereePersonAction:��ȡ��ͬ��Ϣ");
		if (savedRentcontract == null)// û�к�ͬ��¼,�½��պ�ͬ��¼
		{
			TransfereePersonDao.saveTransfereePerson(this.transfereePerson);

			System.out.println("û�к�ͬ��¼��");
			Rentcontract rentcontract = new Rentcontract();
			rentcontract.setApply(this.apply);
			rentcontract.setTransfereeType(1);
			RentcontractDao.saveRentcontract(rentcontract);
			rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		} else {
			System.out.println("�к�ͬ��Ϣ��");
			TransfereePerson savedTransfereePerson = savedRentcontract.getTransfereePerson();

			if (savedTransfereePerson == null)// û�г�������Ϣ��¼
			{
				TransfereePersonDao.saveTransfereePerson(this.transfereePerson);// �����������Ϣ
				System.out.println("save����û�г���");
				savedRentcontract.setTransfereePerson(TransfereePersonDao.getTransfereePersonByTransfereeIdcode(this.transfereePerson.getTransfereeIdcode()));
				RentcontractDao.updateRentcontract(savedRentcontract);// ���º�ͬ��Ϣ
			} else// �г�������Ϣ��¼
			{
				System.out.println("�г�������Ϣ��");
				System.out.println("transfereePerson.address:" + this.transfereePerson.getTransfereeAddress());
				savedTransfereePerson = TransfereePersonDao.getTransfereePerson(savedRentcontract.getTransfereePerson().getId());
				ObjUpdate.update(savedTransfereePerson, this.transfereePerson);
				TransfereePersonDao.updateTransfereePerson(savedTransfereePerson);// ���³�������Ϣ
				System.out.println("���³�������Ϣ��");
			}
			RentcontractDao.updateRentcontract(savedRentcontract);
		}
		Rentcontract rentcontract = RentcontractDao.getRentcontractByApplyId(this.apply.getId());
		context.put("rentcontract", rentcontract);

		this.transfereePerson = rentcontract.getTransfereePerson();
		this.transfereePerson = TransfereePersonDao.getTransfereePerson(this.transfereePerson.getId());// ��ѯ������������Ϣ
		context.put("transfereePerson", this.transfereePerson);

		this.apply = ApplyDao.getApply(this.apply.getId());
		context.put("Apply", this.apply);

		return "saveTransfereeSuccess";
	}
}
