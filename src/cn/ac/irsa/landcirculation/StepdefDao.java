package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class StepdefDao {
	public static List<Stepdef> getStepdefList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Stepdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Stepdef.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Stepdef>) criteria.list();
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

	public static Stepdef getStepdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Stepdef stepdef = (Stepdef) session.get(Stepdef.class, id);
			session.getTransaction().commit();
			return stepdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}
	public static Stepdef getStepdefByStepCode(String stepCode) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		List<Stepdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Stepdef.class);
			criteria.add(Restrictions.eq("stepCode", stepCode));
			criteria.addOrder(Order.asc("id"));
			list = (List<Stepdef>) criteria.list();
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
	public static Stepdef deleteStepdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Stepdef stepdef = (Stepdef) session.get(Stepdef.class, id);

			session.delete(stepdef);
			session.getTransaction().commit();
			return stepdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateStepdef(Stepdef stepdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(stepdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveStepdef(Stepdef stepdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(stepdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
