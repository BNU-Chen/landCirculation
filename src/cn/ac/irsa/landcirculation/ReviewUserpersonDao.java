package cn.ac.irsa.landcirculation;

import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ReviewUserpersonDao {
	public static List<ReviewUserperson> getReviewUserpersonList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ReviewUserperson> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ReviewUserperson.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<ReviewUserperson>) criteria.list();
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

	public static ReviewUserperson getReviewUserperson(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ReviewUserperson reviewUserperson = (ReviewUserperson) session.get(
					ReviewUserperson.class, id);
			session.getTransaction().commit();
			return reviewUserperson;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ReviewUserperson deleteReviewUserperson(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ReviewUserperson reviewUserperson = (ReviewUserperson) session.get(
					ReviewUserperson.class, id);

			session.delete(reviewUserperson);
			session.getTransaction().commit();
			return reviewUserperson;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateReviewUserperson(ReviewUserperson reviewUserperson) {
		// TODO Auto-generated method stub
		reviewUserperson.setReviewDatetime(new Date());//记录操作日期时间
		
		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(reviewUserperson);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveReviewUserperson(ReviewUserperson reviewUserperson) {
		// TODO Auto-generated method stub
		reviewUserperson.setReviewDatetime(new Date());//记录操作日期时间
		
		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(reviewUserperson);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
