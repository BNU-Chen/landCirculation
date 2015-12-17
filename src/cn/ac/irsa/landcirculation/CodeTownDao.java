package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class CodeTownDao {
	public static List<CodeTown> getCodeTownList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeTown> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeTown.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<CodeTown>) criteria.list();
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

	public static CodeTown getCodeTown(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeTown codeTown = (CodeTown) session.get(CodeTown.class, id);
			session.getTransaction().commit();
			return codeTown;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static CodeTown deleteCodeTown(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeTown codeTown = (CodeTown) session.get(CodeTown.class, id);

			session.delete(codeTown);
			session.getTransaction().commit();
			return codeTown;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateCodeTown(CodeTown codeTown) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(codeTown);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveCodeTown(CodeTown codeTown) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(codeTown);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<CodeTown> getCodeTownListByCountyCode(String countyCode) {
		// TODO Auto-generated method stub
		System.out.println("countyCode in action:"+countyCode);
		Session session = HibernateUtil.getSession();
		List<CodeTown> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeTown.class);
			criteria.add(Restrictions.eq("countyCode", countyCode));
			criteria.addOrder(Order.asc("code"));
			list = (List<CodeTown>) criteria.list();
			session.getTransaction().commit();
			System.out.println("town number inaction:" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}
	public static String getCodeTownNameByCode(String code) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeTown> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeTown.class);
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
