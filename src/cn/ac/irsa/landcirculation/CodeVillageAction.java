package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CodeVillageAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	public List<CodeVillage>		lstCodeVillage;
	public String				townCode;

	public List<CodeVillage> getLstCodeVillage() {
		return lstCodeVillage;
	}

	public void setLstCodeVillage(List<CodeVillage> lstCodeVillage) {
		this.lstCodeVillage = lstCodeVillage;
	}

	public String getCountyCode() {
		return townCode;
	}

	public void setCountyCode(String townCode) {
		this.townCode = townCode;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listVillageByTownCode() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("townCode:" + this.townCode);
		this.lstCodeVillage = CodeVillageDao.getCodeVillageListByTownCode(this.townCode);
		ActionContext context = ActionContext.getContext();
		System.out.println("town Nuber:" + this.lstCodeVillage.size());
		context.put("lstCodeVillage", lstCodeVillage);
		return SUCCESS;
	}
}
