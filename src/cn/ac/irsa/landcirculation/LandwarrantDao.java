package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class LandwarrantDao {
	public static List<Landwarrant> getLandwarrantList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Landwarrant> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Landwarrant.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Landwarrant>) criteria.list();
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

	public static Landwarrant getLandwarrant(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Landwarrant landwarrant = (Landwarrant) session.get(Landwarrant.class, id);
			session.getTransaction().commit();
			return landwarrant;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}
	public static Landwarrant getLandwarrantByApplyId(int applyId) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Landwarrant.class);
			criteria.add(Restrictions.eq("applyId",applyId ));
			List<Landwarrant> landwarrants=criteria.list();
			session.getTransaction().commit();
			if(!landwarrants.isEmpty())
			{
				Landwarrant landwarrant=landwarrants.get(0);
				return landwarrant;
			}
			return null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Landwarrant deleteLandwarrant(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Landwarrant landwarrant = (Landwarrant) session.get(Landwarrant.class, id);

			session.delete(landwarrant);
			session.getTransaction().commit();
			return landwarrant;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateLandwarrant(Landwarrant landwarrant) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(landwarrant);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveLandwarrant(Landwarrant landwarrant) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(landwarrant);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
