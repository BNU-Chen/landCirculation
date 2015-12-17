package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserPersonAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private UserPerson			userPerson;
	private String				newPassword;

	private ReviewUserperson	reviewUserperson;

	public ReviewUserperson getReviewUserperson() {
		return reviewUserperson;
	}

	public void setReviewUserperson(ReviewUserperson reviewUserperson) {
		this.reviewUserperson = reviewUserperson;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public UserPerson getUserPerson() {
		return userPerson;
	}

	public void setUserPerson(UserPerson userPerson) {
		this.userPerson = userPerson;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String addUser() throws Exception {
		// TODO Auto-generated method stub
		// System.out.println("ǰ̨��������ID��:" + this.userPerson.getUserIdcode());
		ActionContext context = ActionContext.getContext();
		System.out.println("userPeron.userType��" + userPerson.getUserType());
		System.out.println("userPeron.userCategory��" + userPerson.getUserCategory());
		System.out.println("userPeron.userIdtype��" + userPerson.getUserIdtype());

		UserPerson userPerson = UserPersonDao.exit(this.userPerson.getUserIdcode());

		if (userPerson == null) {
			this.userPerson.setStatus("100");
			UserPersonDao.saveUserPerson(this.userPerson);// ��֤�û���Ϣ
			this.userPerson = UserPersonDao.getUserPersonByUserIdcode(this.userPerson.getUserIdcode());
			this.userPerson = UserPersonDao.login(this.userPerson);// ����ע����û���¼����ȡ�û�ϵͳID

			context.getSession().put("CurrentUserPerson", this.userPerson);
			context.put("CurrentUserPerson", this.userPerson);// ��ҳ��ʾ��ǰ�û���Ϣ��

			System.out.println("��ǰ�û��ǣ�" + this.userPerson.getUserName());

			return SUCCESS;
		} else {

			String msgResponse = "�𾴵��û�:<p>" + "&nbsp;&nbsp;&nbsp;&nbsp;�������<b>��" + userPerson.getUserIdtypeName() + "��</b>���룺<b>��" + userPerson.getUserIdcode() + " ��</b>�Ѿ���ע�ᣬ�����ظ�ע�ᡣע���û�����Ϊ<b>��" + userPerson.getUserName() + "��</b>������ֱ�ӵ�¼��������������ϵͳ����Ա��ϵ��<p>" + "&nbsp;&nbsp;&nbsp;&nbsp;����ȷ����������֤����û����ȷ��û��ע���������ϵͳ����Ա��ϵ��";
			System.out.println(msgResponse);
			context.put("MsgResponse", msgResponse);
			return "registerError";

		}

	}

	public String login() throws Exception {
		// TODO Auto-generated method stub
		UserPerson userPerson = UserPersonDao.login(this.userPerson);

		ActionContext context = ActionContext.getContext();
		if (userPerson != null) {
			// System.out.println("��ǰ�û�������" + userPerson.getUserName());

			context.getSession().put("CurrentUserPerson", userPerson);
			context.put("CurrentUserPerson", userPerson);// ��ҳ��ʾ��ǰ�û���Ϣ��
			System.out.println("��ǰ�û�������" + userPerson.getUserName());
			System.out.println("��ǰ�û�Id�ţ�" + userPerson.getUserIdcode());

			String msgLoginError = "";
			context.put("MsgLoginError", msgLoginError);

			return SUCCESS;
		} else {
			String msgLoginError = "��Ϣ��ʾ���û���ʶ���������벻ƥ�䣡�����ԣ�";
			context.put("MsgLoginError", msgLoginError);
			return "loginError";
		}
	}

	public String quit() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		context.getSession().put("CurrentUserPerson", null);
		return "quitUserPersonSuccess";
	}

	public String updatePassword() throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson_current = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson_current == null) {
			return "CurrenUserpersonIsNull";
		}
		this.userPerson.setId(userPerson_current.getId());
		this.userPerson.setUserIdcode(userPerson_current.getUserIdcode());

		UserPerson userPerson = UserPersonDao.login(this.userPerson);

		if (userPerson != null) {
			this.userPerson = userPerson_current;
			this.userPerson.setPassword(this.newPassword);
			UserPersonDao.updateUserPerson(this.userPerson);

			context.put("CurrentUserPerson", userPerson);

			String msgResponse = "�𾴵�" + this.userPerson.getUserName() + "�û�(���֤���룺" + this.userPerson.getUserIdcode() + "):\n��ϲ���������޸ĳɹ���\n";
			context.put("MsgResponse", msgResponse);
			return "ok";
		} else {
			return "error";
		}
	}

	public String viewUserPerson() throws Exception {
		ActionContext context = ActionContext.getContext();

		try {
			this.userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
			System.out.println("viewPerson:" + userPerson.getId() + userPerson.getUserIdcode() + userPerson.getUserName());
			this.userPerson = UserPersonDao.getUserPerson(this.userPerson.getId());

		} catch (Exception e) {
			String msgResponse = "�ǳ���Ǹ���Ự�ѳ�ʱ�������µ�¼��\n";
			context.put("MsgResponse", msgResponse);
			return "CurrenUserpersonIsNull";
		}

		if (userPerson != null) {
			context.put("userPerson", userPerson);
			return "viewUserPeronSuccess";
		} else {
			String msgResponse = "�ǳ���Ǹ�������ˣ�����ϵͳ����Ա��ϵ��\n";
			context.put("MsgResponse", msgResponse);
			return "CurrenUserpersonIsNull";
		}
	}

	public String modifyUserPerson() throws Exception {
		ActionContext context = ActionContext.getContext();
		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		userPerson = UserPersonDao.getUserPerson(userPerson.getId());
		if (userPerson != null) {
			context.put("userPerson", userPerson);
			return "modifyUserPeronSuccess";
		} else {
			return "CurrenUserpersonIsNull";
		}
	}

	public String updateUserPerson() throws Exception {
		ActionContext context = ActionContext.getContext();

		UserPerson userPerson_current = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson_current == null) {
			return "CurrenUserpersonIsNull";
		}
		this.userPerson.setId(userPerson_current.getId());
		System.out.println("ID:" + this.userPerson.getId());

		userPerson_current = UserPersonDao.getUserPerson(this.userPerson.getId());

		this.userPerson.setUserIdcode(userPerson_current.getUserIdcode());
		this.userPerson.setUserName(userPerson_current.getUserName());
		this.userPerson.setPassword(userPerson_current.getPassword());
		this.userPerson.setStatus("200");

		UserPersonDao.updateUserPerson(this.userPerson);

		context.put("userPerson", userPerson);
		String msgResponse = "�𾴵�" + this.userPerson.getUserName() + "�û�(���֤���룺" + this.userPerson.getUserIdcode() + "):\n��ϲ�����û���Ϣ�޸ĳɹ���\n";
		context.put("MsgResponse", msgResponse);
		// return "ok";
		return "updateUserPersonSuccess";
	}

	public String reviewList() throws Exception {
		ActionContext context = ActionContext.getContext();
		List<UserPerson> reviewList = UserPersonDao.getUserPersonList();
		context.put("reviewList", reviewList);
		return "reviewListSuccess";
	}

	public String reviewUserPerson() throws Exception {
		ActionContext context = ActionContext.getContext();

		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(request.getParameter("userPerson.id"));
		int id = Integer.valueOf(request.getParameter("userPerson.id"));
		System.out.println("ID:" + this.userPerson.getId());
		this.userPerson = UserPersonDao.getUserPerson(id);
		context.put("userPerson", this.userPerson);
		return "reviewUserPersonSuccess";
	}

	public String addReviewUserperson() throws Exception {
		ActionContext context = ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();

		UserPerson reviewedUserperson = UserPersonDao.getUserPerson(Integer.parseInt(request.getParameter("userPerson.id")));

		this.reviewUserperson.setUserPersonByUserPersonId(reviewedUserperson);
		this.reviewUserperson.setUserPersonUserId(reviewedUserperson.getUserIdcode());
		this.reviewUserperson.setUserPersonUserName(reviewedUserperson.getUserName());

		userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");
		if (userPerson == null) {
			return "CurrenUserpersonIsNull";
		}
		this.reviewUserperson.setUserPersonByReviewerId(userPerson);
		this.reviewUserperson.setReviewerUserId(userPerson.getUserIdcode());
		this.reviewUserperson.setReviewerUserName(userPerson.getUserName());

		ReviewUserpersonDao.saveReviewUserperson(this.reviewUserperson);

		// System.out.println("ID:" + this.userPerson.getId());
		// context.put("reviewUserperson", this.reviewUserperson);

		String msgResponse = "�𾴵�" + this.userPerson.getUserName() + "�û�(���֤���룺" + this.userPerson.getUserIdcode() + "):\n��ϲ�������������Ϣ�ѳɹ��ύ��\n";

		context.put("MsgResponse", msgResponse);

		return "addReviewUserpersonSuccess";
	}

	public String test() throws Exception {
		ActionContext context = ActionContext.getContext();
		return "test";
	}

}
