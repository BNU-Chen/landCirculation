package cn.ac.irsa.landcirculation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class BidwinnerpostDao {
	public static List<Bidwinnerpost> getBidwinnerpostList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Bidwinnerpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidwinnerpost.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidwinnerpost>) criteria.list();
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

	public static Bidwinnerpost getBidwinnerpost(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidwinnerpost bidwinnerpost = (Bidwinnerpost) session.get(Bidwinnerpost.class, id);
			session.getTransaction().commit();
			return bidwinnerpost;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Bidwinnerpost deleteBidwinnerpost(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidwinnerpost bidwinnerpost = (Bidwinnerpost) session.get(Bidwinnerpost.class, id);

			session.delete(bidwinnerpost);
			session.getTransaction().commit();
			return bidwinnerpost;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateBidwinnerpost(Bidwinnerpost bidwinnerpost) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(bidwinnerpost);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveBidwinnerpost(Bidwinnerpost bidwinnerpost) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(bidwinnerpost);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void newBidwinnerpost(Bidtender bidtender) {
		bidtender = BidtenderDao.getBidtender(bidtender.getId());
		Bidpost bidpost = BidpostDao.getBidpost(bidtender.getBidpost().getId());
		Bidenroll bidenroll = BidenrollDao.getBidenroll(bidtender.getBidenroll().getId());
		Bidwinnerpost bidwinnerpost = new Bidwinnerpost();
		bidwinnerpost.setPostId(bidpost.getId());
		bidwinnerpost.setPostNo(bidpost.getPostNo());
		bidwinnerpost.setPosterId(bidpost.getUserPerson().getId());
		bidwinnerpost.setPosterName(bidpost.getPosterName());
		bidwinnerpost.setLandRgArea(bidpost.getLandRgArea());
		bidwinnerpost.setDrylandRgArea(bidpost.getDrylandRgArea());
		bidwinnerpost.setPaddyfieldRgArea(bidpost.getPaddyfieldRgArea());
		bidwinnerpost.setBidType(bidpost.getBidType());
		bidwinnerpost.setBidTypename(bidpost.getBidTypename());
		bidwinnerpost.setDrylandBaseprice(bidpost.getDrylandBaseprice());
		bidwinnerpost.setPaddyfieldBaseprice(bidpost.getPaddyfieldBaseprice());
		bidwinnerpost.setDeposit(bidpost.getDeposit());
		bidwinnerpost.setPublishDate(bidpost.getPublishDate());
		bidwinnerpost.setApplyEndDate(bidpost.getApplyEndDate());
		bidwinnerpost.setBidDate(bidpost.getBidDate());
		
		bidwinnerpost.setBidenrollId(bidenroll.getId());
		bidwinnerpost.setBidderId(bidenroll.getUserPersonByBidderId().getId());
		bidwinnerpost.setPicIdcode(bidenroll.getPicIdcode());
		bidwinnerpost.setPicName(bidenroll.getPicName());
		bidwinnerpost.setPicTel(bidenroll.getPicTel());
		bidwinnerpost.setPicEmail(bidenroll.getPicEmail());
		bidwinnerpost.setPicAddress(bidenroll.getPicAddress());
		
		bidwinnerpost.setBidtenderId(bidtender.getId());
		bidwinnerpost.setBidderIdcode(bidtender.getBidderIdcode());
		bidwinnerpost.setBidderName(bidtender.getBidderName());
		bidwinnerpost.setEnrollNo(bidtender.getEnrollNo());
		bidwinnerpost.setBidderName(bidtender.getBidderName());
		bidwinnerpost.setDrylandprice(bidtender.getDrylandprice());
		bidwinnerpost.setPaddyfieldprice(bidtender.getPaddyfieldprice());
		bidwinnerpost.setTotalprice(bidtender.getTotalprice());
		bidwinnerpost.setIncreaserate(bidtender.getIncreaserate());
		bidwinnerpost.setTenderFilePathname(bidtender.getTenderFilePathname());
	
		List<BidpostDetail> bidpostDetails = BidpostDetailDao.getBidpostDetailListByBidpostId(bidpost.getId());
		String codeTown = ApplyDao.getApply(bidpostDetails.get(0).getApply().getId()).getLandTown();// 乡镇编码
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		bidwinnerpost.setWinnerpostNo(sdf.format(date) + codeTown + BidpostDao.ComputeBidpostNo());// 设置的Bidpost序号，yyyy+6位行政区划+3位乡镇+5位顺序号
		bidwinnerpost.setWinnerpostPublishdate(date);
		BidwinnerpostDao.saveBidwinnerpost(bidwinnerpost);
	}

	public static String ComputeBidwinnerpostNo() {
		Session session = HibernateUtil.getSession();
		Date today = new Date(), startdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		try {
			startdate = sdf.parse(sdf.format(today));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("当前日期date：" + startdate.toString());
		// System.out.println("当前日期today：" + today);
		List<Bidwinnerpost> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidwinnerpost.class);
			criteria.add(Restrictions.gt("winnerpostpublishdate", startdate));
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();
			return String.format("%05d", list.size());

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static Bidwinnerpost getBidwinnerpostByBidpostId(int bidpostId) {// 根据招标ID查询中标公告
		Session session = HibernateUtil.getSession();
		List<Bidwinnerpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidwinnerpost.class);
			criteria.add(Restrictions.eq("postId", bidpostId));
			criteria.addOrder(Order.desc("id"));
			list = (List<Bidwinnerpost>) criteria.list();
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

	public static Bidwinnerpost getBidwinnerpostByBidpostNo(String bidpostNo) {// 根据招标编号查询中标公告
		Session session = HibernateUtil.getSession();
		List<Bidwinnerpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidwinnerpost.class);
			criteria.add(Restrictions.eq("bidpostNo", bidpostNo));
			criteria.addOrder(Order.desc("id"));
			list = (List<Bidwinnerpost>) criteria.list();
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
}
