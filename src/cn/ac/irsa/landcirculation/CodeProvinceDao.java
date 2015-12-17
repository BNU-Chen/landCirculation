package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class CodeProvinceDao {
	public static List<CodeProvince> getCodeProvinceList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeProvince> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeProvince.class);
			criteria.addOrder(Order.asc("code"));
			list = (List<CodeProvince>) criteria.list();
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

	public static CodeProvince getCodeProvince(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeProvince codeProvince = (CodeProvince) session.get(CodeProvince.class, id);
			session.getTransaction().commit();
			return codeProvince;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static CodeProvince deleteCodeProvince(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeProvince codeProvince = (CodeProvince) session.get(CodeProvince.class, id);

			session.delete(codeProvince);
			session.getTransaction().commit();
			return codeProvince;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateCodeProvince(CodeProvince codeProvince) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(codeProvince);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveCodeProvince(CodeProvince codeProvince) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(codeProvince);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
	}

	public static String getCodeProvinceNameByCode(String code) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeProvince> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeProvince.class);
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
