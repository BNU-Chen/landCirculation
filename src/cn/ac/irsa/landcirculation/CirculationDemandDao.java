package cn.ac.irsa.landcirculation;

// Generated 2014-10-26 21:21:00 by Hibernate Tools 3.4.0.CR1

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class CirculationDemandDao {
	public static List<CirculationDemand> getCirculationDemandList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CirculationDemand> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CirculationDemand.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<CirculationDemand>) criteria.list();
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

	public static CirculationDemand getCirculationDemand(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CirculationDemand circulationDamand = (CirculationDemand) session.get(CirculationDemand.class, id);
			session.getTransaction().commit();
			return circulationDamand;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static CirculationDemand deleteCirculationDemand(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CirculationDemand circulationDamand = (CirculationDemand) session.get(CirculationDemand.class, id);

			session.delete(circulationDamand);
			session.getTransaction().commit();
			return circulationDamand;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateCirculationDemand(CirculationDemand circulationDamand) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(circulationDamand);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveCirculationDemand(CirculationDemand circulationDamand) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(circulationDamand);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<CirculationDemand> getCirculationDemandListByDemanderId(int demanderId) {
		// TODO Auto-generated method stub
		UserPerson demander = UserPersonDao.getUserPerson(demanderId);
		Session session = HibernateUtil.getSession();
		List<CirculationDemand> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CirculationDemand.class);
			criteria.add(Restrictions.eq("userPerson", demander));
			criteria.addOrder(Order.asc("id"));
			list = (List<CirculationDemand>) criteria.list();
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

	public static List<CirculationDemand> gettoSubmitCirculationDemandListByDemanderId(int demanderId) {
		// TODO Auto-generated method stub
		UserPerson demander = UserPersonDao.getUserPerson(demanderId);
		Session session = HibernateUtil.getSession();
		List<CirculationDemand> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CirculationDemand.class);
			criteria.add(Restrictions.eq("userPerson", demander));
			criteria.add(Restrictions.eq("currentStatusCode", "01"));
			criteria.addOrder(Order.asc("id"));
			list = (List<CirculationDemand>) criteria.list();
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

	public static List<CirculationDemand> getSubmitedCirculationDemandListByDemanderId(int demanderId) {
		// TODO Auto-generated method stub
		UserPerson demander = UserPersonDao.getUserPerson(demanderId);
		Session session = HibernateUtil.getSession();
		List<CirculationDemand> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CirculationDemand.class);
			criteria.add(Restrictions.eq("userPerson", demander));
			criteria.add(Restrictions.ne("currentStatusCode", "01"));
			criteria.addOrder(Order.asc("id"));
			list = (List<CirculationDemand>) criteria.list();
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
