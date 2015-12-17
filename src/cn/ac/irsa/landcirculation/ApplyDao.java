package cn.ac.irsa.landcirculation;

import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ApplyDao {
	public static List<Apply> getApplyList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Apply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Apply.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Apply>) criteria.list();
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

	public static List<Apply> getApplyList(String userPerson_Idcode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Apply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Apply.class);
			criteria.add(Restrictions.eq("applierIdcode", userPerson_Idcode));
			criteria.addOrder(Order.asc("id"));
			System.out.println("传入查询的身份证号" + userPerson_Idcode);
			list = (List<Apply>) criteria.list();
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

	public static List<Apply> getApplyListByCurrentStatusCode(String currentStatusCode) {
		// TODO Auto-generated method stub

		Statusdef statusdef = StatusdefDao.getStatusdefByStatusCode(currentStatusCode);
		Session session = HibernateUtil.getSession();
		List<Apply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Apply.class);
			criteria.add(Restrictions.eq("statusdef", statusdef));
			criteria.addOrder(Order.asc("id"));
			list = (List<Apply>) criteria.list();
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

	public static Apply getApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Apply apply = (Apply) session.get(Apply.class, id);
			session.getTransaction().commit();
			return apply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Apply deleteApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Apply apply = (Apply) session.get(Apply.class, id);

			session.delete(apply);
			session.getTransaction().commit();
			return apply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateApply(Apply apply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(apply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveApply(Apply apply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(apply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static Apply newApplyBase(UserPerson userPerson) {
		Apply apply = new Apply();
		apply.setUserPerson(userPerson);
		apply.setApplierIdcode(userPerson.getUserIdcode());
		apply.setApplierUserName(userPerson.getUserName());
		apply.setPicIdcode(userPerson.getUserIdcode());
		apply.setPicName(userPerson.getUserName());
		apply.setPicTel(userPerson.getMobilephone());
		apply.setPicAddress(userPerson.getAddress());
		apply.setPicEmail(userPerson.getEmail());
		Date date = new Date();
		apply.setApplyDate(date);
		return apply;
	}

	public static String computeAddress(Apply apply) {
		// TODO Auto-generated method stub
		String strAddress = "";

		String rgCode = apply.getLandVillage();
		System.out.println("rgCode:" + rgCode);
		if (!rgCode.equals("-1") && !rgCode.equals("") && !rgCode.isEmpty()) {
			strAddress += CodeProvinceDao.getCodeProvinceNameByCode(rgCode.substring(0, 2));
			String codeProvince = rgCode.substring(0, 2);
			System.out.println("codeProvince:" + codeProvince);
			if (codeProvince.equals("50")) {
				System.out.println("codepronvince==50");
			}
			if (!codeProvince.equals("11") && !codeProvince.equals("12") && !codeProvince.equals("31") && !codeProvince.equals("50")) {
				System.out.println("执行了！");
				strAddress += CodeCityDao.getCodeCityNameByCode((rgCode).substring(0, 4));
			}
			strAddress += CodeCountyDao.getCodeCountyNameByCode(rgCode.substring(0, 6));
			strAddress += CodeTownDao.getCodeTownNameByCode(rgCode.substring(0, 9));
			strAddress += CodeVillageDao.getCodeVillageNameByCode(rgCode.substring(0, 12));
			System.out.println("landAddress:" + strAddress);
		}
		return strAddress;
	}
}
