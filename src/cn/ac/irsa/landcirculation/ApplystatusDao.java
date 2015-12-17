package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ApplystatusDao {
	public static List<Applystatus> getApplystatusList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Applystatus> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Applystatus.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Applystatus>) criteria.list();
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

	public static List<Applystatus> getApplystatusListByApplierIdcode(String userPerson_Idcode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Applystatus> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Applystatus.class);
			criteria.add(Restrictions.eq("id.applierIdcode", userPerson_Idcode));
			System.out.println("userPerson_Idcode:" + userPerson_Idcode);
			criteria.addOrder(Order.asc("id"));
			list = (List<Applystatus>) criteria.list();
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

	public static List<Applystatus> getApplystatusListByApplierIdcode_circulationType_statusCode(String userPerson_Idcode, String circulationType, String statusCode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Applystatus> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Applystatus.class);
			criteria.add(Restrictions.eq("id.applierIdcode", userPerson_Idcode));
			criteria.add(Restrictions.eq("id.circulationType", circulationType));
			criteria.add(Restrictions.eq("id.statusCode", statusCode));
			System.out.println("userPerson_Idcode:" + userPerson_Idcode);
			criteria.addOrder(Order.asc("id"));
			list = (List<Applystatus>) criteria.list();
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

	public static List<Applystatus> getSubmitedApplystatusListByApplierIdcode_circulationType(String userPerson_Idcode, String circulationType) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Applystatus> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Applystatus.class);
			criteria.add(Restrictions.eq("id.applierIdcode", userPerson_Idcode));
			criteria.add(Restrictions.eq("id.circulationType", circulationType));
			criteria.add(Restrictions.ne("id.statusCode", "010101"));
			System.out.println("userPerson_Idcode:" + userPerson_Idcode);
			criteria.addOrder(Order.asc("id"));
			list = (List<Applystatus>) criteria.list();
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

	public static Applystatus getApplystatus(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Applystatus applystatusId = (Applystatus) session.get(Applystatus.class, id);
			session.getTransaction().commit();
			return applystatusId;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Applystatus deleteApplystatus(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Applystatus applystatusId = (Applystatus) session.get(Applystatus.class, id);

			session.delete(applystatusId);
			session.getTransaction().commit();
			return applystatusId;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateApplystatus(Applystatus applystatusId) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(applystatusId);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveApplystatus(Applystatus applystatusId) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(applystatusId);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<Applystatus> getApplystatusListByTransferType_statusCode(String transferType,String statusCode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Applystatus> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Applystatus.class);
			criteria.add(Restrictions.eq("id.statusCode", statusCode));
			criteria.add(Restrictions.eq("id.transferType", transferType));
			criteria.addOrder(Order.asc("id"));
			list = (List<Applystatus>) criteria.list();
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
	public static List<Applystatus> getApplystatusListByStatusCode(String statusCode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Applystatus> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Applystatus.class);
			criteria.add(Restrictions.eq("id.statusCode", statusCode));
			criteria.addOrder(Order.asc("id"));
			list = (List<Applystatus>) criteria.list();
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
}
