package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ReviewApplyDao {
	public static List<ReviewApply> getReviewApplyList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ReviewApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ReviewApply.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<ReviewApply>) criteria.list();
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

	public static ReviewApply getReviewApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ReviewApply reviewApply = (ReviewApply) session.get(ReviewApply.class, id);
			session.getTransaction().commit();
			return reviewApply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ReviewApply getReviewByApplyId(int applyId) {
		// TODO Auto-generated method stub

		Apply applyTmp = ApplyDao.getApply(applyId);
		List <ReviewApply> list;
		Session session = HibernateUtil.getSession();
		
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ReviewApply.class);
			criteria.add(Restrictions.eq("apply", applyTmp));
			criteria.addOrder(Order.desc("id"));//倒序，最新的在最前面
			list = (List<ReviewApply>) criteria.list();
			session.getTransaction().commit();
			if(!list.isEmpty()){
				return list.get(0);
			}
			else{
				return null;
			}
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ReviewApply deleteReviewApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ReviewApply reviewApply = (ReviewApply) session.get(ReviewApply.class, id);

			session.delete(reviewApply);
			session.getTransaction().commit();
			return reviewApply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateReviewApply(ReviewApply reviewApply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(reviewApply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveReviewApply(ReviewApply reviewApply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(reviewApply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
