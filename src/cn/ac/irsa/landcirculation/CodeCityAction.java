package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CodeCityAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	public List<CodeCity>		lstCodeCity;
	public String				provinceCode;

	public List<CodeCity> getLstCodeCity() {
		return lstCodeCity;
	}

	public void setLstCodeCity(List<CodeCity> lstCodeCity) {
		this.lstCodeCity = lstCodeCity;
	}

	public String getProvinceCode() {
		return provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listCityByProvinceCode() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("provinceCode:" + this.provinceCode);
		this.lstCodeCity = CodeCityDao.getCodeCityListByProvinceCode(this.provinceCode);
		ActionContext context = ActionContext.getContext();
		System.out.println("city Nuber:" + this.lstCodeCity.size());
		context.put("lstCodeCity", lstCodeCity);
		return SUCCESS;
	}
}
