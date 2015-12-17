package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class CodeVillageDao {
	public static List<CodeVillage> getCodeVillageList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeVillage> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeVillage.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<CodeVillage>) criteria.list();
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

	public static CodeVillage getCodeVillage(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeVillage codeVillage = (CodeVillage) session.get(CodeVillage.class, id);
			session.getTransaction().commit();
			return codeVillage;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static CodeVillage deleteCodeVillage(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeVillage codeVillage = (CodeVillage) session.get(CodeVillage.class, id);

			session.delete(codeVillage);
			session.getTransaction().commit();
			return codeVillage;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateCodeVillage(CodeVillage codeVillage) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(codeVillage);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveCodeVillage(CodeVillage codeVillage) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(codeVillage);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<CodeVillage> getCodeVillageListByTownCode(String townCode) {
		// TODO Auto-generated method stub
		System.out.println("townCode in action:" + townCode);
		Session session = HibernateUtil.getSession();
		List<CodeVillage> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeVillage.class);
			criteria.add(Restrictions.eq("townCode", townCode));
			criteria.addOrder(Order.asc("code"));
			list = (List<CodeVillage>) criteria.list();
			session.getTransaction().commit();
			System.out.println("village number inaction:" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public static String getCodeVillageNameByCode(String code) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeVillage> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeVillage.class);
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
