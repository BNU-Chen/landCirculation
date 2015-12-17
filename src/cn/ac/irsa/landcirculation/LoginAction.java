package cn.ac.irsa.landcirculation;
import com.opensymphony.xwork2.ActionSupport;
public class LoginAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	//重载execute()方法，返回SUCCESS
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	//redirect()方法，返回ERROR
	public String errorTest() throws Exception {
		return "error";
	}
}
