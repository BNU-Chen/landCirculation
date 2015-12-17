package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CodeCountyAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	public List<CodeCounty>		lstCodeCounty;
	public String				cityCode;

	public List<CodeCounty> getLstCodeCounty() {
		return lstCodeCounty;
	}

	public void setLstCodeCounty(List<CodeCounty> lstCodeCounty) {
		this.lstCodeCounty = lstCodeCounty;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listCountyByCityCode() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("cityCode:" + this.cityCode);
		this.lstCodeCounty = CodeCountyDao.getCodeCountyListByCityCode(this.cityCode);
		ActionContext context = ActionContext.getContext();
		System.out.println("county Nuber:" + this.lstCodeCounty.size());
		context.put("lstCodeCounty", lstCodeCounty);
		return SUCCESS;
	}
}
