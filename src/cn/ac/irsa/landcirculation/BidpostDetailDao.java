package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class BidpostDetailDao {
	public static List<BidpostDetail> getBidpostDetailList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<BidpostDetail> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(BidpostDetail.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<BidpostDetail>) criteria.list();
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

	public static BidpostDetail getBidpostDetail(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		try {
			session.beginTransaction();
			BidpostDetail bidpostDetail = (BidpostDetail) session.get(BidpostDetail.class, id);
			session.getTransaction().commit();
			return bidpostDetail;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static BidpostDetail deleteBidpostDetail(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			BidpostDetail bidpostDetail = (BidpostDetail) session.get(BidpostDetail.class, id);

			session.delete(bidpostDetail);
			session.getTransaction().commit();
			return bidpostDetail;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateBidpostDetail(BidpostDetail bidpostDetail) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(bidpostDetail);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveBidpostDetail(BidpostDetail bidpostDetail) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(bidpostDetail);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<BidpostDetail> getBidpostDetailListByBidpostId(int postId) {// 根据公告ID查申请明细
		// TODO Auto-generated method stub
		Bidpost bidpost = BidpostDao.getBidpost(postId);
		Session session = HibernateUtil.getSession();
		List<BidpostDetail> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(BidpostDetail.class);
			criteria.add(Restrictions.eq("bidpost", bidpost));
			criteria.addOrder(Order.asc("id"));
			list = (List<BidpostDetail>) criteria.list();
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

	public static BidpostDetail getBidpostDetailByApplyId(int applyId) {// 根据流转请ID查BidpostDetail
		// TODO Auto-generated method stub
		Apply apply = ApplyDao.getApply(applyId);
		Session session = HibernateUtil.getSession();
		List<BidpostDetail> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(BidpostDetail.class);
			criteria.add(Restrictions.eq("apply", apply));
			criteria.addOrder(Order.asc("id"));
			list = (List<BidpostDetail>) criteria.list();
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
