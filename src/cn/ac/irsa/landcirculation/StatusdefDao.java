package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class StatusdefDao {
	public static List<Statusdef> getStatusdefList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Statusdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Statusdef.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Statusdef>) criteria.list();
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

	public static Statusdef getStatusdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Statusdef statusdef = (Statusdef) session.get(Statusdef.class, id);
			session.getTransaction().commit();
			return statusdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Statusdef getStatusdefByStatusCode(String statusCode) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		List<Statusdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Statusdef.class);
			criteria.add(Restrictions.eq("statusCode", statusCode));
			criteria.addOrder(Order.asc("id"));
			list = (List<Statusdef>) criteria.list();
			session.getTransaction().commit();
			if (!list.isEmpty()) {

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

	public static Statusdef deleteStatusdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Statusdef statusdef = (Statusdef) session.get(Statusdef.class, id);

			session.delete(statusdef);
			session.getTransaction().commit();
			return statusdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateStatusdef(Statusdef statusdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(statusdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveStatusdef(Statusdef statusdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(statusdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
