package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class CodeCountyDao {
	public static List<CodeCounty> getCodeCountyList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeCounty> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeCounty.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<CodeCounty>) criteria.list();
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

	public static CodeCounty getCodeCounty(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeCounty codeCounty = (CodeCounty) session.get(CodeCounty.class, id);
			session.getTransaction().commit();
			return codeCounty;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static CodeCounty deleteCodeCounty(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeCounty codeCounty = (CodeCounty) session.get(CodeCounty.class, id);

			session.delete(codeCounty);
			session.getTransaction().commit();
			return codeCounty;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateCodeCounty(CodeCounty codeCounty) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(codeCounty);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveCodeCounty(CodeCounty codeCounty) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(codeCounty);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<CodeCounty> getCodeCountyListByCityCode(String cityCode) {
		// TODO Auto-generated method stub
		System.out.println("cityCode in action:" + cityCode);
		Session session = HibernateUtil.getSession();
		List<CodeCounty> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeCounty.class);
			criteria.add(Restrictions.eq("cityCode", cityCode));
			criteria.addOrder(Order.asc("code"));
			list = (List<CodeCounty>) criteria.list();
			session.getTransaction().commit();
			System.out.println("county number inaction:" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public static String getCodeCountyNameByCode(String code) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeCounty> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeCounty.class);
			criteria.add(Restrictions.eq("code", code));
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();

			return list.get(0).getName();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}
}
