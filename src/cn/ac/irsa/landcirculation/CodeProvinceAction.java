package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CodeProvinceAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	List<CodeProvince>			lstCodeProvince;

	public List<CodeProvince> getLstCodeProvince() {
		return lstCodeProvince;
	}

	public void setLstCodeProvince(List<CodeProvince> lstCodeProvince) {
		this.lstCodeProvince = lstCodeProvince;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listProvinceAll() throws Exception {
		// TODO Auto-generated method stub
		this.lstCodeProvince = CodeProvinceDao.getCodeProvinceList();
		System.out.println("lstCodeProvince:" + this.lstCodeProvince.size());
		ActionContext context = ActionContext.getContext();
		context.put("lstCodeProvince", lstCodeProvince);
		return SUCCESS;
	}
}
