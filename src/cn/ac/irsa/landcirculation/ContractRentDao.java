package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ContractRentDao {
	public static List<ContractRent> getContractRentList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ContractRent> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ContractRent.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<ContractRent>) criteria.list();
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

	public static ContractRent getContractRent(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ContractRent contractRent = (ContractRent) session.get(ContractRent.class, id);
			session.getTransaction().commit();
			return contractRent;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ContractRent deleteContractRent(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ContractRent contractRent = (ContractRent) session.get(ContractRent.class, id);

			session.delete(contractRent);
			session.getTransaction().commit();
			return contractRent;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateContractRent(ContractRent contractRent) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(contractRent);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveContractRent(ContractRent contractRent) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(contractRent);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static ContractRent getContractRentByContractBaseId(int contractBaseId) {
		ContractBase contractBase = ContractBaseDao.getContractBase(contractBaseId);
		Session session = HibernateUtil.getSession();
		List<ContractRent> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ContractRent.class);
			criteria.add(Restrictions.eq("contractBase", contractBase));
			criteria.addOrder(Order.desc("id"));
			list = (List<ContractRent>) criteria.list();
			session.getTransaction().commit();
			if (list.size() > 0) {
				return list.get(0);
			}
			return null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
}
