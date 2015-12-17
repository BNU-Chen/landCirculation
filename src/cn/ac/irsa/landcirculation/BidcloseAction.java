package cn.ac.irsa.landcirculation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BidcloseAction extends ActionSupport {
	private static final long	serialVersionUID	= 1L;
	private Bidpost				bidpost;
	private Bidtender			bidtender;

	public Bidpost getBidpost() {
		return bidpost;
	}

	public void setBidpost(Bidpost bidpost) {
		this.bidpost = bidpost;
	}

	public Bidtender getBidtender() {
		return bidtender;
	}

	public void setBidtender(Bidtender bidtender) {
		this.bidtender = bidtender;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String listTocloseBidpost() {
		ActionContext context = ActionContext.getContext();
		context.put("tocloseBidposts", BidpostDao.getTocloseBidpost());
		return "listTocloseBidpostSuccess";
	}

	public String listTocloseBidtender() {
		ActionContext context = ActionContext.getContext();
		List<Bidtender> bidtenders = BidtenderDao.getTocloseBidtendersByBidpostId(this.bidpost.getId());
		context.put("tocloseBidtenders", bidtenders);
		return "listTocloseBidtenderSuccess";
	}

	public String publishBidwinnerpost() {
		ActionContext context = ActionContext.getContext();
		System.out.println("bidtender ID:"+this.bidtender.getId());
		BidtenderDao.publishBidwinnerpost(this.bidtender);//���¾����顢�����������б깫��״̬
		BidwinnerpostDao.newBidwinnerpost(this.bidtender);//�½��б�����¼
		this.bidpost = BidtenderDao.getBidtender(this.bidtender.getId()).getBidpost();
		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(this.bidpost.getId());
		Apply apply;
		for (int i = 0; i < bidpostDetails.size(); i++)// �޸ľ�����Ŀ �������ת����Ĺ��� ��״̬
		{
			apply = bidpostDetails.get(i).getApply();
			Workflow.setCurrentStatus(apply, "010406", "01040601");
		}
		return listTocloseBidpost();

	}
	public String listClosedBidpost() {
		ActionContext context = ActionContext.getContext();
		context.put("closedBidposts", BidpostDao.getTocloseBidpost());
		return "listClosedBidpostSuccess";
	}
}
