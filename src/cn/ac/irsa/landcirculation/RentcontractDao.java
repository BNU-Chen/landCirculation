package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class RentcontractDao {
	public static List<Rentcontract> getRentcontractList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Rentcontract> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Rentcontract.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Rentcontract>) criteria.list();
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

	public static Rentcontract getRentcontract(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Rentcontract rentcontract = (Rentcontract) session.get(Rentcontract.class, id);
			session.getTransaction().commit();
			return rentcontract;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Rentcontract getRentcontractByApplyId(int applyId) {
		// TODO Auto-generated method stub

		Apply applyTmp = ApplyDao.getApply(applyId);
		/*
		 * Criteria criteria = session.createCriteria(Rentcontract.class);
		 * criteria.add(Restrictions.eq("apply", applyTmp));
		 */

		Session session = HibernateUtil.getSession();
		List<Rentcontract> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Rentcontract.class);
			criteria.add(Restrictions.eq("apply", applyTmp));
			criteria.addOrder(Order.asc("id"));
			list = (List<Rentcontract>) criteria.list();
			session.getTransaction().commit();
			if (!list.isEmpty()) {

				Rentcontract rentcontract = list.get(0);
				System.out.println("查到了合同！");
				System.out.println("合同ID" + rentcontract.getId());
				return rentcontract;
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

	public static Rentcontract deleteRentcontract(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Rentcontract rentcontract = (Rentcontract) session.get(Rentcontract.class, id);

			session.delete(rentcontract);
			session.getTransaction().commit();
			return rentcontract;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateRentcontract(Rentcontract rentcontract) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(rentcontract);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveRentcontract(Rentcontract rentcontract) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(rentcontract);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
