package cn.ac.irsa.landcirculation;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ParcelDao {
	public static List<Parcel> getParcelList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Parcel> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Parcel.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Parcel>) criteria.list();
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
	
	public static List<Parcel> getParcelListByApplyId(int apply_id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Parcel> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Parcel.class);
			criteria.add(Restrictions.eq("apply.id",apply_id));
			criteria.addOrder(Order.desc("id"));
			list = (List<Parcel>) criteria.list();
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
	public static Parcel getParcel(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Parcel parcel = (Parcel) session.get(
					Parcel.class, id);
			session.getTransaction().commit();
			return parcel;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Parcel deleteParcel(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Parcel parcel = (Parcel) session.get(
					Parcel.class, id);

			session.delete(parcel);
			session.getTransaction().commit();
			return parcel;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateParcel(Parcel parcel) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(parcel);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveParcel(Parcel parcel) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(parcel);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}

