package cn.ac.irsa.landcirculation;

// Generated 2014-11-1 12:32:44 by Hibernate Tools 3.4.0.CR1

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ActionGroupCodeAction extends ActionSupport {
	private static final long		serialVersionUID	= 1L;
	private ActionGroupCode			actionGroupCode;
	private List<ActionGroupCode>	lstActionGroupCode;

	public ActionGroupCode getActionGroupCode() {
		return actionGroupCode;
	}

	public void setActionGroupCode(ActionGroupCode actionGroupCode) {
		this.actionGroupCode = actionGroupCode;
	}

	public List<ActionGroupCode> getLstActionGroupCode() {
		return lstActionGroupCode;
	}

	public void setLstActionGroupCode(List<ActionGroupCode> lstActionGroupCode) {
		this.lstActionGroupCode = lstActionGroupCode;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String getActionGroupCodes() {
		this.lstActionGroupCode=ActionGroupCodeDao.getActionGroupCodeList();
		return SUCCESS;
	}

}
