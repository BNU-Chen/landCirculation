package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CodeTownAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	public List<CodeTown>		lstCodeTown;
	public String				countyCode;

	public List<CodeTown> getLstCodeTown() {
		return lstCodeTown;
	}

	public void setLstCodeTown(List<CodeTown> lstCodeTown) {
		this.lstCodeTown = lstCodeTown;
	}

	public String getCountyCode() {
		return countyCode;
	}

	public void setCountyCode(String countyCode) {
		this.countyCode = countyCode;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listTownByCountyCode() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("countyCode:" + this.countyCode);
		this.lstCodeTown = CodeTownDao.getCodeTownListByCountyCode(this.countyCode);
		ActionContext context = ActionContext.getContext();
		System.out.println("town Nuber:" + this.lstCodeTown.size());
		context.put("lstCodeTown", lstCodeTown);
		return SUCCESS;
	}
}
