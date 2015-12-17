package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ApplypostResponseDao {
	public static List<ApplypostResponse> getApplypostResponseList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ApplypostResponse> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ApplypostResponse.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<ApplypostResponse>) criteria.list();
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

	public static List<ApplypostResponse> getTodealApplypostResponseList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ApplypostResponse> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ApplypostResponse.class);
			criteria.add(Restrictions.isNull("dealType"));// 没有处理的反馈
			criteria.addOrder(Order.asc("id"));
			list = (List<ApplypostResponse>) criteria.list();
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
	
	public static List<ApplypostResponse> getApplypostResponseByApplyId(int applyId) {
		// TODO Auto-generated method stub
		Apply apply=ApplyDao.getApply(applyId);
		Session session = HibernateUtil.getSession();
		List<ApplypostResponse> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ApplypostResponse.class);
			criteria.add(Restrictions.eq("apply",apply));// 没有处理的反馈
			criteria.addOrder(Order.asc("id"));
			list = (List<ApplypostResponse>) criteria.list();
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

	public static ApplypostResponse getApplypostResponse(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ApplypostResponse applypostResponse = (ApplypostResponse) session.get(ApplypostResponse.class, id);
			session.getTransaction().commit();
			return applypostResponse;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ApplypostResponse deleteApplypostResponse(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ApplypostResponse applypostResponse = (ApplypostResponse) session.get(ApplypostResponse.class, id);

			session.delete(applypostResponse);
			session.getTransaction().commit();
			return applypostResponse;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateApplypostResponse(ApplypostResponse applypostResponse) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(applypostResponse);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveApplypostResponse(ApplypostResponse applypostResponse) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(applypostResponse);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
