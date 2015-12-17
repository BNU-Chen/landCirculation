package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ConpensationAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private ConpensationRecord	conpensationRecord;

	public ConpensationRecord getConpensationRecord() {
		return conpensationRecord;
	}

	public void setConpensationRecord(ConpensationRecord conpensationRecord) {
		this.conpensationRecord = conpensationRecord;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listtoconpensateContract() {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null)
			return "CurrenUserpersonIsNull";
		context.put("passedContractfillings", ContractfillingDao.getPassedContractfillingsByTransfeeId(userPerson.getId()));
		return "listtoconpensationContractSuccess";
	}

	public String modifyConpensationRecord() {
		ActionContext context = ActionContext.getContext();
		System.out.println("this.conpensationRecord.getContractNo():" + this.conpensationRecord.getContractNo());
		ConpensationRecord conpensationRecord = ConpensationRecordDao.getConpensationRecordByContractNo(this.conpensationRecord.getContractNo());
		System.out.println("conpensationRecord:" + this.conpensationRecord.getContractNo());

		if (conpensationRecord == null) {// 没有补偿备案记录
			conpensationRecord = new ConpensationRecord();
			conpensationRecord.setContractNo(this.conpensationRecord.getContractNo());
			ConpensationRecordDao.saveConpensationRecord(conpensationRecord);
		}

		this.conpensationRecord = ConpensationRecordDao.getConpensationRecordByContractNo(this.conpensationRecord.getContractNo());
		context.put("conpensationRecord", conpensationRecord);
		return "modifyConpensationRecordSuccess";
	}

	public String viewConpensationRecord() {
		ActionContext context = ActionContext.getContext();
		ConpensationRecord conpensationRecord = ConpensationRecordDao.getConpensationRecordByContractNo(this.conpensationRecord.getContractNo());
		
		context.put("conpensationRecord", conpensationRecord);
		return "viewConpensationRecordSuccess";
	}

	public String viewConpensationContract() {
		ActionContext context = ActionContext.getContext();
		Contractfilling contractfilling = ContractfillingDao.getContractfillingByContractNo(this.conpensationRecord.getContractNo());
		context.put("contractfilling", contractfilling);
		return "viewConpensationContractSuccess";
	}

}
