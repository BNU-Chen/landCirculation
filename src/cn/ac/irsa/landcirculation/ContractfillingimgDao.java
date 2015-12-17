package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ContractfillingimgDao {
	public static List<Contractfillingimg> getContractfillingimgList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Contractfillingimg> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfillingimg.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Contractfillingimg>) criteria.list();
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

	public static Contractfillingimg getContractfillingimg(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Contractfillingimg contractfillingimg = (Contractfillingimg) session.get(Contractfillingimg.class, id);
			session.getTransaction().commit();
			return contractfillingimg;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Contractfillingimg deleteContractfillingimg(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Contractfillingimg contractfillingimg = (Contractfillingimg) session.get(Contractfillingimg.class, id);

			session.delete(contractfillingimg);
			session.getTransaction().commit();
			return contractfillingimg;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateContractfillingimg(Contractfillingimg contractfillingimg) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(contractfillingimg);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveContractfillingimg(Contractfillingimg contractfillingimg) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(contractfillingimg);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<Contractfillingimg> getContractfillingimgListByContractNo(String strContractNo) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Contractfillingimg> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfillingimg.class);
			criteria.add(Restrictions.eq("contractNo", strContractNo));
			criteria.addOrder(Order.asc("contractfillingimgSn"));
			list = (List<Contractfillingimg>) criteria.list();
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

	public static List<Contractfillingimg> getContractfillingimgListByContractfilling(Contractfilling contractfilling,boolean asc) {
		// TODO Auto-generated method stub
		contractfilling = ContractfillingDao.getContractfilling(contractfilling.getId());
		Session session = HibernateUtil.getSession();
		List<Contractfillingimg> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfillingimg.class);
			criteria.add(Restrictions.eq("contractfilling", contractfilling));
			if(asc){
			criteria.addOrder(Order.asc("contractfillingimgSn"));
			}else{
				criteria.addOrder(Order.desc("contractfillingimgSn"));
			}
			
			list = (List<Contractfillingimg>) criteria.list();
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
