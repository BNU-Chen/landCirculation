package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class CodeCityDao {
	public static List<CodeCity> getCodeCityList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<CodeCity> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeCity.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<CodeCity>) criteria.list();
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

	public static CodeCity getCodeCity(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeCity codeCity = (CodeCity) session.get(CodeCity.class, id);
			session.getTransaction().commit();
			return codeCity;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static CodeCity deleteCodeCity(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			CodeCity codeCity = (CodeCity) session.get(CodeCity.class, id);

			session.delete(codeCity);
			session.getTransaction().commit();
			return codeCity;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateCodeCity(CodeCity codeCity) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(codeCity);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveCodeCity(CodeCity codeCity) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(codeCity);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<CodeCity> getCodeCityListByProvinceCode(String provinceCode) {
		// TODO Auto-generated method stub
		System.out.println("provinceCode in action:" + provinceCode);
		Session session = HibernateUtil.getSession();
		List<CodeCity> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(CodeCity.class);
			criteria.add(Restrictions.eq("provinceCode", provinceCode));
			criteria.addOrder(Order.asc("code"));
			list = (List<CodeCity>) criteria.list();
			session.getTransaction().commit();
			System.out.println("city number inaction:" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public static String getCodeCityNameByCode(String code) {
		// TODO Auto-generated method stub
		//System.out.println("cityCode:"+code);
		Session session = HibernateUtil.getSession();
		List<CodeCity> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(CodeCity.class);
			criteria.add(Restrictions.eq("code", code));
			criteria.addOrder(Order.desc("id"));
			list = (List <CodeCity>) criteria.list();
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
