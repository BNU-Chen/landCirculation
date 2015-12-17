package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class LandcontractimgDao {
	public static List<Landcontractimg> getLandcontractimgList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Landcontractimg> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Landcontractimg.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Landcontractimg>) criteria.list();
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

	public static List<Landcontractimg> getLandcontractimgByApplyId(Integer applyId) {
		// TODO Auto-generated method stub
		Apply applyTmp = ApplyDao.getApply(applyId);

		List<Landcontractimg> list;
		Session session = HibernateUtil.getSession();
		try {

			session.beginTransaction();
			Criteria criteria = session.createCriteria(Landcontractimg.class);
			criteria.add(Restrictions.eq("apply", applyTmp));
			criteria.addOrder(Order.asc("id"));
			list = (List<Landcontractimg>) criteria.list();
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

	public static Landcontractimg getLandcontractimg(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Landcontractimg landcontractimg = (Landcontractimg) session.get(Landcontractimg.class, id);
			session.getTransaction().commit();
			return landcontractimg;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Landcontractimg deleteLandcontractimg(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Landcontractimg landcontractimg = (Landcontractimg) session.get(Landcontractimg.class, id);

			session.delete(landcontractimg);
			session.getTransaction().commit();
			return landcontractimg;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateLandcontractimg(Landcontractimg landcontractimg) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(landcontractimg);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveLandcontractimg(Landcontractimg landcontractimg) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(landcontractimg);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<Landcontractimg> getLandcontractimgsByLandcontractCode(String landcontractCode) {
		Session session = HibernateUtil.getSession();
		List<Landcontractimg> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Landcontractimg.class);
			criteria.add(Restrictions.eq("contractCode", landcontractCode));
			criteria.addOrder(Order.asc("pgno"));
			list = (List<Landcontractimg>) criteria.list();
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
