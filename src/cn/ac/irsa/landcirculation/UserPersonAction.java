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
		// System.out.println("前台传过来的ID号:" + this.userPerson.getUserIdcode());
		ActionContext context = ActionContext.getContext();
		System.out.println("userPeron.userType：" + userPerson.getUserType());
		System.out.println("userPeron.userCategory：" + userPerson.getUserCategory());
		System.out.println("userPeron.userIdtype：" + userPerson.getUserIdtype());

		UserPerson userPerson = UserPersonDao.exit(this.userPerson.getUserIdcode());

		if (userPerson == null) {
			this.userPerson.setStatus("100");
			UserPersonDao.saveUserPerson(this.userPerson);// 保证用户信息
			this.userPerson = UserPersonDao.getUserPersonByUserIdcode(this.userPerson.getUserIdcode());
			this.userPerson = UserPersonDao.login(this.userPerson);// 用新注册的用户登录，获取用户系统ID

			context.getSession().put("CurrentUserPerson", this.userPerson);
			context.put("CurrentUserPerson", this.userPerson);// 首页显示当前用户信息用

			System.out.println("当前用户是：" + this.userPerson.getUserName());

			return SUCCESS;
		} else {

			String msgResponse = "尊敬的用户:<p>" + "&nbsp;&nbsp;&nbsp;&nbsp;您输入的<b>【" + userPerson.getUserIdtypeName() + "】</b>号码：<b>【" + userPerson.getUserIdcode() + " 】</b>已经被注册，不能重复注册。注册用户名称为<b>【" + userPerson.getUserName() + "】</b>。您可直接登录。忘记密码请与系统管理员联系。<p>" + "&nbsp;&nbsp;&nbsp;&nbsp;如您确信输入的身份证号码没错，且确信没有注册过，请与系统管理员联系。";
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
			// System.out.println("当前用户姓名：" + userPerson.getUserName());

			context.getSession().put("CurrentUserPerson", userPerson);
			context.put("CurrentUserPerson", userPerson);// 首页显示当前用户信息用
			System.out.println("当前用户姓名：" + userPerson.getUserName());
			System.out.println("当前用户Id号：" + userPerson.getUserIdcode());

			String msgLoginError = "";
			context.put("MsgLoginError", msgLoginError);

			return SUCCESS;
		} else {
			String msgLoginError = "信息提示：用户标识号码与密码不匹配！请重试！";
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

			String msgResponse = "尊敬的" + this.userPerson.getUserName() + "用户(身份证号码：" + this.userPerson.getUserIdcode() + "):\n恭喜您，密码修改成功！\n";
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
			String msgResponse = "非常抱歉，会话已超时，请重新登录！\n";
			context.put("MsgResponse", msgResponse);
			return "CurrenUserpersonIsNull";
		}

		if (userPerson != null) {
			context.put("userPerson", userPerson);
			return "viewUserPeronSuccess";
		} else {
			String msgResponse = "非常抱歉，出错了，请与系统管理员联系！\n";
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
		String msgResponse = "尊敬的" + this.userPerson.getUserName() + "用户(身份证号码：" + this.userPerson.getUserIdcode() + "):\n恭喜您，用户信息修改成功！\n";
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

		String msgResponse = "尊敬的" + this.userPerson.getUserName() + "用户(身份证号码：" + this.userPerson.getUserIdcode() + "):\n恭喜您，您的审核信息已成功提交！\n";

		context.put("MsgResponse", msgResponse);

		return "addReviewUserpersonSuccess";
	}

	public String test() throws Exception {
		ActionContext context = ActionContext.getContext();
		return "test";
	}

}
