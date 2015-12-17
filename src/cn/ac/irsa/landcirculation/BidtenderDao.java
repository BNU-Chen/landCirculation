package cn.ac.irsa.landcirculation;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class BidtenderDao {
	public static List<Bidtender> getBidtenderList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Bidtender> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidtender.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidtender>) criteria.list();
			session.getTransaction().commit();

			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public static Bidtender getBidtender(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidtender bidtender = (Bidtender) session.get(Bidtender.class, id);
			session.getTransaction().commit();
			return bidtender;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Bidtender deleteBidtender(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidtender bidtender = (Bidtender) session.get(Bidtender.class, id);

			session.delete(bidtender);
			session.getTransaction().commit();
			return bidtender;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateBidtender(Bidtender bidtender) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(bidtender);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveBidtender(Bidtender bidtender) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(bidtender);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static Bidtender getBidtenderByBidenrollId(int bidenrollId) {
		// TODO Auto-generated method stub
		Bidenroll bidenroll = BidenrollDao.getBidenroll(bidenrollId);
		Bidtender bidtender;
		Session session = HibernateUtil.getSession();

		List<Bidtender> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidtender.class);
			criteria.add(Restrictions.eq("bidenroll", bidenroll));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidtender>) criteria.list();
			session.getTransaction().commit();
			if (list.size() > 0) {
				bidtender = list.get(0);
			} else {
				bidtender = BidtenderDao.newBidtender(bidenrollId);
				session = HibernateUtil.getSession();
			}
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
		return bidtender;
	}

	public static Bidtender newBidtender(int bidenrollId) {
		Bidtender bidtender = new Bidtender();
		Bidenroll bidenroll = BidenrollDao.getBidenroll(bidenrollId);
		bidtender.setBidenroll(bidenroll);
		bidtender.setEnrollNo(bidenroll.getEnrollNo());
		bidtender.setBidpost(BidpostDao.getBidpost(bidenroll.getBidpost().getId()));
		UserPerson bidder = UserPersonDao.getUserPerson(bidenroll.getUserPersonByBidderId().getId());
		bidtender.setUserPerson(bidder);
		bidtender.setUserPerson(bidenroll.getUserPersonByBidderId());
		bidtender.setBidderIdcode(bidenroll.getBidderIdcode());
		bidtender.setBidderName(bidder.getUserName());
		bidtender.setStatus("0100");
		BidtenderDao.saveBidtender(bidtender);

		Session session = HibernateUtil.getSession();
		List<Bidtender> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidtender.class);
			criteria.add(Restrictions.eq("bidenroll", bidenroll));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidtender>) criteria.list();
			session.getTransaction().commit();
			if (list.size() > 0) {
				return list.get(0);
			} else {
				return null;
			}
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static int computeTotalPrice(Bidtender bidtender) {
		Bidpost bidpost = BidpostDao.getBidpost(bidtender.getBidpost().getId());
		double totalprice = bidtender.getDrylandprice() * (bidpost.getDrylandRgArea()) + bidtender.getPaddyfieldprice() * (bidpost.getPaddyfieldRgArea());
		return (int) (totalprice + 0.5);
	}

	public static Bidtender submitBidtender(int bidtenderId) {
		// TODO Auto-generated method stub
		Bidtender bidtender = BidtenderDao.getBidtender(bidtenderId);
		bidtender.setStatus("0101");// 电子标书已提交
		BidtenderDao.updateBidtender(bidtender);
		Bidenroll bidenroll = BidenrollDao.getBidenroll(bidtender.getBidenroll().getId());
		bidenroll.setStatus("0301");
		bidenroll.setStatusMsg("电子招标标书已提交，等待开标。");
		BidenrollDao.updateBidenroll(bidenroll);
		return bidtender;

	}

	public static List<Bidtender> getToopenBidtendersByBidpostId(int bidpostId) {
		// TODO Auto-generated method stub
		Bidpost bidpost = BidpostDao.getBidpost(bidpostId);
		Session session = HibernateUtil.getSession();

		List<Bidtender> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidtender.class);
			criteria.add(Restrictions.eq("bidpost", bidpost));
			criteria.add(Restrictions.eq("status", "0101"));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidtender>) criteria.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public static void saveBidtenderReview(Bidtender bidtender) {

		Bidtender savedBidtender = BidtenderDao.getBidtender(bidtender.getId());
		Bidenroll bidenroll = BidenrollDao.getBidenroll(savedBidtender.getBidenroll().getId());
		switch (bidtender.getReviewResult())
		{
			case "0":
			{
				bidenroll.setStatus("0401");
				bidenroll.setStatusMsg("竞标书形式审核通过！");
				bidtender.setStatus("0201");
				// System.out.println("审核通过！");
				break;
			}
			case "1":
			{
				bidenroll.setStatus("0402");
				bidenroll.setStatusMsg("竟标书形式审核未通过");
				bidtender.setStatus("0202");
				break;
			}
		}
		ObjUpdate.update(savedBidtender, bidtender);
		BidtenderDao.updateBidtender(savedBidtender);// 修改标书记录状态

		BidenrollDao.updateBidenroll(bidenroll);// 修改投标报名记录状态
		Bidpost bidpost = BidpostDao.getBidpost(savedBidtender.getBidpost().getId());
		List<Bidtender> bidtenders = BidtenderDao.getToopenBidtendersByBidpostId(bidpost.getId());
		if (bidtenders.size() == 0) {
			bidpost.setStatus("03");// 开标已完成
			BidpostDao.updateBidpost(bidpost);
		}
	}

	public static List<Bidtender> getTocloseBidtendersByBidpostId(int bidpostId) {
		Bidpost bidpost = BidpostDao.getBidpost(bidpostId);
		Session session = HibernateUtil.getSession();

		List<Bidtender> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidtender.class);
			criteria.add(Restrictions.eq("bidpost", bidpost));
			criteria.add(Restrictions.eq("status", "0201"));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidtender>) criteria.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static void publishBidwinnerpost(Bidtender bidtender) {

		bidtender = BidtenderDao.getBidtender(bidtender.getId());
		List<Bidtender> bidtenders = getTocloseBidtendersByBidpostId(bidtender.getBidpost().getId());
		Bidtender tmpBidtender;
		Bidenroll tmpBidenroll;
		System.out.println("list Size:" + bidtenders.size());
		for (int i = 0; i < bidtenders.size(); i++) {
			tmpBidtender = bidtenders.get(i);
			if (tmpBidtender.getId() == bidtender.getId()) {
				tmpBidtender.setStatus("0301");// 已中标
				BidtenderDao.updateBidtender(tmpBidtender);
				tmpBidenroll = BidenrollDao.getBidenroll(tmpBidtender.getBidenroll().getId());
				tmpBidenroll.setStatus("0501");
				tmpBidenroll.setStatusMsg("竞标结果已发布，中标");
				BidenrollDao.updateBidenroll(tmpBidenroll);
			} else {
				tmpBidtender.setStatus("0302");// 未中标
				BidtenderDao.updateBidtender(tmpBidtender);
				tmpBidenroll = BidenrollDao.getBidenroll(tmpBidtender.getBidenroll().getId());
				tmpBidenroll.setStatus("0502");
				tmpBidenroll.setStatusMsg("竞标结果已发布，未中标");
				BidenrollDao.updateBidenroll(tmpBidenroll);
			}
		}
		
		Bidpost bidpost=BidpostDao.getBidpost(bidtender.getBidpost().getId());
		bidpost.setStatus("04");
		BidpostDao.updateBidpost(bidpost);//修改招标公告状态
	}
}
