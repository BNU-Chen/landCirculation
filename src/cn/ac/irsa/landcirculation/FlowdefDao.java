package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class FlowdefDao {
	public static List<Flowdef> getFlowdefList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Flowdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Flowdef.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Flowdef>) criteria.list();
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

	public static Flowdef getFlowdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Flowdef flowdef = (Flowdef) session.get(Flowdef.class, id);
			session.getTransaction().commit();
			return flowdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Flowdef getFlowdefByFlowCode(String flowCode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Flowdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Flowdef.class);
			criteria.add(Restrictions.eq("flowCode", flowCode));
			criteria.addOrder(Order.asc("id"));
			list = (List<Flowdef>) criteria.list();
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

	public static Flowdef deleteFlowdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Flowdef flowdef = (Flowdef) session.get(Flowdef.class, id);

			session.delete(flowdef);
			session.getTransaction().commit();
			return flowdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateFlowdef(Flowdef flowdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(flowdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveFlowdef(Flowdef flowdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(flowdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
